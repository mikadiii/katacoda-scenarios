Anders als Spalten einer Tabelle können Werte innerhalb eines JSON oder JSONB Objektes nicht direkt verändert werden. Sollen die Daten geändert werden, so muss das gesamte Objekt geupdated werden. Durch die erweiterten Funktionalitäten ist in diesem Fall der JSONB Datentyp deutlich besser geeignet um veränderbare Objekte zu speichern.

Um einen Wert in einem JSONB Objekt zu verändern kann die "jsonb_set" Funktion verwendet werden.
```sql
UPDATE json_table SET jsondata = jsonb_set(jsondata, '{lieblingsfarbe}', '"Blau"') 
WHERE jsondata ->> 'name' = 'Max Mustermann';
SELECT jsondata FROM json_table;
```{{execute}}
Mit "jsonb_set" können außerdem nicht vorhandene Schlüssel hinzugefügt werden.
```sql
UPDATE json_table SET jsondata = jsonb_set(jsondata, '{lieblingsfarbe}', 'null') 
WHERE NOT jsondata ? 'lieblingsfarbe';
SELECT jsondata FROM json_table;
```{{execute}}
