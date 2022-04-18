PostgreSQL unterstützt JSON als Datentyp seit der Version 9.2, viele der zugehörigen Funktionen aber erst in der Version 9.3.[^1]

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
```{{execute}}

## Tabelle mit Inhalt füllen

```sql
INSERT INTO json_table (jsondata) VALUES 
    ('{"name": "Max Mustermann", "alter": 22, "adresse": {"straße": "Musterstraße", "ort": "Musterstadt"}, "lieblingsfarbe": "Grün" }'),
    ('{"name": "Hans Mustermann", "alter": 42, "adresse": {"straße": "Musterweg", "ort": "Musterdorf"} }'),
    ('{"name": "Peter Mustermann", "alter": 32, "adresse": {"straße": "Musterstraße", "ort": "Musterstadt"} }');
```	{{execute}}



[^1]: Petković, Dušan (2017): JSON integration in relational database systems. In Int J Comput Appl 168 (5), p. 17.

