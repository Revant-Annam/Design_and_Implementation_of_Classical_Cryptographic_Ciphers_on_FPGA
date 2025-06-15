`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.06.2025 15:53:07
// Design Name: 
// Module Name: polybius_enc_tb
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


module polybius_enc_tb();
    reg [7:0] char_in;
    wire [7:0] encrypted;

    polybius_encrypt dut(.char_in(char_in), .encrypted(encrypted));

    initial begin
        $monitor("For the given character %s the polybius encrypted value is %d", char_in, encrypted);
        char_in = "A"; #5 ;
        char_in = "J"; #5 ;
        char_in = "Z"; #5 ;
        char_in = "M"; #5 ;
        char_in = "T"; #5 ;
        
        $finish;
    end
endmodule
