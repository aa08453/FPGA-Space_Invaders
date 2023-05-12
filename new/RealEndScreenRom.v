`timescale 1ns / 1ps

module RealEndScreenRom(
    input wire [16:0] i_realendaddr,  // (16:0) or 2^17 or 131072, need 300 x 265 = 79500
    input wire i_clk2,
    output reg [7:0] o_realenddata
    );

(*ROM_STYLE="block"*) reg [7:0] realendmemory_array [0:79500];
initial begin
    $readmemh("GameOver.mem", realendmemory_array);//mem file of rocket
end

always @ (posedge i_clk2)
    o_realenddata <= realendmemory_array[i_realendaddr];
    
endmodule