der|C}}==
===Using gcc===

====Debian Based Systems====
Install <code>gcc</code>
 $ sudo apt-get install gcc

====Red Hat Based Systems====
Install <code>gcc</code>
 $ su
 # yum install gcc

====All Distributions====
After you have installed <code>gcc</code> using instructions above. 
Create <code>helloworld.c</code>. 
This uses <code>HERE</code> document and <code>bash</code>, the standard shell.
 $ cat > helloworld.c <<HERE
 #include &lt;stdio.h&gt;
 int main( int argc, char *argv[] ) {
      puts( "Hello World!" );
      return 0;
 }
 HERE
Compile it using <code>gcc</code>.
 $ gcc -o helloworld helloworld.c
Run it
 $ ./helloworld/* <stdin>:11:4: error: invalid preprocessing directive
 # yum install gcc
   ^
<stdin>:18:11: error: expected "FILENAME" or <FILENAME>
 #include &lt;stdio.h&gt;
          ^
2 errors generated.
 */