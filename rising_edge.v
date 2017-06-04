`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:34:27 06/04/2017 
// Design Name: 
// Module Name:    edgedetector 
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
module rising_edge(
	clk,               
	signal_in,   
	signal_out       
    );

input clk;
input signal_in;
output signal_out;

reg  signal_d;

always@(posedge clk)begin
	signal_d <= signal_in;
	
end
assign signal_out = (!signal_d) && signal_in;
endmodule
