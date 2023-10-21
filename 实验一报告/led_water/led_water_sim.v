`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/20 22:25:13
// Design Name: 
// Module Name: led_water_sim
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


module led_water_sim;
    reg clk;
    reg rst;
    wire [3:0] led;

defparam uut.MAXS = 5;

    led_water uut(
        .clk(clk),
        .rst_n(rst),
        .led_on(led)
        );
        
    initial begin
        clk = 0;
        rst = 1;
    end

    always #1 clk = ~clk;
endmodule
