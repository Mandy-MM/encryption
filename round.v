/* Copyright (C) 2017 Daniel Page <csdsp@bristol.ac.uk>
 *
 * Use of this source code is restricted per the CC BY-NC-ND license, a copy of 
 * which can be found via http://creativecommons.org (and should be included as 
 * LICENSE.txt within the associated archive or repository).
 */

module round( output wire [ 63 : 0 ] r, 
               input wire [ 63 : 0 ] x, 
               input wire [ 79 : 0 ] k );

  // Stage 1: complete this module implementation   
  wire [ 63 : 0 ] k1;   
  wire [  3 : 0 ] sl0;   
  wire [  3 : 0 ] sl1;   
  wire [  3 : 0 ] sl2;   
  wire [  3 : 0 ] sl3;   
  wire [  3 : 0 ] sl4;   
  wire [  3 : 0 ] sl5;   
  wire [  3 : 0 ] sl6;   
  wire [  3 : 0 ] sl7;   
  wire [  3 : 0 ] sl8;   
  wire [  3 : 0 ] sl9;   
  wire [  3 : 0 ] slA;   
  wire [  3 : 0 ] slB;   
  wire [  3 : 0 ] slC;   
  wire [  3 : 0 ] slD;   
  wire [  3 : 0 ] slE;   
  wire [  3 : 0 ] slF;   
  wire [  3 : 0 ] x0;   
  wire [  3 : 0 ] x1;   
  wire [  3 : 0 ] x2;   
  wire [  3 : 0 ] x3;   
  wire [  3 : 0 ] x4;   
  wire [  3 : 0 ] x5;   
  wire [  3 : 0 ] x6;   
  wire [  3 : 0 ] x7;   
  wire [  3 : 0 ] x8;   
  wire [  3 : 0 ] x9;   
  wire [  3 : 0 ] xA;   
  wire [  3 : 0 ] xB;   
  wire [  3 : 0 ] xC;   
  wire [  3 : 0 ] xD;   
  wire [  3 : 0 ] xE;   
  wire [  3 : 0 ] xF;   
  wire [ 63 : 0 ] m1;    

  //key addition layer   
  key_addition ka( .r( k1 ), .x( x ), .k( k ) );    

  //Substitution layer   
  split_0 sl( .r0( sl0 ), .r1( sl1 ), .r2( sl2 ), .r3( sl3 ), .r4( sl4 ), .r5( sl5 ),
              .r6( sl6 ), .r7( sl7 ), .r8( sl8 ), .r9( sl9 ), .rA( slA ), .rB( slB ),
              .rC( slC ), .rD( slD ), .rE( slE ), .rF( slF ), .x( k1 ) );    

  sbox s0( .x( sl0 ), .r( x0 ) );   
  sbox s1( .x( sl1 ), .r( x1 ) );   
  sbox s2( .x( sl2 ), .r( x2 ) );   
  sbox s3( .x( sl3 ), .r( x3 ) );   
  sbox s4( .x( sl4 ), .r( x4 ) );   
  sbox s5( .x( sl5 ), .r( x5 ) );   
  sbox s6( .x( sl6 ), .r( x6 ) );   
  sbox s7( .x( sl7 ), .r( x7 ) );   
  sbox s8( .x( sl8 ), .r( x8 ) );   
  sbox s9( .x( sl9 ), .r( x9 ) );   
  sbox sA( .x( slA ), .r( xA ) );   
  sbox sB( .x( slB ), .r( xB ) );   
  sbox sC( .x( slC ), .r( xC ) );   
  sbox sD( .x( slD ), .r( xD ) );   
  sbox sE( .x( slE ), .r( xE ) );   
  sbox sF( .x( slF ), .r( xF ) );    

  merge_0 m( .r( m1 ), .x0( x0 ), .x1( x1 ), .x2( x2 ), .x3( x3 ), .x4( x4 ),
             .x5( x5 ), .x6( x6 ), .x7( x7 ), .x8( x8 ), .x9( x9 ), .xA( xA ),
             .xB( xB ), .xC( xC ), .xD( xD ), .xE( xE ), .xF( xF ) );    

  //Permutation layer   
  perm p( .r( r ), .x( m1 ) );

endmodule