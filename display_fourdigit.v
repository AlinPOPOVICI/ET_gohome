`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:03:44 05/06/2017 
// Design Name: 
// Module Name:    display_fourdigit 
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
module display_fourdigit(
    minute,
    ore,
	 clock,
    digit_select,
    digit_display
    );
	 
	 input [5:0] minute;
    input [4:0] ore;
	 input clock;
    output [3:0] digit_select;
    output [6:0] digit_display;
	 
	 reg [3:0] digit_select;
	 
	 reg [3:0] digit_value;
	 reg [1:0] counter;
	 
	 initial begin
	 counter <= 'd0;
 	 end
	 
	 always@(posedge clock) 
	 begin : SELECT	 
	 if(counter == 'd3) begin
		counter <= 'd0;
		end
	 else begin 
		counter <= counter + 'd1;
		end 
	 end
	 
	 
	 always@(posedge clock) begin
		case(counter)
		
		'd0:begin 
			digit_select <= 4'b0111;
			if(ore < 'd10) begin
				digit_value <= 'd0;
			end else begin
				if(ore < 'd20) begin
					digit_value <= 'd1;
				end else begin
					digit_value <= 'd2;
				end
			end		
		end
		
		'd1:begin 
			digit_select <= 4'b1011;
			if(ore < 'd10) begin
				digit_value <= ore[3:0] ;
			end else begin
				if(ore < 'd20) begin
					digit_value <= ore - 'd10;
				end else begin
					digit_value <= ore - 'd20;
				end
			end		
		end
		
		'd2:begin
			digit_select <= 4'b1101;
			if(minute <= 'd10) begin
				digit_value <= 'd0;
			end else begin
				if(minute <= 'd20) begin
					digit_value <= 'd1;
				end else begin
					if(minute < 'd30) begin
						digit_value <= 'd2;
				   end else begin
						if(minute < 'd40)begin
							digit_value <= 'd3;
						end else begin
							if(minute < 'd50) begin
								digit_value <= 'd4;
							end else begin
								digit_value <= 'd5;
							end		
						end
					end
				end
			end				
		end
		
		'd3:begin
			digit_select <= 4'b1110;	
			if(minute <= 'd10) begin
				digit_value <= minute[3:0];
			end else begin
				if(minute <= 'd20) begin
					digit_value <= minute - 'd10;
				end else begin
					if(minute < 'd30) begin
						digit_value <= minute - 'd20;
				   end else begin
						if(minute < 'd40)begin
							digit_value <= minute - 'd30;
						end else begin
							if(minute < 'd50) begin
								digit_value <= minute - 'd40;
							end else begin
								digit_value <= minute - 'd50;
							end		
						end
					end
				end
			end
		end
		
		endcase
		

	 end
	 
	 
	 
	 	display_onedigit D1(
		.x(digit_value),
		.z(digit_display)
		);
		
		
	 
	 


endmodule
