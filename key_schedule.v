/* Copyright (C) 2017 Daniel Page <csdsp@bristol.ac.uk>
 *
 * Use of this source code is restricted per the CC BY-NC-ND license, a copy of 
 * which can be found via http://creativecommons.org (and should be included as 
 * LICENSE.txt within the associated archive or repository).
 */

module key_schedule( output wire [ 79 : 0 ] r,
                      input wire [ 79 : 0 ] x,
                      input wire [  4 : 0 ] i );

// Stage 1: complete this module implementation   
  wire [ 79 : 0 ] t0, t1;   
  wire [ 3 : 0 ] sOut;    

  //left rotate 61 bits   
  assign t0 = { x [ 18 : 0 ], x [ 79 : 19 ] };    

  //sbox substitute   
  sbox s( .x( t0 [ 79 : 76 ] ), .r( sOut ) );   
  assign t1 = { sOut, t0 [ 75 : 0 ] };    

  //xor 19:15   
  assign r = { t1 [ 79 : 20 ], t1 [ 19 : 15 ]^i, t1 [ 14 : 0 ] };

endmodule

