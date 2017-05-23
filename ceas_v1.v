`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:32:23 05/23/2017 
// Design Name: 
// Module Name:    ceas_top 
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
module ceas_top(
		clock,
		reset,
		semnal_setare,
		semnal_setare_a,
		semnal_stop,
		semnal_b1,
		semnal_b2,
		digit_select,
      digit_display,
		led
    );
		input clock;
		input reset;
		input semnal_setare;
		input semnal_setare_a;
		input semnal_stop;
		input semnal_b1;
		input semnal_b2;
		output [3:0] digit_select;
      output [6:0]digit_display;
		output led;


wire load_alarma;
wire load_timp_manual;
wire load_timp_uart;	
wire [4:0] ore_setare_out;
wire [5:0] minute_setare_out;
wire [4:0] ore_counter_out;
wire [5:0] minute_counter_out;

counter_timp CT(
     .timp_ore1(ore_setare_out),
	  .timp_minute1(minute_setare_out), 
	  .timp_ore2(),
	  .timp_minute2(),
	  .out_ore(ore_counter_out),
	  .out_minute(minute_counter_out),
     .load_1(load_timp_manual),
     .load_2(),
	  .clock(clock),
	  .reset(reset)
    );
	 
	 
display D(
    .minute(minute_counter_out),
    .ore(ore_counter_out),
	 .minute_setare(minute_setare_out),
	 .ore_setare(ore_setare_out),
	 .semnal_setare(semnal_setare),
	 .clock(clock),
    .digit_select(digit_select),
    .digit_display(digit_display)
    );	 
	 
setare S(  
	 .clock(clock),
 	 .reset(reset),                              
	 .semnal_setare(semnal_setare),
	 .semnal_setare_a(semnal_setare_a),
	 .semnal_b1(semnal_b1),
	 .semnal_b2(semnal_b2),
	 .semnal_stop(semnal_stop),
	 .ore(ore_setare_out),
	 .minute(minute_setare_out),
	 .load_alarma(load_alarma),
	 .load_timp(load_timp_manual)
    );
endmodule
