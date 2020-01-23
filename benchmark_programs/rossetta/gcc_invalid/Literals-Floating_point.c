der|C}}==
Floating-point numbers can be given in decimal or hexadecimal.  Decimal floating-point numbers must have at least one of a decimal point and an exponent part, which is marked by an E:
<pre>((\d*\.\d+|\d+\.)([eE][+-]?[0-9]+)?[flFL]?)|([0-9]+[eE][+-]?[0-9]+[flFL]?)</pre>
Hexadecimal is similar, but allowing A-F as well as 0-9. They have a binary exponent part marked with a P instead of a decimal exponent:
<pre>(0[xX]([0-9a-fA-F]*\.[0-9a-fA-F]+|[0-9a-fA-F]+\.)([pP][+-]?\d+[flFL]?)|(0[xX][0-9a-fA-F]+[pP][+-]?\d+[flFL]?)</pre>
<!--
Why does 6.4.4.2 seem to disallow negative floats?  Clearly this isn't the intent... maybe -1.2 is considered to be the unary negation of 1.2?
-->