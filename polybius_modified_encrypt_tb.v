`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.06.2025 17:16:44
// Design Name: 
// Module Name: polybius_modified_encrypt_tb
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

module polybius_modified_encrypt_tb();
    reg [7:0] char_in;
    wire [7:0] encrypted;
    integer i;

    polybius_modified_encrypt dut(.char_in(char_in), .encrypted(encrypted));

    initial begin
        $monitor("For the given character %s the polybius modified encrypted value is %d", char_in, encrypted);
        
        char_in = ")";
        for(i=0;i<49;i=i+1) begin
            char_in = char_in +1;
            #5;
        end
            
            
        
        $finish;
    end
endmodule


