PostgreSQL unterstützt eine vieltzahl von JSON-Operatoren, von denen einige in diesem Kapitel beschrieben werden. Eine vollständige Liste an Operatoren und Funkionen kann in der [PostgreSQL Dokumentation](https://www.postgresql.org/docs/current/functions-json.html) nachgelesen werden.

# JSON Felder lesen
Daten aus der obersten Objektschicht können mit den Operatoren "->" und "->>" gelesen werden. Nach dem Operator wird entweder der Name des Feldes oder die Positon des Listenglieds das gelesen werden soll angegeben. Operatoren mit nur einem ">" geben das Ergebnis der Operation als JSON bzw. JSONB zurück, bei Operatoren mit zwei ">" werden die Werte als Text zurückgeben.[^2]

Alle Namen aus den JSON Objekten können mit der folgenden Query ausgelesen werden:

```sql
SELECT jsondata->>'name' as "Name" FROM json_table;
```{{execute}}	

Da der "->" Operator wieder ein JSONB Objekt zurückgibt, können die Operatoren auch aufgereiht werden.
```sql	
SELECT jsondata->'adresse'->'straße' as "Straße" FROM json_table;
```{{execute}}

Auf einen Verschachteltes Objekt kann aber auch mit dem "#>" bzw. "#>>" Operator zugegriffen werden. Als Parameter wird dazu eine geordnete Menge an Schlüsseln und Indexen angegeben.
```sql
SELECT jsondata #> '{"adresse", "straße"}' as "Straße" FROM json_table;
```{{execute}}

# Datentyp konvertieren
Wenn einzelne Werte aus einem JSON Objekt gelesen und in der Query weitergenuzt werden, sollten sie in den Passenden Datentyp gecastet werden.
Wird darauf verzichtet sind manche Operationen mit dem Wert nicht möglich. Die folgende Query schlägt zum Beuispiel fehl:
```sql
SELECT jsondata from json_table
WHERE jsondata ->> 'alter' > 30;
```{{execute}}
Der Datentyp kann in PostgreSQL entweder mit dem "::" Operator oder der "CAST()" Funktion geändert werden.
```sql
SELECT jsondata from json_table
WHERE CAST(jsondata ->> 'alter' AS Integer) > 30;
```{{execute}}
Wenn der "::" Operator verwendet wird, müssen gegebenenfalls Klammern gesezt werden.
```sql
SELECT jsondata from json_table
WHERE (jsondata ->> 'alter')::Integer > 30;
```{{execute}}

[^2]: https://www.postgresql.org/docs/14/functions-json.html