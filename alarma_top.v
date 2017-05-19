`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:26:55 05/17/2017 
// Design Name: 
// Module Name:    alarma_top 
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
module alarma_top(
	clock,
	reset,
	minute_counter,
	ore_counter,
	load,        // uart opiune pt setare alarma la semnalul de load 
	minute_setare,
	ore_setare,
	stop,        // oprire alarma cand suna sau resetare daca nu 
	led
    );
	input stop; 
	input clock;
	input reset;
	input [5:0]minute_counter;
	input [4:0]ore_counter;
	input load;
	input [5:0]minute_setare;
	input [4:0]ore_setare;
	output led;

	reg [5:0]minute_alarma;
	reg [4:0]ore_alarma;
	reg semnal; //semnal daca suna 
   
	suna S(
	.clock(clock),
	.semnal(semnal),
	.led(led)
	);
	
	always@(*) begin
		if(load == 'd1) begin
			minute_alarma = minute_setare;
			ore_alarma = ore_setare;
		end else begin
			if(minute_alarma == minute_counter && ore_alarma == ore_counter)begin // partea de intarziere cu 10 min 
				semnal = 'd1;
			end else begin
				if(semnal == 'd1 && minute_alarma != minute_counter)begin // diferit nu diferenta de 1 minut pt ca de la 59 trece la 00
					semnal ='d0;
					if(ore_alarma == 'd23 && minute_alarma >= 'd50)  begin //ex: la ora 23:59 se va trece la 00:09
							ore_alarma = 'd0;
							minute_alarma = minute_alarma - 'd50;
		
					end else begin 
							if(minute_alarma >= 'd50)  begin          //ex: la minutul 59 se va trece la 09
								ore_alarma = ore_alarma + 'd1;
								minute_alarma = minute_alarma - 'd50;
		
							end else begin
								minute_alarma = minute_alarma + 'd10;
							end
					end
				end
			end
			
		end
	end


	always@(posedge clock)begin 
		if(reset == 'd1 || stop == 'd1) begin
			minute_alarma <= 6'b111111;
			ore_alarma <= 5'b11111;
			semnal <= 'd0;
		end
	end
	
	endmodule
