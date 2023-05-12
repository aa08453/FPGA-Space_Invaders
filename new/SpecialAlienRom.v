`timescale 1ns / 1ps

module SpecialAlienRom(
    input wire [9:0] i_SAaddr, // (9:0) or 2^10 or 1024, need 31 x 27 = 837
    input wire i_clk2,
    output reg [7:0] o_SAdata // (7:0) 8 bit pixel value from Alien3.mem
    );

    (*ROM_STYLE="block"*) reg [7:0] SAmemory_array [0:837]; // 8 bit values for 837 pixels of Alien3 (31 x 27)

    initial begin
            $readmemh("alien03special.mem", SAmemory_array);
    end

    always @ (posedge i_clk2)
            o_SAdata <= SAmemory_array[i_SAaddr];     
endmodule
