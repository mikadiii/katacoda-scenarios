# Einführung
PostgreSQL unterstützt JSON als Datentyp seit der Version 9.2, viele der zugehörigen Funktionen aber erst in der Version 9.3.[^fn1]

PostgreSQL bietet zwei verschiedene Datentypen für JSON an:
- JSON: speichert JSON Objekte als exakte String-Kopien.
- JSONB: speichert JSON Objekte in binärer Form ab, die exakte Formatierung, sowie die Reihenfolge von Einträgen bleibt gegebenenfalls nicht erhalten.

Der JSONB Datentyp ermöglicht dank der optimierten Datenstruktur mehr Funktionalitäten (inklusive Indexe) und eine bessere Performance bei nicht schreibenden Operationen.

# Tabelle mit JSON Inhalt anlegen
Zunächst wird eine Tabelle angelegt, in der ein Primärschlüssel und ein JSON-Feld gespeichert werden kann.

```sql
CREATE TABLE IF NOT EXISTS json_table (
  id SERIAL PRIMARY KEY,
  jsondata JSONB
);
```
{{execute}}

## Tabelle mit Inhalt füllen

```sql
INSERT INTO json_table (jsondata) VALUES 
    ('{"name": "Max Mustermann", "alter": 22, "adresse": {"straße": "Musterstraße", "ort": "Musterstadt"}, "lieblingsfarbe": "Grün" }'),
    ('{"name": "Hans Mustermann", "alter": 42, "adresse": {"straße": "Musterweg", "ort": "Musterdorf"} }'),
    ('{"name": "Peter Mustermann", "alter": 32, "adresse": {"straße": "Musterstraße", "ort": "Musterstadt"} }');
```	
{{execute}}

# JSON Operatoren
PostgreSQL unterstützt eine vieltzahl von JSON-Operatoren, von denen einige in diesem Kapitel beschrieben werden. Eine vollständige Liste an Operatoren und Funkionen kann in der [PostgreSQL Dokumentation](https://www.postgresql.org/docs/current/functions-json.html) nachgelesen werden.

## JSON Felder lesen

Daten aus der obersten Objektschicht können mit den Operatoren "->" und "->>" gelesen werden. Nach dem Operator wird entweder der Name des Feldes oder die Positon des Listenglieds das gelesen werden soll angegeben. Operatoren mit nur einem ">" geben das Ergebnis der Operation als JSON bzw. JSONB zurück, bei Operatoren mit zwei ">" werden die Werte als Text zurückgeben.[^fn2]

Alle Namen aus den JSON Objekten können mit der folgenden Query ausgelesen werden:

```sql
SELECT jsondata->>'name' as "Name" FROM json_table;
```
{{execute}}

Da der "->" Operator wieder ein JSONB Objekt zurückgibt, können die Operatoren auch aufgereiht werden.
```sql	
SELECT jsondata->'adresse'->'straße' as "Straße" FROM json_table;
```
{{execute}}

Auf einen Verschachteltes Objekt kann aber auch mit dem "#>" bzw. "#>>" Operator zugegriffen werden. Als Parameter wird dazu eine geordnete Menge an Schlüsseln und Indexen angegeben.
```sql
SELECT jsondata #> '{"adresse", "straße"}' as "Straße" FROM json_table;
```
{{execute}}


[^fn1]: Petković, Dušan (2017): JSON integration in relational database systems. In Int J Comput Appl 168 (5), p. 17.
[^fn2]: https://www.postgresql.org/docs/14/functions-json.html