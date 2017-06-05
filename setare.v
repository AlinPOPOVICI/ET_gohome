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
	clock,
	reset,     // semnal de reset pentru urmatoarea setare                          counter dupa semnal de stop dupa care se reseteaza 
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
	input reset;	
	input semnal_setare;    // pt timp 
	input semnal_setare_a;  //pt alarma
	input semnal_b1;        // incrementare ore
	input semnal_b2;        // incrementeaza minute 
	input semnal_stop;      // stop setare 
	output [4:0] ore;     
	output [5:0] minute;
	output load_alarma;
	output load_timp;
	
	

	reg [4:0] ore;          
	reg [5:0] minute;
	reg load_alarma;   
	reg load_timp;
	
	
	
			
	always@(negedge clock)begin
	if(reset == 'd1)begin
		ore <= 'd0;
		minute <= 'd0;
		load_alarma <= 'd0;
		load_timp <= 'd0;
	end else begin	
		// setare semnal de load potrivit 
		if(semnal_stop) begin
				if(semnal_setare) begin
					load_timp <= 'd1;
				end else begin
					if(semnal_setare_a)begin
						load_alarma <= 'd1;
					end	
				end
		end else begin 
			load_alarma <= 'd0;     // semanlul de stop ii doar pe un clock si astfel dupa ce si-a dat deja load sa nu intre in loop 
			load_timp <= 'd0;
			if(semnal_setare == 'd1 || semnal_setare_a == 'd1) begin 
				if(semnal_b1) begin
					if(ore == 'd23) begin
						ore <= 'd0;
					end else begin
						ore <= ore + 'd1;
					end		
				end 
				if(semnal_b2) begin
					if(minute == 'd59) begin
						minute <= 'd0;
					end else begin
						minute <= minute + 'd1;
					end
				end
			end else begin
				ore <= 'd0;
				minute <= 'd0;
			end
		end	
	end
	
end	
	


endmodule
