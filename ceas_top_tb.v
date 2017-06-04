`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:21:55 06/05/2017
// Design Name:   ceas_top
// Module Name:   /home/alin/Desktop/xilnx/ceas_v1/ceas_tb.v
// Project Name:  ceas_v1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ceas_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ceas_tb;

	// Inputs
	reg clock;
	reg reset;
	reg i_rx_serial;
	reg b1;
	reg b2;
	reg b3;

	// Outputs
	wire [3:0] digit_select;
	wire [6:0] digit_display;
	wire led;
	wire led2;

	// Instantiate the Unit Under Test (UUT)
	ceas_top uut (
		.clock(clock), 
		.reset(reset), 
		.i_rx_serial(i_rx_serial), 
		.b1(b1), 
		.b2(b2), 
		.b3(b3), 
		.digit_select(digit_select), 
		.digit_display(digit_display), 
		.led(led), 
		.led2(led2)
	);

	initial begin
		// Initialize Inputs
		clock = 0;
		reset = 0;
		i_rx_serial = 0;
		b1 = 0;
		b2 = 0;
		b3 = 0;
		forever begin
		#1 clock <= ~clock;
		end
		end
		// Wait 100 ns for global reset to finish
		initial begin
		#100 reset = 1;
		#200 reset = 0;
		#5 b1 = 1;
		#2 b1 = 0;
		#2 b1 = 1;
		#2 b1 = 0;
		#2 b1 = 1;
		#12 b1 = 0;
		#2 b1 = 1;
		#20 b1 = 0;
		#20 b1 = 1;
		#50 b1 = 0;
		#20 b1 = 1;
		#20 b1 = 0;
		#20 b1 = 1;
		#20 b1 = 0;
		#50 b1 = 1;
		#5 b2 = 1;
		#2 b2 = 0;
		#2 b2 = 1;
		#2 b2 = 0;
		#2 b2 = 1;
		#12 b2 = 0;
		#2 b2 = 1;
		#20 b2 = 0;
		#20 b2 = 1;
		#50 b2 = 0;
		#5 b3 = 1;
		#2 b3 = 0;
		#2 b3 = 1;
		#2 b3 = 0;
		#2 b3 = 1;
		#12 b3 = 0;
		#2 b3 = 1;
		#20 b3 = 0;
		#20 b3 = 1;
		#50 b3 = 0;
		end
        
        
		// Add stimulus here


      
endmodule
		// Wait 100 ns for global reset to finish
		
        
		// Add stimulus here



