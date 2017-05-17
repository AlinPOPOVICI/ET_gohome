`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:15:59 05/10/2017 
// Design Name: 
// Module Name:    debounce 
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
module debounce(
	 pb,
	 clock,
	 semnal
    );
	 
	 input pb;
	 input clock;
	 output semnal;
	 
	 reg semnal;
	 

	 reg [7:0] count_d;
	 reg [7:0] count_q;
	 
	 
	always @(*) begin
		count_d = count_q;
		if(count_d[7:0] == 8'b00000000)begin
			semnal = 1'b0;
		end else begin
			if(count_d[7:0] == 8'b11111111) begin
				semnal = 1'b1;
			end else begin
				semnal = semnal;
			end
		end
		count_d[7:0] = {count_d[6:0],pb};
	end
	
	always@(posedge clock) begin
		count_q <= count_d; 
	end	

endmodule
	


