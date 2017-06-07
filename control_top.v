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
	semnal_b2
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

	 

	 reg semnal_setare = 'd0;
	 reg semnal_setare_a = 'd0;
	 reg semnal_stop = 'd0;
	 reg semnal_b1 = 'd0;
	 reg semnal_b2 = 'd0;	 
	 
	 wire lung_1;
	 wire lung_2;
	 wire lung_3;
	 wire scurt_1;
	 wire scurt_2;
	 wire scurt_3;
	 
	parameter S_ID  = 2'b00; //sates
	parameter S_CE = 2'b01;
	parameter S_AL = 2'b10;
	parameter S_ST = 2'b11;

	
	reg [1:0] S_MAIN;

	semnale_peclock PC(
	.clock(clock),
	.reset(reset), // de la un switch 
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
	
	always@(posedge clock) begin
		if(reset == 'd1)begin
			semnal_setare <= 'd0;
			semnal_setare_a <= 'd0;
			semnal_stop <= 'd0;
			semnal_b1 <= 'd0;
			semnal_b2 <= 'd0;
			S_MAIN <= S_ID;
		end else begin
		
		case(S_MAIN) 
		S_ID:begin
			if(lung_3 == 'd1)begin
				semnal_stop <= 'd1;
			end else begin
				semnal_stop <= 'd0;
			end
			semnal_setare <= 'd0;
			semnal_setare_a <= 'd0;
			semnal_b1 <= 'd0;
			semnal_b2 <= 'd0;
			if(lung_1 == 'd1)begin
				S_MAIN <= S_CE;
			end else begin
				if(lung_2 == 'd1) begin
					S_MAIN<= S_AL;
				end
			end	
		end
			
		S_CE:begin
			semnal_setare <= 'd1;
			if(lung_3 == 'd1)begin
				semnal_stop <= 'd1;
				S_MAIN <= S_ID;
			end else begin
				if(lung_1 == 'd1 || scurt_1 == 'd1)begin
					semnal_b1 <= 'd1;
					S_MAIN <= S_CE;
				end else begin
					if(lung_2 == 'd1 || scurt_2 == 'd1) begin
						semnal_b2 <= 'd1;
						S_MAIN <= S_CE;
					end else begin
						semnal_b1 <= 'd0;
						semnal_b2 <= 'd0;
					end
				end	
			end
		end
		
		S_AL:begin
			semnal_setare_a <= 'd1;
			if(lung_3 == 'd1)begin
				semnal_stop <= 'd1;
				S_MAIN <= S_ID;
			end else begin
				if(lung_1 == 'd1 || scurt_1 == 'd1)begin
					semnal_b1 <= 'd1;
					S_MAIN <= S_AL;
				end else begin
					if(lung_2 == 'd1 || scurt_2 == 'd1) begin
						semnal_b2 <= 'd1;
						S_MAIN <= S_AL;
					end else begin
						semnal_b1 <= 'd0;
						semnal_b2 <= 'd0;
					end
				end	
			end
		end
		endcase
	
	end
	end
	
	
	


endmodule
