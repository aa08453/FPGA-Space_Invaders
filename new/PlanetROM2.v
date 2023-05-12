`timescale 1ns / 1ps

module PlanetROM2(
    input wire [14:0] i_p2addr, // (14:0) or 2^15 or 32768, need 130 x 132 = 17160
    input wire i_clk2,
    output reg [7:0] o_p2data
    );

(*ROM_STYLE="block"*) reg [7:0] p2memory_array [0:17160];
initial begin
    $readmemh("planet02.mem", p2memory_array);//mem file of rocket
end

always @ (posedge i_clk2)
    o_p2data <= p2memory_array[i_p2addr];

    
endmodule