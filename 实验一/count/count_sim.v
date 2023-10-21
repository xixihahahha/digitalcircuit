`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/21 01:34:54
// Design Name: 
// Module Name: count_sim
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


module count_sim;
    reg clk, rst, key;
    wire [7:0] led;
    wire [5:0] sel;
    
    count uut(
        .clk(clk),
        .key(key),
        .rst(rst),
        .led(led),
        .sel(sel)
        );
    
    initial begin
        rst = 0;
        clk = 0;
        key = 1;
        
        #10
        rst = 1;
    end
    
    always #1 clk = !clk;
    always #20 key = !key;
    

endmodule
