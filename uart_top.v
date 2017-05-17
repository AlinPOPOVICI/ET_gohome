`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:14:14 05/16/2017 
// Design Name: 
// Module Name:    uart_top 
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
module uart_top(
   input        CLKS_PER_BIT,
	input 		 reset,
   input        i_Clock,
   input        i_Rx_Serial,
	output  	[6:0] minute,
	output   [5:0] ore,
	output       load	
	 );
	 
	reg [1:0] count; 	 
	reg ore_in;
	reg minute_in;

uart U1();
endmodule
