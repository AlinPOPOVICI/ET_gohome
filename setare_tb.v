`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:20:03 05/10/2017
// Design Name:   setare
// Module Name:   /home/alin/Desktop/xilnx/setare/setare_tb.v
// Project Name:  setare
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: setare
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module setare_tb;

	// Inputs
	reg clock;
	reg reset;
	reg semnal_setare;
	reg semnal_setare_a;
	reg semnal_b1;
	reg semnal_b2;
	reg semnal_stop;

	// Outputs
	wire [4:0] ore;
	wire [5:0] minute;
	wire load_alarma;
	wire load_timp;

	// Instantiate the Unit Under Test (UUT)
	setare uut (
		.clock(clock),
		.reset(reset),
		.semnal_setare(semnal_setare), 
		.semnal_setare_a(semnal_setare_a), 
		.semnal_b1(semnal_b1), 
		.semnal_b2(semnal_b2), 
		.semnal_stop(semnal_stop), 
		.ore(ore), 
		.minute(minute), 
		.load_alarma(load_alarma), 
		.load_timp(load_timp)
	);

	initial begin
		// Initialize Inputs
		clock = 0;
		semnal_setare = 0;
		semnal_setare_a = 0;
		semnal_b1 = 0;
		semnal_b2 = 0;
		semnal_stop = 0;
		forever begin
		#5 clock = ~clock;
		#3 semnal_b1 = ~semnal_b1;
		#2 semnal_b2 = ~semnal_b2;
		end
		// Wait 100 ns for global reset to finish
        
		// Add stimulus here

	end
	
	initial begin
		reset = 1;
		#10 reset =0;	
		#100 semnal_setare = 1;
		#100 semnal_stop = 1;
	end
	

	

      
endmodule

