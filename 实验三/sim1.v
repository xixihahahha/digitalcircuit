`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/02 17:31:45
// Design Name: 
// Module Name: sim1
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


module sim1;
    reg clk, k1, k2;
    wire [3:0] led;
    
    led_3color uut(
        .clk(clk),
        .k1(k1),
        .k2(k2),
        .led(led)
    );
    
    defparam uut.T0 = 3;
    defparam uut.T1 = 10;
    initial begin
       clk = 0;
       k1 = 0;
       k2 = 0;
       #10 k1 = !k1;
       #10 k1 = !k1;
       #10 k1 = !k1;
       #10 k1 = !k1;
       #10 k1 = !k1;
       #10 k1 = !k1;
       #10 k1 = !k1;
       #10 k1 = !k1;
       #10 k1 = 0;

        
       #30 k1 = !k1;
       
       
    end 
    
    
    
    always #10 clk = !clk;
endmodule
