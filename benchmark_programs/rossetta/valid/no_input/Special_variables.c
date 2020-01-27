der|C}}==
C99 introduced the (read-only) special variable <code>__func__</code> (of type <code>static const char[]</code>) which holds the name of the current function.

Furthermore one could consider <code>errno</code> from <code><errno.h></code> as a special variable although it actually is a macro which expands to an modifiable lvalue of type <code>int</code>. Many library functions set it to a positive value in case of an error.