der|C}}==
In C, a value which is equal to 0 is false, while a value which is not equal to 0 is true. Relational and logical operators evaluate to 0 for false and 1 for true. Any of the following can be used:
* any integer type, where 0 gives false, and any other value gives true (note that in C, character types are also integer types, therefore this also applies to characters: the <code>'\0'</code> character is false)
* any floating point type, where again, 0 gives false and everything else gives true
* any enumeration type, again 0 gives false, anything else true
* any pointer type, where the null pointer gives false and any other pointer gives true
* in C99, the boolean type <code>bool</code> (defined in header <tt><stdbool.h></tt>), where <code>true</code> gives true and <code>false</code> gives false
* in C99, any [[Complex numbers|complex number]] type, where 0 (0 real and 0 imaginary) gives false, anything else gives true