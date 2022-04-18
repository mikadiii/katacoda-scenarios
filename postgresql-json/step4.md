# JSONB Operationen
Der JSONB Datentyp unterstützt eine Reihe von erweiterten Operationen, die nicht in den JSON Operatoren enthalten sind.

Mit dem "@>" bzw "<@" Operator wird geprüft, ob ein JSON Objekt in einem anderen JSON Objekt enthalten ist. Die Spitze des Größer- / Kleinerzeichens zeigt dabei immer auf das Objekt, das in dem anderen Enthalten sein soll. Das Ergebnis ist ein Boolesches Wert.
```sql
SELECT jsondata @> '{"adresse": {"straße": "Musterstraße", "ort": "Musterstadt"}}' as "Adresse" FROM json_table;
```{{execute}}

Mit dem "?" Operator kann die Existenz eines nicht verschachtelten Schlüssels getestet werden.
```sql
SELECT jsondata FROM json_table
WHERE jsondata ? 'lieblingsfarbe';
```{{execute}}

Wird ein "|" Operator an das "?" angehängt kann auf die Existenz mindestens eines Schlüssels aus einer Liste geprüft werden. Mit einem angehängten "&" Operator kann auf die Existenz aller Schlüssel in einer Liste geprüft werden.