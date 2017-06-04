`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:05:58 06/04/2017 
// Design Name: 
// Module Name:    semnale_peclock 
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
module semnale_peclock(
	clock,
	reset, // de la un switch sau buton 
	b1,
	b2,
	b3,
	lung_1,
	lung_2,
	lung_3,
	scurt_1,
	scurt_2,
	scurt_3
    );
	 
	 
	 input clock;
	 input reset;
	 input b1;
	 input b2;
	 input b3;
	 output lung_1;
	 output lung_2;
	 output lung_3;
	 output scurt_1;
	 output scurt_2;
	 output scurt_3;

	 	 


											//in loc de 3 minim 15 (pt ca 7 la debounce)
	 reg [3:0] counter_1;	     //trebuie marit in functie de clock si durata care o vreu sa o inregistreze la buton la apasare lunga/scurta 
	 reg [3:0] counter_2;								           // cand pun alarma mai trebuie un semnal de oprire alarma si un input daca "suna alarma"
	 reg [3:0] counter_3;
	 
	 wire b1_d;
	 wire b2_d;
	 wire b3_d;
	 
	 wire s1;
	 wire s2;
	 wire s3;
	 wire l1;
	 wire l2;
	 wire l3;
	
	reg lung_1;
	reg lung_2;
	reg lung_3;
	reg scurt_1;
	reg scurt_2;
	reg scurt_3;
	reg lung_1_i;
	reg lung_2_i;
	reg lung_3_i;
	reg scurt_1_i;
	reg scurt_2_i;
	reg scurt_3_i;
	
	 reg [1:0] n1; //rising edge detectat asteapta falling edge  // 0 nu asteapta nimic
	 reg [1:0] n2;   // 1 asteapta falling edge scurt 
	 reg [1:0] n3;   // 2 asteapta falling edge lung 
	 reg [1:0] n1_o;
	 reg [1:0] n2_o;
	 reg [1:0] n3_o;
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
	 
	 // rising edges
	rising_edge R1(
	.clk(clock),               
	.signal_in(b1_d),   
	.signal_out(s1) );
	 
	rising_edge R2(
	.clk(clock),               
	.signal_in(b2_d),   
	.signal_out(s2) );
	
	rising_edge R3(
	.clk(clock),               
	.signal_in(b3_d),   
	.signal_out(s3) );
		
	// falling edges
	falling_edge F1(
	.clk(clock),               
	.signal_in(b1_d),   
	.signal_out(l1) );
	
	falling_edge F2(
	.clk(clock),               
	.signal_in(b2_d),   
	.signal_out(l2) );
	
	falling_edge F3(
	.clk(clock),               
	.signal_in(b3_d),   
	.signal_out(l3) );
	
	

	
	
 always@(*)begin
		lung_1_i = lung_1;
		lung_2_i = lung_2;
		lung_3_i = lung_3;
		scurt_1_i = scurt_1;
		scurt_2_i = scurt_2;
		scurt_3_i = scurt_3;
		n1 = n1_o;
		n2 = n2_o;
		n3 = n3_o;
		case(n1_o) 
	
		'd2:begin
			lung_1_i = 'd1;
			n1 = 'd0;
			end
		'd1:begin 
			if(counter_1 == 4'b1111) begin
				n1 = 'd2;
			end else begin
				if(l1 == 'd1)begin
					scurt_1_i = 'd1;
					n1 = 'd0;
				end
			end
			end
		'd0:begin
			scurt_1_i = 'd0;
			lung_1_i = 'd0;
			if(s1 == 'd1) begin
				n1 = 'd1;
			end
			end
		endcase 
		
		
		
		case(n2_o) 
	
		'd2:begin
			lung_2_i = 'd1;
			n2 = 'd0;
			end
		'd1:begin 
			if(counter_2 == 4'b1111) begin
				n2 = 'd2;
			end else begin
				if(l2 == 'd1)begin
					scurt_2_i = 'd1;
					n2 = 'd0;
				end
			end
			end
		'd0:begin
			scurt_2_i = 'd0;
			lung_2_i = 'd0;
			if(s2 == 'd1) begin
				n2 = 'd1;
			end			
			end
		endcase 
		
		
		case(n3_o) 
	
		'd2:begin
			lung_3_i = 'd1;
			n3 = 'd0;
			end
		'd1:begin 
			if(counter_3 == 4'b1111) begin
				n3 = 'd2;
			end else begin
				if(l3 == 'd1)begin
					scurt_3_i = 'd1;
					n3 = 'd0;
				end
			end
			end
		'd0:begin
			scurt_3_i = 'd0;
			lung_3_i = 'd0;
			if(s3 == 'd1) begin
				n3 = 'd1;
			end			
			end
		endcase 
	
 end
	
	
 always@(negedge clock)begin
	if(reset == 'd1) begin
		lung_1 <= 'd0;
		lung_2 <= 'd0;
		lung_3 <= 'd0;
		scurt_1 <= 'd0;
		scurt_2 <= 'd0;
		scurt_3 <= 'd0;
		n1_o <= 0;
		n2_o <= 0;
		n3_o <= 0;
	end else begin
		// counter pt butonlu 2
		if(n2 == 'd1) begin 
			counter_2 <= counter_2 +'d1;
		end else begin
			counter_2 <= 'd0;
		end
		//counter pt 3
		if(n3 == 'd1) begin
			counter_3 <= counter_3 +'d1;
		end else begin
			counter_3 <= 'd0;
		end
		//counter pt 1 
		if(n1 == 'd1) begin 
			counter_1 <= counter_1 +'d1;
		end else begin
			counter_1 <= 'd0;
		end
		lung_1 <= lung_1_i;
		lung_2 <= lung_2_i;
		lung_3 <= lung_3_i;
		scurt_1 <= scurt_1_i;
		scurt_2 <= scurt_2_i;
		scurt_3 <= scurt_3_i;
		n1_o <= n1;
		n2_o <= n2;
		n3_o <= n3;
		 
	
	end
	
 end
 


endmodule
