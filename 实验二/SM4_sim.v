`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/09 19:31:18
// Design Name: 
// Module Name: key_Create_tb
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


module SM4_sim;
    reg [127:0] MK;
    reg [127:0] plain;
    wire [127:0] cipher;
    
    SM4 uut(
        .MK(MK),
        .cipher(cipher),
        .plain(plain)
    );
    
    initial begin
        MK = 0'h0123456789abcdeffedcba9876543210;
        plain = 0'h0123456789abcdeffedcba9876543210;;
    end

endmodule
