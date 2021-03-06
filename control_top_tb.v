`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:05:49 05/10/2017
// Design Name:   control_top
// Module Name:   /home/alin/Desktop/xilnx/control/control_top_tb.v
// Project Name:  control
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: control_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module control_top_tb;

	// Inputs
	reg clock;
	reg reset;
	reg b1;
	reg b2;
	reg b3;

	// Outputs
	wire semnal_setare;
	wire semnal_setare_a;
	wire semnal_stop;
	wire semnal_b1;
	wire semnal_b2;
	wire led;


	// Instantiate the Unit Under Test (UUT)
	control_top uut (
		.clock(clock), 
		.reset(reset), 
		.b1(b1), 
		.b2(b2), 
		.b3(b3), 
		.semnal_setare(semnal_setare), 
		.semnal_setare_a(semnal_setare_a), 
		.semnal_stop(semnal_stop), 
		.semnal_b1(semnal_b1), 
		.semnal_b2(semnal_b2), 
		.led(led)
	);

	initial begin
		// Initialize Inputs
		clock = 0;
		reset = 0;
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

