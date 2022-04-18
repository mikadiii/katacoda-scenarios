Die JavaScript Objekt Notation (JSON) ist eine einfache und eindeutige Art, um Datenstrukturen in einem Text zu speichern. Sie wurde ursprünglich für den Datenaustausch von Web-Anwendungen entwickelt, wird aber auch in vielen weiteren Anwendungen verwendet.

JSON verwendet die folgenden Datentypen:

| Typ | Notation | Beschreibung |
| --- | --- | --- |
| Objekt | { } | Ist ein Key-Value Store, kann leer sein, Einträge mit Komma getrennt|
| Array | [ ] | Ist ein Liste von beliebingen Datentypen, kann leer sein, Elemente mit Komma getrennt |
| String | " " | Ist ein Text |
| Zahl | 1 / 1.0 / 2E0   | Ist eine Zahl, unterstützt Integer, Float und E-Notation |
| Boolean | true / false | Ist ein Wahrheitswert |

Ein JSON Objekt mit dem Informationen über eine Person gespeichert werden könnte dann so aussehen:

```json
{
  "name": "Max Mustermann",
  "alter": 42,
  "address": {
    "straße": "Musterstraße",
    "hausnummer": "1",
    "stadt": "Musterstadt"
  },
  "freunde": []
}
```	