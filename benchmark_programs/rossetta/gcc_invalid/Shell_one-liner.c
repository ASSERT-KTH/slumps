der|C}}==
{{works with|gcc}}
The following code leaves the file <tt>a.out</tt> in the current directory (it does not
delete it to avoid to call another shell/system dependent command/program). The
''current directory'' is not specified by <tt>./</tt> in every system...
<lang bash>$ echo 'main() {printf("Hello\n");}' | gcc -w -x c -; ./a.out