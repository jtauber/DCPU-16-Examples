; http://www.reddit.com/r/dcpu_16_programming/comments/rtvnp/i_wrote_a_program_that_fills_up_the_memory_with/

SET A, 1
SET B, 1
SET PEEK, 1
:loop ADD A, B   ;  A is now 2, B is still 1
SET PUSH, A
SET A, B
SET B, PEEK
IFG SP, 10       ; 10 because that's how much space 
                 ; this program takes 
SET PC, loop