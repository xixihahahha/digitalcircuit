`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/02 16:53:39
// Design Name: 
// Module Name: led_3color
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


module led_3color(
    input clk,
    input key1,
    input key2,
    output [3:0] led,
    input rst
    );
    

        
    parameter T0 = 50000000;
    parameter T1 = 500000000;
    
    reg [2:0] status = 0;
    reg model = 0;
    reg [31:0] ctr = 0;
    
    wire k1, k2;
    
        debounce u1 (
        .clk(clk),
        .rst(rst),
        .key(key1),
        .key_pulse(k1)
        );
    
        debounce u2 (
        .clk(clk),
        .rst(rst),
        .key(key2),
        .key_pulse(k2)
        );
    

          
    always @(posedge clk) begin
        if(ctr < T1) begin
            ctr = ctr + 1;
        end
        if(k2) begin
            model = !model;
            status = 0;
            ctr = 0;
        end
        else begin
            if(k1) begin 
                case(status) 
                    0: begin
                        status = 1;
                    end
                    1: begin
                        status = 2;
                    end
                    2:begin
                        if(ctr > T0 && !model) begin
                            status = 1;
                        end
                        else if(ctr > T1 && model) begin
                            status = 1;
                        end
                        else begin
                            status = 3;
                        end
                    end
                    3: begin
                        status = 4;
                    end
                    4: begin
                        if(ctr > T0 && !model) begin
                            status = 1;
                        end
                        else if(ctr > T1 && model) begin
                            status = 1;
                        end
                        else begin
                            status = 5;
                        end
                    end
                    5: begin
                        status = 0;
                    end
                    default begin
                        status = 0;
                    end
                endcase
                ctr = 0;
            end
        end
    end
    
    
    
    assign led = (status == 1)? 12 :
                 (status == 3)? 0 :
                 (status == 5)? 3 : 15;  
endmodule
