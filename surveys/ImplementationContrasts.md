== Implementation Contrasts ==

This is an index to pages that describe various detailed differences between Scheme implementations.  

As of 2016-08-05, the list of Scheme implementations tested is:

[[http://racket-lang.org/|Racket]], [[http://practical-scheme.net/gauche/|Gauche]], [[http://www.gnu.org/software/mit-scheme/|MIT]], [[http://dynamo.iro.umontreal.ca/wiki/index.php/Main_Page|Gambit]], plain [[http://call-cc.org/|Chicken]], Chicken with the [[http://wiki.call-cc.org/eggref/4/numbers|numbers egg]], [[https://github.com/justinethier/cyclone|Cyclone]], [[http://www-sop.inria.fr/members/Manuel.Serrano/bigloo/|Bigloo]], [[http://s48.org/|Scheme48]], [[http://www.scsh.net/|scsh]], [[http://www.gnu.org/software/guile/|Guile]], [[http://www.gnu.org/software/kawa/|Kawa]], [[https://code.google.com/p/sagittarius-scheme|Sagittarius]], [[http://sisc-scheme.org/|SISC]], [[https://code.google.com/p/chibi-scheme/|Chibi]], [[https://github.com/picrin-scheme/picrin|Picrin]], [[https://code.google.com/p/foment/|Foment]], [[http://people.csail.mit.edu/jaffer/SCM.html|SCM]], [[http://scheme.com/|Chez]], [[http://marcomaggi.github.io/vicare.html|Vicare]], [[http://www.larcenists.org/|Larceny]], [[https://code.google.com/p/ypsilon/|Ypsilon]], [[https://code.google.com/p/mosh-scheme/|Mosh]], [[https://github.com/leppie/IronScheme|IronScheme]], [[http://nexj-scheme.org/|NexJ]], [[http://jscheme.sourceforge.net/jscheme/main.html|JScheme]], [[http://www.stklos.net/|STklos]], [[http://ksi.sourceforge.net/|KSi]], [[https://code.google.com/p/sigscheme/|SigScheme]], [[http://www.nocrew.org/software-shoe.html|Shoe]], [[http://tinyscheme.sourceforge.net/|TinyScheme]], [[https://github.com/catseye/minischeme|Mini-Scheme]], [[http://www.t3x.org/s9fes/|Scheme 9]], [[http://www.rscheme.org/rs/index.html|RScheme]], [[https://ccrma.stanford.edu/software/snd/snd/s7.html|S7]], [[https://marijnhaverbeke.nl/unlikely/|Unlikely Scheme]], [[http://people.delphiforums.com/gjc/siod.html|SIOD]], [[http://carlstrom.com/bdc-scheme/|BDC]], [[http://www.xlisp.org/|XLisp]], [[http://librep.sourceforge.net/|Rep]], [[http://schemik.sourceforge.net/|Schemik]], [[http://sam.zoy.org/elk/|Elk]], [[http://www.cs.umb.edu/~wrc/scheme/|UMB]], [[http://llava.org/|Llava]], [[http://www.malgil.com/sxm/|SXM]], [[http://www.grabmueller.de/martin/www/sizzle/sizzle.en.html|Sizzle]], [[https://github.com/JeffBezanson/femtolisp|FemtoLisp]], [[http://www.mathematik.uni-muenchen.de/~forster/sw/lmuscheme.html|LMU Scheme]], [[http://hakl.net/software/dfsch.en.html|Dfsch]], [[http://www.inlab.de/scheme/|Inlab]], [[http://www.bcl.hamilton.ie/~barak/oaklisp|Oaklisp]], [[https://code.google.com/p/owl-lisp/|Owl Lisp]].

My test system now runs 64-bit Linux, but most of the pages below report the results from using 32-bit Linux.  Most of my Schemes (except Racket and JVM-based and CLR-based ones) are built from source, usually the latest release but in some cases the head of source control.  However, not all versions are up to date, and the versions tested have changed over the past few years, so some of the claims in the pages below are surely obsolete.  Implementers and users are urged to [[mailto:cowan@ccil.org|notify me]] when they see something incorrect.

As of 2016-04-01, Oaklisp is not building on my 64-bit Linux system again.

As of 2014-11-29, I successfully built 32-bit Oaklisp on 64-bit Linux, and restored it to the list above.

As of 2013-07-29, I could not build Oaklisp (it doesn't seem to like 64-bit systems) or Dream (link dead), so they were excluded from the suite from then on.

As of 2013-01-31, I could not build [[https://code.google.com/p/vx-scheme/|VX]] or [[https://github.com/vijaymathew/spark-scheme|Spark]], so they were excluded from the suite from then on.

KSM, Luna, MScheme, QScheme, Rhizome/pi, and VSCM either will not build on my system or will not run.  For these and many other Schemes see the [[http://community.schemewiki.org/?scheme-faq-standards|fairly complete list of Scheme implementations]].

S7 was formerly, but incorrectly, known in these pages as "Scheme 7", and some references to this name survive.  It's really named after [[http://en.wikipedia.org/wiki/Sunbeam_S7_and_S8|the motorcycle]].

Not all these pages have information on all these Schemes.

 * ApplyArgsLimit
 * ArgumentOrder
 * BackslashBar
 * BracketsBraces
 * CallCc
 * CaseInsensitivity
 * CharEq
 * CommaInIdentifiers
 * CompilerAvailable
 * ComplexLog
 * ComplexRepresentations
 * CondExpand
 * CwifClosePort
 * DatumLabels
 * DefineSyntaxDefines
 * DisjointPromises
 * DotComma
 * EmbeddedCrLf
 * EmptyDefine
 * EmptyList
 * EmptyStringsVectors
 * EvalDefine
 * ExactExpt
 * ExactSqrt
 * FixnumInfo
 * FloatPrecision
 * ForceNonPromise
 * GetFromClosedStringPort
 * GuardBehavior
 * HashBangEof
 * HashInIdentifiers
 * HashQuote
 * HygienicInclusion
 * ImmediateStringsCoalesced
 * ImmutableStrings
 * ImproperLists
 * LetrecStar
 * MaxInfNan
 * MultipleValues
 * NegativeRationalize
 * NegativeSqrt
 * NilIsFalse
 * NonFiniteNumbers
 * NumericTower
 * OneArmedIf
 * OnePlusEx
 * PetrofskyCatastrophe
 * PetrofskyLet
 * PrefixedStringToNumber
 * QuoteDelimiter
 * ReadLine
 * ReadMutable
 * RedefiningKeywords
 * RedefiningSyntax
 * RedundantImports
 * RoundInf
 * SelfQuotingVectors
 * SetUndefinedVariable
 * ShortEquality
 * SquareBrackets
 * StringSymbolConversion
 * StringTitlecase
 * SyntaxAbuse
 * SyntaxDefinitions
 * UnicodeSupport
 * UnsignedImaginary
 * UpperCaseEscape
 * VerticalLineSymbols
 * WhatLoadReturns
 * [[:Zero|Zero]]

 [[http://web.mit.edu/~axch/www/scheme/choices.html|More implementation contrasts]].