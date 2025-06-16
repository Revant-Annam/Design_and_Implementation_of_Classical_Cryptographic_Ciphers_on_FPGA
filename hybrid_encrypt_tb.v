`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.06.2025 15:54:04
// Design Name: 
// Module Name: hybrid_encrypt_tb
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


module hybrid_encrypt_tb #(parameter M=12)();
    reg [8*M-1:0] message = "VAMSIKRISHNA";  // V, A, M, S, I, K, R, I, S, H, N, A
    reg [8*M-1:0] key = "NAGARAVINDRA";  // N, A, G, A, R, A, V, I, N, D, R, A
    wire [16*M-1:0] encrypted_hybrid;

    hybrid_encrypt #(.N(M))dut(
        .message(message),
        .key(key),
        .encrypted_hybrid(encrypted_hybrid)
    );

    integer i;
    initial begin
        $display("Message: %s", message);
        $display("Key:     %s", key);
        #10;
        $write("Encrypted Output: ");
        for (i = 0; i < M; i = i + 1) begin
            $write("%s", encrypted_hybrid[16*(M-1-i)+15 -: 8]);  // First ASCII digit
            $write("%s", encrypted_hybrid[16*(M-1-i)+7 -: 8]);   // Second ASCII digit
        end
        $write("\n");
        $finish;
end
endmodule
