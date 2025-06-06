/* Copyright (C) 2017 Daniel Page <csdsp@bristol.ac.uk>
 *
 * Use of this source code is restricted per the CC BY-NC-ND license, a copy of 
 * which can be found via http://creativecommons.org (and should be included as 
 * LICENSE.txt within the associated archive or repository).
 */

module sbox( output wire [ 3 : 0 ] r,
              input wire [ 3 : 0 ] x );

  // r[3] 4th bit
  assign r[3] = (~x [ 3 ] & ~x [ 1 ] & ~x [ 0 ]) | (~x [ 3 ] & x [ 1 ] & x [ 0 ]) | 
                (~x [ 3 ] & x [ 2 ] & x [ 1 ]) | (x [ 3 ] & ~x [ 2 ] & x [ 1 ]) | 
                (x [ 3 ] & ~x [ 2 ] & x [ 0 ]);
  
  // r[2] 3rd bit   
  assign r[2] = (~x [ 3 ] & ~x [ 2 ] & ~x [ 1 ]) | (~x [ 2 ] & x [ 1 ] & ~x [ 0 ]) | 
                (x [ 3 ] & x [ 2 ] & ~x [ 1 ]) | (x [ 3 ] & ~x [ 1 ] & x [ 0 ]) | 
                (~x [ 3 ] & x [ 2 ] & x [ 1 ] & x [ 0 ]);             

  // r[1] 2nd bit   
  assign r[1] = (~x [ 3 ] & ~x [ 2 ] & x [ 1 ]) | (~x [ 3 ] & x [ 1 ] & ~x [ 0 ]) | 
                (x [ 3 ] & x [ 2 ] & x [ 0 ]) | (x [ 3 ] & ~x [ 2 ] & ~x [ 1 ]) | 
                (~x [ 2 ] & x [ 1 ] & ~x [ 0 ]);            

  // r[0] 1 bit   
  assign r[0] = (~x [ 3 ] & ~x [ 2 ] & x [ 0 ]) | (~x [ 3 ] & x [ 1 ] & x [ 0 ]) | 
                (x [ 3 ] & x [ 2 ] & ~x [ 1 ] & x [ 0 ]) | (x [ 3 ] & ~x [ 2 ] & ~x [ 1 ] & ~x [ 0 ]) | 
                (~x [ 3 ] & x [ 2 ] & ~x [ 1 ] & ~x [ 0 ]) | (x [ 3 ] & x [ 1 ] & ~x [ 0 ]);  

endmodule