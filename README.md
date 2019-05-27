This is a library of MACROS used to in programming in 8080 assembly for CP/M.

These macros are processed by macro, a preprocessor I wrote for the purpose.
The output of macro is a file <file>.asm that can be sent to asm8080 for
final processing.

These macros are indended to reduce codeing time and in many cases they are
able to produce callable subroutines, i.e.  two calls to say crlf will produce
a classic crlf sequence calling cp/m to put output on the console, the next
crlf will in fact call the first invocation.  This kind of code allows for
complex output, with reduced code size.  

TODO:  write a document for the functions.......
