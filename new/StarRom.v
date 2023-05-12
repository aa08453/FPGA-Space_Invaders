`timescale 1ns / 1ps

module StarRom(
    input wire [11:0] i_saddr, // (11:0) or 2^12 or 4096, need 50 x 47 = 2350
    input wire i_clk2,
    output reg [7:0] o_sdata
    );

(*ROM_STYLE="block"*) reg [7:0] smemory_array [0:2350];
initial begin
    $readmemh("star.mem", smemory_array);//mem file of rocket
end

always @ (posedge i_clk2)
    o_sdata <= smemory_array[i_saddr];

    
endmodule