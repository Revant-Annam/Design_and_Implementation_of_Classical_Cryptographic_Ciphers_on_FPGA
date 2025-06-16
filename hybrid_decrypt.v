`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.06.2025 17:32:09
// Design Name: 
// Module Name: hybrid_decrypt
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


module hybrid_decrypt #(parameter N=32)(
    input  wire [16*N-1:0] encrypted_hybrid,     // Packed message: 256 bits
    input  wire [8*N-1:0] key,         // Packed key: 256 bits
    output wire [8*N-1:0] message    // Packed output
);

    genvar i;
    wire [8*N-1:0] decrypted;
    generate
        for (i = 0; i < N; i = i + 1) begin : polybius_decrypt
            wire [15:0] enc_char = encrypted_hybrid[16*(N-1-i) +: 16];
            wire [7:0] dec_hybrid_char;

            polybius_decrypt_modified polybius (
                .encrypted(enc_char),
                .char_out(dec_hybrid_char)
            );

            assign decrypted[8*(N-1-i) +: 8] = dec_hybrid_char;
        end
    endgenerate
    
    generate
        for (i = 0; i < N; i = i + 1) begin : vigenere_decrypt
            wire [7:0] decrypted_char = decrypted[8*(N-1-i) +: 8];
            wire [7:0] key_char = key[8*(N-1-i) +: 8];
            wire [7:0] msg_char;

            vigenere_decrypt_modified vigenere (
                .message_char(msg_char),
                .key_char(key_char),
                .encrypted_char(decrypted_char)
            );
            
            assign message[8*(N-1-i) +: 8] = msg_char;

        end
    endgenerate
    
    
endmodule
