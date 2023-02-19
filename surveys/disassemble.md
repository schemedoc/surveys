# Disassemble

How can one disassemble an expression?

| Implementation | method | for what objects? | how is the code returned? |
| -------------- | ------ | ----------------- | ------------------------- |
| Guile  | `arch-disassemble` | ? | ? |
| Kawa   | `(disassemble proc)` | for procedures | returns string |
| STklos | `(disassemble proc)` | for procedures | prints the bytecode |
| STklos | `(disassemble-expr proc)` | for expressions | prints the bytecode |

## Example: Kawa

```
#|kawa:1|# (define (d x) (* x 2))
#|kawa:2|# (disassemble d)
In class atInteractiveLevel-1

Method name:"d" public static Signature: (java.lang.Object)java.lang.Object
Attribute "Code", length:53, max_stack:3, max_locals:1, code_length:11
  0: getstatic <Field gnu.kawa.functions.MultiplyOp.TIMES gnu.kawa.functions.MultiplyOp>
  3: aload_0
  4: getstatic <Field atInteractiveLevel-1.Lit0 gnu.math.IntNum>
  7: invokevirtual <Method gnu.mapping.Procedure.apply2 (java.lang.Object,java.lang.Object)java.lang.Object>
 10: areturn
Attribute "LineNumberTable", length:6, count: 1
  line: 1 at pc: 0
Attribute "LocalVariableTable", length:12, count: 1
  slot#0: name: x, type: java.lang.Object (pc: 0 length: 10)

Method name:"d$check" public static Signature: (gnu.mapping.Procedure,gnu.mapping.CallContext)java.lang.Object
Attribute "Code", length:57, max_stack:1, max_locals:3, code_length:19
  0: aload_1
  1: invokevirtual <Method gnu.mapping.CallContext.getNextArg ()java.lang.Object>
  4: astore_2
  5: aload_1
  6: invokevirtual <Method gnu.mapping.CallContext.checkDone ()int>
  9: ifeq 14
 12: aload_1
 13: areturn
 14: aload_2
 15: invokestatic <Method atInteractiveLevel-1.d (java.lang.Object)java.lang.Object>
 18: areturn
Attribute "StackMapTable", length:8, number of entries: 1
  offset: 14 - append_frame - define 1 more locals
    2: java.lang.Object
Attribute "LineNumberTable", length:6, count: 1
  line: 1 at pc: 0
```

## Example: STklos

```
stklos> (define (d x) (* x 2))
;; d
stklos> (disassemble d)

000:  LOCAL-REF0          
001:  IN-SINT-MUL2         2
003:  RETURN              
004:
```

The STklos bytecode is documented in the file [`vm.md`](https://github.com/egallesio/STklos/blob/master/doc/vm/vm.adoc) in their sources.
