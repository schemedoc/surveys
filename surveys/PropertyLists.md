# Property lists

## What is a property list?

A
[_property list_](http://www.lispworks.com/documentation/HyperSpec/Body/26_glo_p.htm#property_list)
is like an association list, but instead of each association being a
pair, the associations are "written out" as alternating keys and
values.

Assocition list: `'((a . 1) (b . 2) (c . 3))`

Property list: `(a 1 b 2 c 3)`

## Symbol property lists

Traditionally some Lisp dialects can store a property list for each
symbol in the Lisp system. The following Scheme implementations can do
it:

|Scheme|Get property|Put property|Remove property|Get p-list|
|------|------------|------------|---------------|----------|
|Chicken|get|put or (setter get)|remprop! |symbol-plist|
|Chez|getprop|putprop|remprop|property-list (returns copy)|
|Ikarus|getprop|putprop|remprop|property-list (returns copy)|
|Larceny|getprop|putprop|remprop|(none)|
|Bigloo|getprop|putprop! |remprop! |symbol-plist|
|Guile|symbol-property|set-symbol-property! |symbol-property-remove! |(none)|
|Common Lisp|[`get`](http://www.lispworks.com/documentation/HyperSpec/Body/f_get.htm)|`(setf (get key) val)`|[`remprop`](http://www.lispworks.com/documentation/HyperSpec/Body/f_rempro.htm#remprop)|[`symbol-plist`](http://www.lispworks.com/documentation/HyperSpec/Body/f_symb_4.htm)

Chicken also provides:
* get-properties, which searches for multiple properties simultaneously
* (setter symbol-plist), which replaces the whole property list

Kawa's underlying implementation provides property lists for its Elisp implementation,
but they aren't directly exposed to Scheme except through the Java FFI.

## General-purpose property list functions

Common Lisp has functions that can manipulate any given plist, not
only a symbol plist:

* [`get-properties`](http://www.lispworks.com/documentation/HyperSpec/Body/f_get_pr.htm#get-properties)
* [`getf`](http://www.lispworks.com/documentation/HyperSpec/Body/f_getf.htm#getf)
* [`remf`](http://www.lispworks.com/documentation/HyperSpec/Body/m_remf.htm#remf)
