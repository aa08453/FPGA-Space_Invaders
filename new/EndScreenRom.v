`timescale 1ns / 1ps

module EndScreenRom(
    input wire [18:0] i_endaddr,
    input wire i_clk2,
    output reg [7:0] o_enddata
    );

(*ROM_STYLE="block"*) reg [7:0] endmemory_array [0:307200];
initial begin
    $readmemh("Alien1.mem", endmemory_array);//mem file of rocket
end

always @ (posedge i_clk2)
    o_enddata <= endmemory_array[i_endaddr];
    
endmodule
