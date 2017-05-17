`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:59:34 05/09/2017 
// Design Name: 
// Module Name:    setare 
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
module setare(  //poate trebuie sa pun semnalul de enable de la asisaj sa fie ca output de aici 
	clock,		// semnal de reset pentru urmatoarea setare              counter dupa semnal de stop dupa care se reseteaza 
	semnal_setare,
	semnal_setare_a,
	semnal_b1,
	semnal_b2,
	semnal_stop,
	ore,
	minute,
	load_alarma,
	load_timp
    );
	 
	input clock; 
	input semnal_setare;
	input semnal_setare_a;
	input semnal_b1;
	input semnal_b2;
	input semnal_stop;
	output [4:0] ore;
	output [5:0] minute;
	output load_alarma;
	output load_timp;
	
	reg [4:0] ore;
	reg [5:0] minute;
	reg load_alarma;
	reg load_timp;
	
	reg om;

	initial begin
		om <= 'd0;
		ore <= 'd0;
		minute <= 'd0;
		load_alarma <= 'd0;
		load_timp <= 'd0;
	end
	
	always@(posedge clock) begin
	//manipulare timp in functie de butoane 
		if((semnal_setare || semnal_setare_a)&& !semnal_stop) begin
			if(semnal_b2) begin
				om <= ~om;
			end 
			if(semnal_b1) begin 
				if(om == 'd0) begin
					if(ore == 'd23) begin
						ore <= 'd0;
					end else begin
						ore <= ore + 'd1;
					end
				end else begin 	
					if(minute == 'd59) begin
						minute <= 'd0;
					end else begin
						minute <= minute + 'd1;
					end
			   end
			end
		end
		// setare semnal de load potrivit 	
			if(semnal_stop) begin
				if(semnal_setare) begin
					load_timp <= 'd1;
				end else begin
					if(semnal_setare_a)begin
						load_alarma <= 'd1;
					end	
				end
			end	
		
	end		
			
		
	


endmodule
