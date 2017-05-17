`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:28:29 05/09/2017 
// Design Name: 
// Module Name:    display 
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
module display(
    minute,
    ore,
	 minute_setare,
	 ore_setare,
	 semnal_setare,
	 clock,
    digit_select,
    digit_display
    );
	 
	 input [5:0] minute;
    input [4:0] ore;
	 input [5:0] minute_setare;
    input [4:0] ore_setare;
	 input semnal_setare;
	 input clock;
    output [3:0] digit_select;
    output [6:0] digit_display;
	 
	 reg [4:0] ore_i;
	 reg [5:0] minute_i;
	 
	always@(posedge clock) begin
	 if(semnal_setare) begin
		ore_i <= ore_setare;
		minute_i <= minute_setare;
	 end else begin
	 	ore_i <= ore;
		minute_i <= minute;
	 end
	 end
	 
	 
	 display_fourdigit f2(
	 .minute(minute_i),
    .ore(ore_i),
	 .clock(clock),
    .digit_select(digit_select),
    .digit_display(digit_display)
	 );


endmodule
