	`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:23:53 05/19/2017
// Design Name:   display
// Module Name:   /home/alin/Desktop/xilnx/Display/display_tb.v
// Project Name:  Display
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: display
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module display_tb;

	// Inputs
	reg [5:0] minute;
	reg [4:0] ore;
	reg [5:0] minute_setare;
	reg [4:0] ore_setare;
	reg semnal_setare;
	reg clock;

	// Outputs
	wire [3:0] digit_select;
	wire [6:0] digit_display;

	// Instantiate the Unit Under Test (UUT)
	display uut (
		.minute(minute), 
		.ore(ore), 
		.minute_setare(minute_setare), 
		.ore_setare(ore_setare), 
		.semnal_setare(semnal_setare), 
		.clock(clock), 
		.digit_select(digit_select), 
		.digit_display(digit_display)
	);

	initial begin
		// Initialize Inputs
		minute = 0;
		ore = 0;
		minute_setare = 0;
		ore_setare = 0;
		semnal_setare = 0;
		clock = 0;
		forever begin
		#3    clock = ~clock;
		end
	end	

		always@(*)begin
			#10;
			minute = 'd44;
			ore = 'd10;
			#20;
			minute = 'd9;
			ore = 'd0;
			#10;
		end
	
      
endmodule


