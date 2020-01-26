der|C}}==
{{works with|gcc}}
The following code leaves the file <tt>a.out</tt> in the current directory (it does not
delete it to avoid to call another shell/system dependent command/program). The
''current directory'' is not specified by <tt>./</tt> in every system...
<lang bash>$ echo 'main() {printf("Hello\n");}' | gcc -w -x c -; ./a.out/* <stdin>:5:1: warning: empty character constant [-Winvalid-pp-token]
''current directory'' is not specified by <tt>./</tt> in every system...
^
<stdin>:5:20: warning: empty character constant [-Winvalid-pp-token]
''current directory'' is not specified by <tt>./</tt> in every system...
                   ^
2 warnings generated.
 */