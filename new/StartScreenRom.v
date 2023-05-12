`timescale 1ns / 1ps

module StartScreenRom(
    input wire [18:0] i_startaddr,
    input wire i_clk2,
    output reg [7:0] o_startdata
    );

(*ROM_STYLE="block"*) reg [7:0] startmemory_array [0:307199];
initial begin
    $readmemh("Alien1.mem", startmemory_array);//mem file of rocket
end

always @ (posedge i_clk2)
    o_startdata <= startmemory_array[i_startaddr];

    
endmodule