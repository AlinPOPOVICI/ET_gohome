`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:49:11 05/10/2017 
// Design Name: 
// Module Name:    control_top 
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
module control_top(
	clock,
	reset, // de la un switch sau buton 
	b1,
	b2,
	b3,
	semnal_setare,
	semnal_setare_a,
	semnal_stop,
	semnal_b1,
	semnal_b2,
	led,
	semnal_reset
    );
	 
	 
	 input clock;
	 input reset;
	 input b1;
	 input b2;
	 input b3;
	 output semnal_setare;
	 output semnal_setare_a;
	 output semnal_stop;
	 output semnal_b1;
	 output semnal_b2;
	 output led;
	 output semnal_reset;
	 
	 reg semnal_setare = 'd0;
	 reg semnal_setare_a = 'd0;
	 reg semnal_stop = 'd0;
	 reg semnal_b1 = 'd0;
	 reg semnal_b2 = 'd0;	 
	 
	 reg [3:0] counter = 'd0; //in loc de 3 minim 15 (pt ca 7 la debounce)
	 reg [3:0] counter2 = 'd0;	 //trebuie marit in functie de clock si durata care o vreu sa o inregistreze la buton la apasare lunga/scurta 
									// cand pun alarma mai trebuie un semnal de oprire alarma si un input daca "suna alarma"
	 wire b1_d;
	 wire b2_d;
	 wire b3_d;
	 
	/* initial begin
	 counter = 'd0;
	 counter2 = 'd0;
	 end
	 */
	 
	 debounce d1(
	 .pb(b1),
	 .clock(clock),
	 .semnal(b1_d));
	 
	 debounce d2(
	 .pb(b2),
	 .clock(clock),
	 .semnal(b2_d));
	 
	 debounce d3(
	 .pb(b3),
	 .clock(clock),
	 .semnal(b3_d));
	 
	/* always@(posedge clock) begin
		if(counter == 4'b1111) begin
			counter <= 'd0;
		end else begin
			counter <= counter + 1'b1;
		end
	end */
	
	always@(posedge clock) begin
		if(semnal_setare == 0 && semnal_setare_a == 0) begin
			if(b1_d) begin
				if(counter == 4'b1111) begin
					counter <= 'd0;
					semnal_setare <= 1;
				end else begin
					counter <= counter + 1'b1;
				end
			end else begin
				if(b2_d) begin
					if(counter == 4'b1111) begin
						counter <= 'd0;
						semnal_setare_a <= 1;
					end else begin
						counter <= counter + 1'b1;
					end
				end	
			end
		end else begin 
			if(b3_d) begin
				if(counter == 4'b1111) begin
					counter <= 'd0;
					semnal_setare <= 0;
					semnal_setare_a <=0;
					semnal_stop <= 1;
				end else begin
					counter <= counter + 1'b1;
				end	
			end else begin
				if(b2_d) begin    // counter mai mic pentru apasari scurte 
					semnal_b2 <= 1;
				end else begin
					semnal_b2 <= 0;
					if(b1_d) begin
						semnal_b1 <= 1;
					end else begin
						semnal_b1 <= 0;
					end
				end
			end
		end
		
		if(counter == counter2 + 'd1) begin // resetare counter daca nu se mai apasa butonul 
			counter2 <= counter;             // inca nu am rezolvat problema cu apasare consecutiva 
		end else begin
			counter <= 'd0;
			counter2 <= 'd0;
		end
	end
	always@(posedge clock) begin
		semnal_stop <= 0;
	
endmodule
