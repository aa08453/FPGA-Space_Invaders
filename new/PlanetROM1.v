`timescale 1ns / 1ps

module PlanetROM1(
    input wire [13:0] i_p1addr, // (13:0) or 2^14 or 16384, need 130 x 114 = 14820
    input wire i_clk2,
    output reg [7:0] o_p1data
    );

(*ROM_STYLE="block"*) reg [7:0] p1memory_array [0:14820];
initial begin
    $readmemh("planet01.mem", p1memory_array);//mem file of rocket
end

always @ (posedge i_clk2)
    o_p1data <= p1memory_array[i_p1addr];

    
endmodule