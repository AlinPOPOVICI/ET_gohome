`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:14:14 05/14/2017 
// Design Name: 
// Module Name:    uart_top 
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

//litere micic ! !!
module uart_top(
			 reset,
			 i_clock,
          i_rx_serial,
	  		 minute,
	   	 ore,
	       load	
	 );
	input 		 reset;
   input        i_clock;
   input        i_rx_serial;
	output  	 	 [5:0] minute;
	output   	 [4:0] ore;
	output       load;	 
	 
	reg [1:0] count;
	reg [1:0] count_c;	//00 asteapta //01 primit start //10 primit ore //11 primit minute  
	reg [4:0] ore_iner;
	reg [5:0] minute_iner;
	reg       i_rx_dv;
	reg       rx_dv;
   reg [7:0] i_rx_byte;
	reg [7:0] rx_byte;


uart U1(
     .i_clock(i_clock),
     .i_rx_serial(i_rx_serial),
     .o_rx_dv(rx_dv),
     .o_rx_byte(rx_byte)
);

always@(posedge clock) begin
	if(reset == 1) begin
	    ore <= 'd0;
		 minute <= 'd0;
		 count <='d0;
		 load <= 'd0; // dupa load va primi un reset dupa "n" clock  sau pus instant pe 0 daca merge (la tranzitie  11->00) 
	// urmeaza si altele
	end else begin
		count <= count_c;
		i_rx_dc <= rx_dv;
		i_rx_byte <= rx_byte;// nu cred ca ii necesar dar nu cred ca impiedica 
		if(load == 'd1) begin
			ore <= ore_iner;
			minute <= minute_iner;
		end
	end
end

always@(*) begin
	count_c = 'd0;
	case (count)
	
	
	'd0:
		begin
			if(i_rx_dv == 'd0)begin
				count_c = 'd0;
			end else begin 
				if(i_rx_byte = 8'hff) begin
					count_c ='d1;
				end
			end 
		end
		
		
	'd1:
		begin
			if(i_rx_dv == 'd0)begin
				count_c = 'd1;
			end else begin 
				ore_iner = i_rx_byte[4:0];
				count_c = 'd2;	
 			end 
		end
		
		
	'd2:
		begin
			if(i_rx_dv == 'd0)begin
				count_c = 'd3;
			end else begin 
				minute_iner = i_rx_byte[5:0];
				count_c = 'd0;
 			end 
		end
	
	
	'd3:
		begin
			if(i_rx_dv == 'd0)begin
				count_c = 'd3;
			end else begin 
				if(i_rx_byte = 8'hff) begin
					count_c ='d0;
					load = 'd1;
				end
 			end 
		end
	default :
          count = 'd0; 
	endcase
end



endmodule
