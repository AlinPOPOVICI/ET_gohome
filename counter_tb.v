`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:16:05 05/03/2017
// Design Name:   counter_timp
// Module Name:   /home/alin/Desktop/xilnx/timp/conuter_timp_tb.v
// Project Name:  timp
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: counter_timp
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module conuter_timp_tb;

	// Inputs
	reg [4:0] timp_ore1;
	reg [5:0] timp_minute1;
	reg [4:0] timp_ore2;
	reg [5:0] timp_minute2;
	reg load_1;
	reg load_2;
	reg clock;
	reg reset;
	wire [4:0]	ore;
	wire [5:0] minute;

	// Instantiate the Unit Under Test (UUT)
	counter_timp uut (
		.timp_ore1(timp_ore1), 
		.timp_minute1(timp_minute1), 
		.timp_ore2(timp_ore2), 
		.timp_minute2(timp_minute2), 
		.load_1(load_1), 
		.load_2(load_2), 
		.ore(ore),
		.minute(minute),
		.clock(clock), 
		.reset(reset)
	);

	initial begin
		// Initialize Inputs
		timp_ore1 = 0;
		timp_minute1 = 0;
		timp_ore2 = 0;
		timp_minute2 = 0;
		load_1 = 0;
		load_2 = 0;
		clock = 0;

		forever begin
		#1 clock = ~clock;
		end
	end
	
	initial begin
			reset = 1;
			#15;
			reset = 0;
			#500 	timp_ore1 = 'd12;
					timp_minute1 = 'd35;
			#1 load_1 = 1;
			#10 load_1 = 0;
	
	end
	
		// Wait 100 ns for global reset to finish
	always@* begin
	//#1 clock = ~clock;
	
	#5 timp_ore1 = 'd12;
		timp_minute1 = 'd35;
	#5 load_1 = 1;
	
        
		// Add stimulus here

	end
      
endmodule

