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
	led,
	led2
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
	output led2;
	
	reg [5:0]minute_alarma;
	reg [5:0]minute_alarma_i;
	reg [4:0]ore_alarma;
	reg [4:0]ore_alarma_i;
	reg semnal;	//semnal daca suna 
   reg semnal_i;
	reg led;
	reg led2;
	//suna S(
	//.clock(clock),
	//.semnal(semnal),
	//.led(led)
	//);
	
	always@(*) begin
		minute_alarma = minute_alarma_i;
		ore_alarma = ore_alarma_i;
		semnal = semnal_i;		
			if(minute_alarma_i == minute_counter && ore_alarma_i == ore_counter)begin // partea de intarziere cu 10 min 
				semnal = 'd1;
			end else begin
				if(semnal_i == 'd1 && minute_alarma_i != minute_counter)begin // diferit nu diferenta de 1 minut pt ca de la 59 trece la 00
					semnal ='d0;
					if(ore_alarma_i == 'd23 && minute_alarma_i >= 'd50)  begin //ex: la ora 23:59 se va trece la 00:09
							ore_alarma = 'd0;
							minute_alarma = minute_alarma - 'd50;
		
					end else begin 
							if(minute_alarma_i >= 'd50)  begin          //ex: la minutul 59 se va trece la 09
								ore_alarma = ore_alarma + 'd1;
								minute_alarma = minute_alarma - 'd50;
		
							end else begin
								minute_alarma = minute_alarma + 'd10;
							end
					end
				end
			end
	end


	always@(negedge clock)begin 
		if(reset == 'd1 || stop == 'd1) begin
			minute_alarma_i <= 6'b111111;
			ore_alarma_i <= 5'b11111;
			semnal_i <= 'd0;
			led <= 'd0;
		end else begin
			led2 <= semnal;
			minute_alarma_i <= minute_alarma;
			ore_alarma_i <= ore_alarma;
			semnal_i <= semnal;
			if(load == 'd1) begin
				led <= 'd1;
				minute_alarma_i <= minute_setare;
				ore_alarma_i <= ore_setare;
			end
		end
		
	end
	
	endmodule
