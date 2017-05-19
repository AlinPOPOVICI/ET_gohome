`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:30:38 05/17/2017 
// Design Name: 
// Module Name:    suna 
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
module suna(
	clock,
	semnal,
	led
    );
	input clock; 
	input semnal;
	output led;
	 
	reg led;
	reg led_o = 'd0;
	
always@(posedge clock)begin
	if(semnal == 'd1) begin
		led <= led_o;
	end else begin
		led <= 'd0;
	end
	
end

always@(*)begin
	if(semnal == 'd1) begin
		led_o = ~led_o;
	end
end		

endmodule
