/* Copyright (C) 2017 Daniel Page <csdsp@bristol.ac.uk>
 *
 * Use of this source code is restricted per the CC BY-NC-ND license, a copy of 
 * which can be found via http://creativecommons.org (and should be included as 
 * LICENSE.txt within the associated archive or repository).
 */

`include "params.h"

module encrypt_v3(  input wire [ `N_K - 1 : 0 ]   k,
                    input wire [ `N_B - 1 : 0 ]   m,
                   output wire [ `N_B - 1 : 0 ]   c,

                    input wire                  clk );

  parameter NR = 32;  // 32 round
  reg [ 63 : 0 ] r_reg [ NR : 0 ];  // Store round data
  reg [ 79 : 0 ] k_reg [ NR : 0 ];  // Store round key

  // Connect
  wire [ 63 : 0 ] r_wire [ NR-1 : 0 ];  
  wire [ 79 : 0 ] k_wire [ NR-1 : 0 ];

  always @( posedge clk ) begin
    r_reg[ 0 ] <= m;  // Plain text
    k_reg[ 0 ] <= k;  // Key
  end

  // Generate 32 machine
  genvar i;
  generate
    for ( i = 0; i < NR; i = i + 1 ) begin : pipeline_stages

      // Encrypt
      round rd( .r( r_wire[ i ] ),
                .x( r_reg[ i ] ),
                .k( k_reg[ i ] ) );
            
      key_schedule ks( .r( k_wire[ i ] ),
                       .x( k_reg[ i ] ),
                       .i( i[ 4 : 0 ] ) );

      // Store give to next machine
      always @( posedge clk ) begin
        r_reg[ i+1 ] <= r_wire[ i ];
        k_reg[ i+1 ] <= k_wire[ i ];
      end
    end
  endgenerate

  assign c = r_reg[ NR ];

endmodule