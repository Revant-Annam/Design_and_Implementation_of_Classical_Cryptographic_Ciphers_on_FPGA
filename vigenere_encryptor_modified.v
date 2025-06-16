`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.06.2025 20:36:50
// Design Name: 
// Module Name: vigenere_encryptor_modified
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


module vigenere_encryptor_modified(
    input  [7:0] message_char,    // ASCII A-Z
    input  [7:0] key_char,        // ASCII A-Z
    output reg [7:0] encrypted_char // ASCII A-Z
);
    always @(*) begin
        encrypted_char = (((message_char - "*") + (key_char - "*")) % 49)+"*";
    end
endmodule
