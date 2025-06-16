`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.06.2025 14:21:07
// Design Name: 
// Module Name: hybrid_encrypt
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


module hybrid_encrypt #(parameter N = 32)(
    input  wire [8*N-1:0] message,     // Packed message: 256 bits
    input  wire [8*N-1:0] key,         // Packed key: 256 bits
    output wire [16*N-1:0] encrypted_hybrid    // Packed output
);

    genvar i;
    wire [8*N-1:0] encrypted;

    generate
        for (i = 0; i < N; i = i + 1) begin : vigenere_encrypt
            wire [7:0] msg_char = message[8*(N-1-i) +: 8];
            wire [7:0] key_char = key[8*(N-1-i) +: 8];
            wire [7:0] enc_char;

            vigenere_encryptor_modified vigenere (
                .message_char(msg_char),
                .key_char(key_char),
                .encrypted_char(enc_char)
            );
            
            assign encrypted[8*(N-1-i) +: 8] = enc_char;

        end
    endgenerate
    
    generate
        for (i = 0; i < N; i = i + 1) begin : polybius_encrypt
            wire [7:0] enc_char = encrypted[8*(N-1-i) +: 8];
            wire [15:0] enc_hybrid_char;

            polybius_modified_encrypt polybius (
                .message_char(enc_char),
                .encrypted_char(enc_hybrid_char)
            );

            assign encrypted_hybrid[16*(N-1-i) +: 16] = enc_hybrid_char;
        end
    endgenerate
endmodule

