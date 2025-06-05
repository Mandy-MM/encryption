/* Copyright (C) 2017 Daniel Page <csdsp@bristol.ac.uk>
 *
 * Use of this source code is restricted per the CC BY-NC-ND license, a copy of 
 * which can be found via http://creativecommons.org (and should be included as 
 * LICENSE.txt within the associated archive or repository).
 */

`include "params.h"

module encrypt_v1(  input wire [ `N_K - 1 : 0 ]   k,
                    input wire [ `N_B - 1 : 0 ]   m,
                   output wire [ `N_B - 1 : 0 ]   c );

  // Stage 2: complete this module implementation   
  wire [ 63 : 0 ] r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14,
                r15, r16, r17, r18, r19, r20, r21, r22, r23, r24, r25, r26,
                r27, r28, r29, r30, r31;    

  wire [ 79 : 0 ] key1, key2, key3, key4, key5, key6, key7, key8, key9, key10,
                key11, key12, key13, key14, key15, key16, key17, key18, key19,
                key20, key21, key22, key23, key24, key25, key26, key27, key28,
                key29, key30, key31;     

  round round1( .r( r1 ), .x( m ), .k( k ) );
  key_schedule ks1( .r( key1 ), .x( k ), .i( 5'b00001 ) );    

  round round2( .r( r2 ), .x( r1 ), .k( key1 ) );
  key_schedule ks2( .r( key2 ), .x( key1 ), .i( 5'b00010 ) );    

  round round3( .r( r3 ), .x( r2 ), .k( key2 ) );
  key_schedule ks3( .r( key3 ), .x( key2 ), .i( 5'b00011 ) );    

  round round4( .r( r4 ), .x( r3 ), .k( key3 ) );
  key_schedule ks4( .r( key4 ), .x( key3 ), .i( 5'b00100 ) );    

  round round5( .r( r5 ), .x( r4 ), .k( key4 ) );
  key_schedule ks5( .r( key5 ), .x( key4 ), .i( 5'b00101 ) );    

  round round6( .r( r6 ), .x( r5 ), .k( key5 ) );
  key_schedule ks6( .r( key6 ), .x( key5 ), .i( 5'b00110 ) );    

  round round7( .r( r7 ), .x( r6 ), .k( key6 ) );
  key_schedule ks7( .r( key7 ), .x( key6 ), .i( 5'b00111 ) );    

  round round8( .r( r8 ), .x( r7 ), .k( key7 ) );
  key_schedule ks8( .r( key8 ), .x( key7 ), .i( 5'b01000 ) );    

  round round9( .r( r9 ), .x( r8 ), .k( key8 ) );
  key_schedule ks9( .r( key9 ), .x( key8 ), .i( 5'b01001 ) );    

  round round10( .r( r10 ), .x( r9 ), .k( key9 ) );
  key_schedule ks10( .r( key10 ), .x( key9 ), .i( 5'b01010 ) );    

  round round11( .r( r11 ), .x( r10 ), .k( key10 ) );
  key_schedule ks11( .r( key11 ), .x( key10 ), .i( 5'b01011 ) );    

  round round12( .r( r12 ), .x( r11 ), .k( key11 ) );
  key_schedule ks12( .r( key12 ), .x( key11 ), .i( 5'b01100 ) );    

  round round13( .r( r13 ), .x( r12 ), .k( key12 ) );
  key_schedule ks13( .r( key13 ), .x( key12 ), .i( 5'b01101 ) );    

  round round14( .r( r14 ), .x( r13 ), .k( key13 ) );
  key_schedule ks14( .r( key14 ), .x( key13 ), .i( 5'b01110 ) );    

  round round15( .r( r15 ), .x( r14 ), .k( key14 ) );
  key_schedule ks15( .r( key15 ), .x( key14 ), .i( 5'b01111 ) );    

  round round16( .r( r16 ), .x( r15 ), .k( key15 ) );
  key_schedule ks16( .r( key16 ), .x( key15 ), .i( 5'b10000 ) );    

  round round17( .r( r17 ), .x( r16 ), .k( key16 ) );
  key_schedule ks17( .r( key17 ), .x( key16 ), .i( 5'b10001 ) );    

  round round18( .r( r18 ), .x( r17 ), .k( key17 ) );
  key_schedule ks18( .r( key18 ), .x( key17 ), .i( 5'b10010 ) );    

  round round19( .r( r19 ), .x( r18 ), .k( key18 ) );
  key_schedule ks19( .r( key19 ), .x( key18 ), .i( 5'b10011 ) );    

  round round20( .r( r20 ), .x( r19 ), .k( key19 ) );
  key_schedule ks20( .r( key20 ), .x( key19 ), .i( 5'b10100 ) );    

  round round21( .r( r21 ), .x( r20 ), .k( key20 ) );
  key_schedule ks21( .r( key21 ), .x( key20 ), .i( 5'b10101 ) );    

  round round22( .r( r22 ), .x( r21 ), .k( key21 ) );
  key_schedule ks22( .r( key22 ), .x( key21 ), .i( 5'b10110 ) );    

  round round23( .r( r23 ), .x( r22 ), .k( key22 ) );
  key_schedule ks23( .r( key23 ), .x( key22 ), .i( 5'b10111 ) );    

  round round24( .r( r24 ), .x( r23 ), .k( key23 ) );
  key_schedule ks24( .r( key24 ), .x( key23 ), .i( 5'b11000 ) );    

  round round25( .r( r25 ), .x( r24 ), .k( key24 ) );
  key_schedule ks25( .r( key25 ), .x( key24 ), .i( 5'b11001 ) );    

  round round26( .r( r26 ), .x( r25 ), .k( key25 ) );
  key_schedule ks26( .r( key26 ), .x( key25 ), .i( 5'b11010 ) );    

  round round27( .r( r27 ), .x( r26 ), .k( key26 ) );
  key_schedule ks27( .r( key27 ), .x( key26 ), .i( 5'b11011 ) );    

  round round28( .r( r28 ), .x( r27 ), .k( key27 ) );
  key_schedule ks28( .r( key28 ), .x( key27 ), .i( 5'b11100 ) );    

  round round29( .r( r29 ), .x( r28 ), .k( key28 ) );
  key_schedule ks29( .r( key29 ), .x( key28 ), .i( 5'b11101 ) );    

  round round30( .r( r30 ), .x( r29 ), .k( key29 ) );
  key_schedule ks30( .r( key30 ), .x( key29 ), .i( 5'b11110 ) );    

  round round31( .r( r31 ), .x( r30 ), .k( key30 ) );
  key_schedule ks31( .r( key31 ), .x( key30 ), .i( 5'b11111 ) );    

  // Post-processing   
  key_addition ka( .r( c ), .x( r31 ), .k( key31 ) );

endmodule