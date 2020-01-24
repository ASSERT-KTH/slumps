der|C}}==
See [[Special characters#C++|C++]].

As in C++, <tt>?</tt>, <tt>#</tt>, <tt>\</tt>, <tt>'</tt> and <tt>"</tt> have special meaning (altogether with <tt>{</tt> and <tt>}</tt>). Also trigraphs work (they are an "old" way to avoid the "old" difficulties of finding characters like { } etc. on some keyboards).

* = assignment operator, enumeration value
* , function parameter separator
* ; statement separator, loop construct component
* . element member selector for structures or unions, decimal point
* ! logical NOT operator
* ~ bitwise BWNOT
* # preprocessor stringize operator, preprocessor directive prefix
* \ literal character notation prefix, line continuation
* & address resolution prefix, bitwise BWAND operator
* * multiplication, pointer resolution, file pointer prefix, indirection
* + addition, optional unary positive, prefix increment, postfix increment
* - subtraction, unary negative
* / division
* ^ bitwise BWXOR operator
* | bitwise BWOR operator
* _ internal library identifier prefix
* % modulus, output format specifier prefix
* > greater than comparative operator
* < less than comparative operator

=== Digraphs ===

* == equality operator
* != inequality operator
* ++ incremental nudge operator
* -- decremental nudge operator
* && logical AND
* || logical OR
* += additive compound assignment operator
* -= subtractive compound assignment operator
* *= multiplication compound assignment operator
* /= division compound assignment operator
* %= modulus assignment operator
* <= less than  or equal to comparative operator
* >= greater than or equal to comparative operator
* &= bitwise BWAND combination assignment operator
* |= bitwise BWOR combination assignment operator
* ^= bitwise BWXOR combination assignment operator
* << bitwise left shift
* >> bitwise right shift
* .* pointer to object member
* .> pointer to structure or union element
* :> base operator
* ## preprocessor concatenation operator
* #@ preprocessor charizing operator

=== Trigraphs ===

* .>* pointer to pointer member
* <<= bitwise left shift compound assignment
* >>= bitwise right shift compound assignment
* ... used in variadic function declaration

=== Enclosures ===

* " " literal string enclosures
* { } Group statements together into blocks of code
* ( ) Enclosure for function parameters
* < > header filename enclosure
* /* */ Comment enclosures

=== Ternary operators ===

* ? , : The hook and colon are used together to produce ternary operation syntax

=== C99 Extensions ===

* // Comment prefix

C99 standard (but not previous standards) recognizes also '''universal character names''', like C++.

'''String and character literals''' are like C++ (or rather the other way around!), and even the meaning and usage of the <tt>#</tt> character is the same.