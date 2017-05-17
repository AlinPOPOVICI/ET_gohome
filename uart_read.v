`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:14:14 05/13/2017 
// Design Name: 
// Module Name:    uart
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module uart(
   input        i_clock,
   input        i_rx_serial,
   output       i_rx_dv,
   output [7:0] i_rx_byte      
   );
  
  parameter CLKS_PER_BIT   = 'd16;
  parameter S_IDLE         = 3'b000; //sates
  parameter S_RX_START_BIT = 3'b001;
  parameter S_RX_DATA_BITS = 3'b010;
  parameter S_RX_STOP_BIT  = 3'b011;
  parameter S_CLEANUP       = 3'b100;
   
  reg           r_rx_data_r = 1'b1;
  reg           r_rx_data   = 1'b1;
   
  reg [7:0]     r_clock_count = 0;
  reg [2:0]     r_bit_index   = 0; //8 bits total (care bit)
  reg [7:0]     r_rx_byte   = 0; //ce primeste  
  reg           r_rx_dv       = 0;
  reg [2:0]     R_SM_MAIN      = 0;
   

  always @(posedge i_clock)
    begin
      r_rx_data_r <= i_rx_serial;
      r_rx_data   <= r_rx_data_r;
    end
   
   
  always @(posedge i_clock)
    begin
       
      case (R_SM_MAIN )
        S_IDLE :
          begin
            r_rx_dv       <= 1'b0;
            r_clock_count <= 0;
            r_bit_index   <= 0;
             
            if (r_rx_data == 1'b0)          // Start bit detected
              R_SM_MAIN  <= S_RX_START_BIT;
            else
              R_SM_MAIN  <= S_IDLE;
          end
         
      
        S_RX_START_BIT :
          begin
            if (r_clock_count == (CLKS_PER_BIT-1)/2)
              begin
                if (r_rx_data == 1'b0)
                  begin
                    r_clock_count <= 0;  // reset counter
                    R_SM_MAIN      <= S_RX_DATA_BITS;
                  end
                else
                  R_SM_MAIN  <= S_IDLE;
              end
            else
              begin
                r_clock_count <= r_clock_count + 1;
                R_SM_MAIN      <= S_RX_START_BIT;
              end
          end 
         
         
        
        S_RX_DATA_BITS :
          begin
            if (r_clock_count < CLKS_PER_BIT-1)
              begin
                r_clock_count <= r_clock_count + 1;
                R_SM_MAIN      <= S_RX_DATA_BITS;
              end
            else
              begin
                r_clock_count          <= 0;
                r_Rx_Byte[r_Bit_Index] <= r_rx_data;
                 
               
                if (r_Bit_Index < 7)
                  begin
                    r_Bit_Index <= r_Bit_Index + 1;
                    R_SM_MAIN    <= S_RX_DATA_BITS;
                  end
                else
                  begin
                    r_Bit_Index <= 0;
                    R_SM_MAIN    <= s_RX_STOP_BIT;
                  end
              end
          end 
     
     
        // Receive Stop bit.  Stop bit = 1
        s_RX_STOP_BIT :
          begin
            
            if (r_clock_count < CLKS_PER_BIT-1)
              begin
                r_clock_count <= r_clock_count + 1;
                R_SM_MAIN      <= s_RX_STOP_BIT;
              end
            else
              begin
                r_rx_dv       <= 1'b1;
                r_clock_count <= 0;
                R_SM_MAIN      <= S_CLEANUP ;
              end
          end 
     
         
       
        S_CLEANUP  :
          begin
            R_SM_MAIN  <= S_IDLE;
            r_rx_dv   <= 1'b0;
          end
         
         
        default :
          R_SM_MAIN  <= S_IDLE;
         
      endcase
    end   
   
  assign i_rx_dv   = r_rx_dv;
  assign i_rx_byte = r_Rx_Byte;
   
endmodule 
