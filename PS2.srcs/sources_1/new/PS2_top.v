`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/30 17:10:18
// Design Name: 
// Module Name: PS2_top
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


module PS2_top(
    input sys_clk,
    input data_clock,
    input data_in,
    input reset,
    output wire s_out,
    output wire [3:0] an,
    output wire [7:0] sseg
    );

    assign rst = ~reset;

    parameter [12:0] buderate_code = 13'd325;

    wire [7:0] p_read;
    wire [7:0] p_sure;
    wire [7:0] p_send;
    wire read_sure;

    wire uart_clk_16x;
    wire sd_st;
    wire sd_sw;


    PS2_read ps2read(
    .sys_clock(sys_clk),
    .clock_in(data_clock),
    .reset(rst),
    .data_in(data_in),
    .data_read(p_read),
    .read_sure(read_sure)
    );

    myreg myreg_to_reg(
    .reg_signal(read_sure),
    .reset(rst),
    .data_in(p_read),
    .data_out(p_sure)
    );


    scan_led_hex_disp led_dis(
    .clk(sys_clk),
    .reset(rst),
    .hex3(p_sure[7:4]),
    .hex2(p_sure[3:0]),
    .hex1(4'd0),
    .hex0(read_sure),
    .dp_in(4'd0),
    .an(an),
    .sseg(sseg)         
     );

    clock_generate clk_gnrt(
    .sys_clk(sys_clk),
    .buderate_code(buderate_code), //13d'325 as 9600Hz, 13d'27 as 115200Hz
    .uart_clk_16x(uart_clk_16x)
    );

    controler ctrl(
    .uart_clk(uart_clk_16x),
    .rst(rst),
    .p_in(p_read),
    .send_status(sd_st),
    .receiver_status(read_sure),
    .p_out(p_send),
    .send_switch(sd_sw)
    );

     sender sder(
    .uart_16x_clock(uart_clk_16x),
    .p_in(p_send),
    .send_switch(sd_sw),
    .rst(rst),
    .send_status(sd_st), //1 means oquipyed
    .s_out(s_out)
    );


endmodule
