`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.06.2025 13:26:02
// Design Name: 
// Module Name: vigenere_decrypt_modified
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


module vigenere_decrypt_modified(    
    input  [7:0] key_char,        
    input [7:0] encrypted_char, // 6-bit as there are total 49 characters
    output reg  [7:0] message_char 
);

    reg [5:0] msg_idx,key_idx,enc_idx;  // Index after decryption (0-25)

    always @(*) begin
        
        key_idx = key_char - "*";
        enc_idx = encrypted_char - "*";
        // Vigenère decryption: (enc - key) mod 26
        msg_idx = (enc_idx - key_idx + 49) % 49;

        // Convert index back to character
        message_char = msg_idx + "*";
    end

endmodule
