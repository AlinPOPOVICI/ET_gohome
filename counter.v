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
	  ore,
	  minute,
     load_1,   // pt setare manuala
     load_2,	//pt setare uart
	  clock,
	  reset
    );
	 input [4:0] timp_ore1;
	 input [5:0] timp_minute1; 
	 input [4:0] timp_ore2;
	 input [5:0] timp_minute2;
	 input load_1;
	 input load_2;
	 input clock;
	 input reset;

	 
	 output [4:0] ore;
	 output [5:0] minute;
	 
	 reg [4:0] out_ore;
	 reg [5:0] out_minute;
	 
	 reg [5:0] minute;
	 reg [4:0] ore;
	 
	 // cati cloci pt un minut  
	 reg [26:0] counter;
	 reg [26:0] counter_out;
	 
always @ (*) begin
	out_ore = ore;
	out_minute = minute;
	counter_out = counter;
	if( counter == 'd50) begin // 50000000 pt 1 secunda timp real 
		counter_out = 'd0;
			if(ore == 'd23 && minute == 'd59)  begin //la ora 23:59 se va trece la 00:00
				out_ore = 'd0;
				out_minute = 'd0;
			
			end else
				if(minute == 'd59)  begin // la minutul 59 se va trece la 00
					out_ore = out_ore + 'd1;
					out_minute = 'd0;
				end else begin
					out_minute = out_minute + 'd1;
		
				end
		 
	 end
end
	 
always @ (posedge clock) begin 
    
 if (reset == 1'b1) begin
		  minute <= 'd0;
		  ore <= 'd0;
		  counter <= 'd0;
    end else begin 
		if (load_1 == 1'b1) begin
		  ore <=    timp_ore1;
		  minute <=  timp_minute1;
		end else begin
			if (load_2 == 1'b1) begin
				ore <=    timp_ore2;
				minute <=  timp_minute2;

			end else begin
				ore <= out_ore;
				minute <= out_minute;
				counter <= counter_out + 'd1;
			end
		end
	 end 
end	 

  
 endmodule // End of M

