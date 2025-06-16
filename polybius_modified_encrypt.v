`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.06.2025 16:50:25
// Design Name: 
// Module Name: polybius_modified_encrypt
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


module polybius_modified_encrypt #(parameter GRID =7)(
    input [7:0] message_char,
    output reg [15:0] encrypted_char
);
    reg [7:0] grid [0:GRID-1][0:GRID-1];

    integer i, j;
    reg [7:0] current_char;
    reg found;
    initial begin
        current_char = "*";
        for (i = 0; i < GRID; i = i + 1) begin
            for (j = 0; j < GRID; j = j + 1) begin
                grid[i][j] = current_char;
                current_char = current_char + 1;
            end
        end
    end

    always @(*) begin
        found = 0;
        encrypted_char =0 ;

        for (i = 0; i < GRID && !found; i = i + 1) begin
            for (j = 0; j < GRID && !found; j = j + 1) begin
                if (grid[i][j] == message_char) begin
                    encrypted_char[15:8] = (i + 1) + 8'd48;  // Convert to ASCII digit
                    encrypted_char[7:0]  = (j + 1) + 8'd48;
                    found = 1;
                end
            end
        end
    end
        
endmodule
