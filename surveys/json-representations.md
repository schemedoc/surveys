# JSON representations

|Library|JSON object|JSON array|JSON string|JSON true|JSON false|JSON null
|-------|-----------|----------|-----------|---------|----------|---------
|**SRFI 180**|alist|vector|string|`#t`|`#f`|`'null`
|anb-json|(`'dict` . alist)|list|string or symbol|N/A|N/A|N/A
|Chicken cjson|alist|vector|string|`#t`|`#f`|`'null`
|Chicken json|avector or hashtable|list|string or symbol|`#t`|`#f`|void
|Chicken medea|alist|vector|string|`#t`|`#f`|`'null`
|Gauche `rfc.json`|alist|vector|string|`'true`|`'false`|`'null`
|Gerbil `:std/text/json`|hashtable or object with `:json` method|vector or list
|string|`#t`|`#f`|`#!void`
|guenchi json|alist|vector|string|`#t` or `'true`|`#f` or `'false`|`'null` or `'()`
|guile-json|alist|vector|string|`#t`|`#f`|`#nil`
|guile-sjson|(`'@` . alist) or hashtable|list|string|`#t`|`#f`|`'null` (was `#nil`)
|ktakashi json-tools|avector|list|string|`#t`|`#f`|`'null`
|macduffie json|hashtable|list|string|`#t`|`#f`|`json-null` record type
|thunknyc json|alist|vector|string|`#t`|`#f`|N/A
