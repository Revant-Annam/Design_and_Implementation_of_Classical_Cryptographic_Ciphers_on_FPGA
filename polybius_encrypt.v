`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.06.2025 15:36:08
// Design Name: 
// Module Name: polybius_encrypt
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


module polybius_encrypt(
    input [7:0] char_in,
    output reg [7:0] encrypted
);
    reg [7:0] grid [0:4][0:4];

    integer i, j;
    reg [7:0] current_char;
    reg found;
    initial begin
        current_char = "A";
        for (i = 0; i < 5; i = i + 1) begin
            for (j = 0; j < 5; j = j + 1) begin
                if (current_char == "Z") begin
                    grid[i][j] = "Y"; 
                    current_char = current_char + 1; 
                end else begin
                    grid[i][j] = current_char;
                    current_char = current_char + 1;
                end
            end
        end
    end

    always @(*) begin
        found = 0;
        encrypted =0 ;

        for (i = 0; i < 5 && !found; i = i + 1) begin
            for (j = 0; j < 5 && !found; j = j + 1) begin
                if(char_in != "Z") begin
                    if (grid[i][j] == char_in) begin
                        encrypted = (i+1) * 10 + (j+1);
                        found = 1;
                    end
                end
                else begin
                    encrypted = 55;
                    found = 1;
                end
            end
        end
    end
endmodule
