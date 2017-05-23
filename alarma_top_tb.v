`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:18:50 05/23/2017
// Design Name:   alarma_top
// Module Name:   /home/alin/Desktop/xilnx/alarma/alarma_tb.v
// Project Name:  alarma
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: alarma_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alarma_tb;

	// Inputs
	reg clock;
	reg reset;
	reg [5:0] minute_counter;
	reg [4:0] ore_counter;
	reg load;
	reg [5:0] minute_setare;
	reg [4:0] ore_setare;
	reg stop;

	// Outputs
	wire led;

	// Instantiate the Unit Under Test (UUT)
	alarma_top uut (
		.clock(clock), 
		.reset(reset), 
		.minute_counter(minute_counter), 
		.ore_counter(ore_counter), 
		.load(load), 
		.minute_setare(minute_setare), 
		.ore_setare(ore_setare), 
		.stop(stop), 
		.led(led)
	);

	initial begin
		// Initialize Inputs
		clock = 0;
		reset = 0;
		minute_counter = 'd23;
		ore_counter = 'd12;
		load = 0;
		minute_setare = 'd22;
		ore_setare = 'd9;
		stop = 0;
		forever begin
			#3 clock = ~clock;
		end
	end
		
		initial begin
		#10 reset = 1;
		#10 reset = 0;
		#10 load = 1;
		#50 load = 0;
		#10 minute_counter = 'd22;
			 ore_counter = 'd9;
			 #20 minute_counter = 'd32;
			 ore_counter = 'd9;
		#50 stop = 1;

	end
		
	
        
		// Add stimulus here


      
endmodule

