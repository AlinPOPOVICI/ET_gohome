`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:30:34 05/03/2017 
// Design Name: 
// Module Name:    Counter-timp 
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
module counter_timp(
     timp_ore1,
	  timp_minute1, 
	  timp_ore2,
	  timp_minute2,
	  out_ore,
	  out_minute,
     load_1,
     load_2,
	  clock,
	  reset,
	  s12,
	  s3
    );
	 input [4:0] timp_ore1;
	 input [5:0] timp_minute1; 
	 input [4:0] timp_ore2;
	 input [5:0] timp_minute2;
	 input load_1;
	 input load_2;
	 input clock;
	 input reset;
	 input s12;
	 input s3;
	 
	 output [4:0] out_ore;
	 output [5:0] out_minute;
	 
	 reg [4:0] out_ore;
	 reg [5:0] out_minute;
	 
	 reg [5:0] minute;
	 reg [4:0] ore;
	 

	 
always @ (posedge clock)
  begin : COUNTER 
    
 if (reset == 1'b1) begin
        out_ore <=    'd0;
		  minute <= 'd0;
		  ore <= 'd0;
		  out_minute <= 'd0;
    end
	 
    else if (load_1 == 1'b1) begin
        ore <=    timp_ore1;
		  minute <=  timp_minute1;
    end
	 
	 else if (load_2 == 1'b1) begin
        ore <=    timp_ore2;
		  minute <=  timp_minute2;
    end
	 
	 else if(ore == 'd23 && minute == 'd59)  begin //la ora 23:59 se va trece la 00:00
		  ore <= 'd0;
		  minute <= 'd0;
		
	 end
	 
	 else if(minute == 'd59)  begin // la minutul 59 se va trece la 00
		  ore <= ore + 'd1;
		  minute <= 'd0;
		
	 end
    else begin
			minute <= minute + 'd1;
		
	 end
	 out_ore <=    ore;
	 out_minute <=  minute;
	 
  end // End of Block COUNTER
  
  endmodule // End of M

