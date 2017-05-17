`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:20:03 05/09/2017 
// Design Name: 
// Module Name:    top 
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
module top( // urmeaza sa introduc input de la port serial
				//poate mai adaug buton 4 pt oprire alarma deja setata 
   clock,
	buton1,
	buton2,
	buton3,
	led1,
	led2,
	led3,
	display_select,
	display_digit
    );
	
	input clock;
	input buton1;
	input buton2;
	input buton3;
	output led1;
	output led2;
	output led3;
	output [3:0] display_select;
	output [6:0] display_digit;
	
	wire semanl1;//setare ceas
	wire semanl2;//setare alarma
	wire semanl3;//oprit setare
	wire semanl4;//semnal oprire alarma
	


endmodule
