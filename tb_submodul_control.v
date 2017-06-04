`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:38:17 06/04/2017
// Design Name:   semnale_peclock
// Module Name:   /home/alin/Desktop/xilnx/control/test_PC.v
// Project Name:  control
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: semnale_peclock
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_PC;

	// Inputs
	reg clock;
	reg reset;
	reg b1;
	reg b2;
	reg b3;

	// Outputs
	wire lung_1;
	wire lung_2;
	wire lung_3;
	wire scurt_1;
	wire scurt_2;
	wire scurt_3;


	// Instantiate the Unit Under Test (UUT)
	semnale_peclock uut (
		.clock(clock), 
		.reset(reset), 
		.b1(b1), 
		.b2(b2), 
		.b3(b3), 
		.lung_1(lung_1), 
		.lung_2(lung_2), 
		.lung_3(lung_3), 
		.scurt_1(scurt_1), 
		.scurt_2(scurt_2), 
		.scurt_3(scurt_3)
	);

	initial begin
		// Initialize Inputs
		clock = 0;
		reset = 0;
		b1 = 0;
		b2 = 0;
		b3 = 0;
		forever begin
		#1 clock = ~clock;
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

