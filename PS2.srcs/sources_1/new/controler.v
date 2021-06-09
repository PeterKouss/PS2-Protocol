`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/23 19:46:36
// Design Name: 
// Module Name: controler
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


module controler(
    input uart_clk,
    input rst,
    input [7:0] p_in,
    input send_status,
    input receiver_status,
    output reg [7:0] p_out=0,
    output reg send_switch=0
    );

    wire [7:0] p_out_fifo;

    reg [7:0] p_out_reg;

    reg [3:0] ctrl_state=0; //
    reg [3:0] counter=0;
    reg rd_enable=0;
    wire fifo_empty;
    wire fifo_full;

    fifo_generator_0 fifo (
    .clk(uart_clk),      // input wire clk
    .din(p_in),      // input wire [7 : 0] din
    .wr_en(receiver_status),  // input wire wr_en
    .rd_en(rd_enable),  // input wire rd_en
    .dout(p_out_fifo),    // output wire [7 : 0] dout
    .full(fifo_full),    // output wire full
    .empty(fifo_empty)  // output wire empty
    );

    always @(posedge uart_clk, posedge rst)begin
        if(rst)begin
            ctrl_state<=4'd0;
            send_switch<=0;
            counter<=0;
            p_out_reg<=0;
            p_out<=0;
        end
        else begin
            case (ctrl_state)
                4'd0: begin
                    if(~fifo_empty) begin
                        ctrl_state<=4'd1;
                        send_switch<=0;
                        rd_enable<=1;
                    end
                    else begin
                        ctrl_state<=4'd0;
                        send_switch<=0;
                        rd_enable<=0;
                    end
                end

                4'd1:begin
                    rd_enable<=0;
                    ctrl_state<=4'd2;
                end

                4'd2:begin
                    p_out_reg<=p_out_fifo;
                    ctrl_state<=4'd3;
                end

                4'd3:begin
                    if(send_status==0) begin
                        if(counter==4'd15) begin
                            counter<=0;
                            ctrl_state<=4'd0;
                            send_switch<=1;
                            p_out<=p_out_reg;
                        end
                        else begin
                            counter=counter+1;
                            send_switch<=1;
                        end
                    end
                    else begin
                        ctrl_state<=4'd3;
                    end
                end

                default: begin 
                    ctrl_state<=4'd0;
                end
            endcase
        end
    end


   /* always @(posedge ~receiver_status, posedge rst) begin
        if(rst) begin
            p_out<=0;
            p_in_reg<=0;
            send_switch<=0;
            if_send<=0;
        end
        else begin
            p_in_reg<=p_in;
            if_send<=1;
        end
    end

    always @(posedge uart_clk,posedge rst) begin
        if(rst) begin
            p_out<=0;
            p_in_reg<=0;
            send_switch<=0;
            if_send<=0;
        end
        else begin
            if(if_send && ~send_status) begin
                if(counter==4'd15)begin
                    counter<=0;
                    if_send<=0;
                end
                else begin
                    counter<=counter+1;
                    send_switch<=1;
                    p_out<=p_in_reg;
                end
            end
            else begin
                send_switch<=0;
            end
        end
    end
    */

endmodule
