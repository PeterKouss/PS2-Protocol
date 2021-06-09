`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/30 18:26:00
// Design Name: 
// Module Name: myreg
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


module myreg(
    input reg_signal,
    input reset,
    input [7:0] data_in,
    output reg [7:0] data_out
    );

    always @(posedge reg_signal,posedge reset) begin
        if (reset) begin
            data_out<=0;
        end
        else begin
            if(data_in==8'h16)
                data_out<=8'h1;
            else if (data_in==8'h1E) begin
                data_out<=8'h2;
            end
            else if (data_in==8'h26) begin
                data_out<=8'h3;
            end
            else if (data_in==8'h25) begin
                data_out<=8'h4;
            end
            else if (data_in==8'h2E) begin
                data_out<=8'h5;
            end
            else if (data_in==8'h36) begin
                data_out<=8'h6;
            end
            else if (data_in==8'h3d) begin
                data_out<=8'h7;
            end
            else if (data_in==8'h3e) begin
                data_out<=8'h8;
            end
            else if (data_in==8'h46) begin
                data_out<=8'h9;
            end
            else if (data_in==8'h45) begin
                data_out<=8'h0;
            end
            else if (data_in==8'h1c) begin
                data_out<=8'ha;
            end
            else if (data_in==8'h32) begin
                data_out<=8'hb;
            end
            else if (data_in==8'h21) begin
                data_out<=8'hc;
            end
            else if (data_in==8'h23) begin
                data_out<=8'hd;
            end
            else if (data_in==8'h24) begin
                data_out<=8'he;
            end
            else if (data_in==8'h2b) begin
                data_out<=8'hf;
            end
            else begin
                data_out<=data_in;
            end
        end
    end

endmodule
