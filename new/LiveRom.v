`timescale 1ns / 1ps

module LiveRom(
    input wire [8:0] i_liveaddr, // (8:0) or 2^9 or 512, need 20 x 20 = 400
    input wire i_clk2,
    output reg [7:0] o_livedata // (7:0) 8 bit pixel value from Alien1.mem
 );
 
 (*ROM_STYLE="block"*) reg [7:0] livememory_array [0:400]; 
 initial begin
    $readmemh("Heart.mem", livememory_array);
 end
 
 always @ (posedge i_clk2)
    o_livedata <= livememory_array[i_liveaddr]; 

endmodule
