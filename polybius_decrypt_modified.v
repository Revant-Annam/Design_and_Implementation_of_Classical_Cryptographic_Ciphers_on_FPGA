`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.06.2025 18:53:43
// Design Name: 
// Module Name: polybius_decrypt_modified
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


module polybius_decrypt_modified #(parameter GRID =7)(
    input [15:0] encrypted,
    output reg [7:0] char_out
);
    reg [7:0] grid [0:GRID-1][0:GRID-1];

    reg [7:0] char_i, char_j;
    integer i,j;
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
        char_out = "*";

        for (char_i = "1"; char_i < "8" && !found; char_i = char_i + 1) begin
            for (char_j = "1"; char_j < "8" && !found; char_j = char_j + 1) begin
                if (char_i == encrypted[15:8] & char_j == encrypted[7:0]) begin
                    char_out = grid[char_i-8'd48-1][char_j-8'd48-1];
                    found = 1;
                end
            end
        end
    end
        
endmodule
