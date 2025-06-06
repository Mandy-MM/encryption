/* Copyright (C) 2017 Daniel Page <csdsp@bristol.ac.uk>
 *
 * Use of this source code is restricted per the CC BY-NC-ND license, a copy of 
 * which can be found via http://creativecommons.org (and should be included as 
 * LICENSE.txt within the associated archive or repository).
 */

`include "params.h"

module encrypt_v2(  input wire [ `N_K - 1 : 0 ]   k,
                    input wire [ `N_B - 1 : 0 ]   m,
                   output wire [ `N_B - 1 : 0 ]   c,

                    input wire                  clk,
                    input wire                  req,
                   output wire                  ack );

  // FSM state 
  reg [ 1 : 0 ] state, nextstate; 
  parameter S0 = 2'b00; 
  parameter S1 = 2'b01; 
  parameter S2 = 2'b10; 

  always @( posedge clk ) begin 
    if ( req == 0 ) 
      state <= S0; 
    else 
      state <= nextstate; 
  end 

  always @( * ) begin 
    if ( req == 1 ) begin 
      case ( state ) 
        S0: nextstate = S1; 
        S1: nextstate = S2; 
        S2: nextstate = S0; 
        default: nextstate = S0; 
      endcase 
    end 
    else
      nextstate = S0; 
  end 

  // Current round result and key
  reg [ 63 : 0 ] current_r;       // current round r  
  reg [ 79 : 0 ] current_key;     // current round key
  reg [ 4 : 0 ] round_counter;    // round counter

  // Wires for module connection  
  wire [ 63 : 0 ] rd_input;       // connect current_r
  wire [ 63 : 0 ] rd_input_prev;  // connect prev round r
  wire [ 79 : 0 ] key_input;      // connect current_key
  assign rd_input = current_r;
  assign rd_input_prev = { 16'b0, current_r[ 63 : 0 ] };  // to be 80bit
  assign key_input = current_key;

  // Final result
  wire [ 63 : 0 ] final_result;

  // operation part
  always @( posedge clk ) begin
    case ( state )
      S0: begin
        round_counter <= 0;
        current_r <= m;           // initial plaintext
        current_key <= k;         // initial key 
      end
      S1: begin
        if ( round_counter < 31 ) begin
          current_r <= rd_input;         // update round r
          current_key <= key_input;      // update round key
          round_counter <= round_counter + 1;
        end
      end
  endcase
  end

  // Final key addition 
  key_addition ka( .r( final_result ),
                   .x( current_r ),
                   .k( current_key ) );

  // Round 
  round rd( .r( rd_input ),
            .x( rd_input_prev ),
            .k( key_input ) );

  key_schedule ks( .r( ),             
                   .x( { 16'b0, rd_input_prev } ),  // extend to 80 bits
                   .i( round_counter ) );

  // Output signals 
  assign ack = ( state == S2 ) ? 1 : 0;       
  assign c = ( state == S2 ) ? final_result : 0;
endmodule