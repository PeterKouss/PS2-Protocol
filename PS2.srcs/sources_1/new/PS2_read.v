`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/30 16:45:24
// Design Name: 
// Module Name: PS2_read
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module PS2_read(
    input sys_clock,
    input clock_in,
    input reset,
    input data_in,
    output reg [7:0] data_read=0,
    output reg  read_sure=0
    );

reg [3:0] state=0;

reg oddcheck=0; //odd 1 means 1

reg [2:0] clock_reg=0;

wire clock_in_neg;

always @(posedge sys_clock,posedge reset) begin
    if(reset)begin
        clock_reg<=0;
    end
    else begin
        clock_reg[0]<=clock_in;
        clock_reg[1]<=clock_reg[0];
        clock_reg[2]<=clock_reg[1];
    end
end

assign clock_in_neg=(~clock_reg[2]) & clock_reg[1];


always @( posedge sys_clock , posedge reset) begin
if(reset)begin
    state<=0;
    read_sure<=0;
end
else begin
    if(clock_in_neg)begin
        case (state)
        4'd0:begin
            if (data_in==0) begin
                state<=4'd1;
                read_sure<=0;
            end
            else begin
                state<=4'd0;
                read_sure<=0;
            end
        end 

        4'd1:begin
            if(data_in==1)begin
                data_read[0]<=data_in;
                state<=4'd2;
                oddcheck<=~oddcheck;
            end
            else begin
                data_read[0]<=data_in;
                state<=4'd2;
                oddcheck<=oddcheck;
            end 
        end

        4'd2:begin
            if(data_in==1)begin
                data_read[1]<=data_in;
                state<=4'd3;
                oddcheck<=~oddcheck;
            end
            else begin
                data_read[1]<=data_in;
                state<=4'd3;
                oddcheck<=oddcheck;
            end
            
        end  

        4'd3:begin
            if(data_in==1)begin
                data_read[2]<=data_in;
                state<=4'd4;
                oddcheck<=~oddcheck;
            end
            else begin
                data_read[2]<=data_in;
                state<=4'd4;
                oddcheck<=oddcheck;
            end
            
        end  

        4'd4:begin
            if(data_in==1)begin
                data_read[3]<=data_in;
                state<=4'd5;
                oddcheck<=~oddcheck;
            end
            else begin
                data_read[3]<=data_in;
                state<=4'd5;
                oddcheck<=oddcheck;
            end
            
        end

        4'd5:begin
            if(data_in==1)begin
                data_read[4]<=data_in;
                state<=4'd6;
                oddcheck<=~oddcheck;
            end
            else begin
                data_read[4]<=data_in;
                state<=4'd6;
                oddcheck<=oddcheck;
            end
            
        end

        4'd6:begin
            if(data_in==1)begin
                data_read[5]<=data_in;
                state<=4'd7;
                oddcheck<=~oddcheck;
            end
            else begin
                data_read[5]<=data_in;
                state<=4'd7;
                oddcheck<=oddcheck;
            end
            
        end

        4'd7:begin
            if(data_in==1)begin
                data_read[6]<=data_in;
                state<=4'd8;
                oddcheck<=~oddcheck;
            end
            else begin
                data_read[6]<=data_in;
                state<=4'd8;
                oddcheck<=oddcheck;
            end   
        end 

        4'd8:begin
            if(data_in==1)begin
                data_read[7]<=data_in;
                state<=4'd9;
                oddcheck<=~oddcheck;
            end
            else begin
                data_read[7]<=data_in;
                state<=4'd9;
                oddcheck<=oddcheck;
            end
            
        end

        4'd9:begin
            if(oddcheck==data_in)begin
                read_sure<=1;
                state<=4'd10;
            end
            else begin
                read_sure<=1;
                state<=4'd10;
            end
        end

        4'd10:begin
            state<=4'd0;
            read_sure<=0;
        end
  


        default: begin
            state<=4'd0;
            read_sure<=0;
        end

    endcase
    end
    end
end

endmodule
