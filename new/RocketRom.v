`timescale 1ns / 1ps

module RocketRom(
    input wire [9:0] i_addr,
    input wire i_clk2,
    output reg [7:0] o_data
    );

(*ROM_STYLE="block"*) reg [7:0] memory_array [0:1015];
initial begin
    $readmemh("Rocket_v2.mem", memory_array);//mem file of rocket
end

always @ (posedge i_clk2)
    o_data <= memory_array[i_addr];

    
endmodule