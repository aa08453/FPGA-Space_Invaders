`timescale 1ns / 1ps

module RealStartScreenRom(
    input wire [15:0] i_realstartaddr,  // (15:0) or 2^16 or 65536, need 300 x 161 = 48300
    input wire i_clk2,
    output reg [7:0] o_realstartdata
    );

(*ROM_STYLE="block"*) reg [7:0] realstartmemory_array [0:48300];
initial begin
    $readmemh("StartScreen.mem", realstartmemory_array);//mem file of rocket
end

always @ (posedge i_clk2)
    o_realstartdata <= realstartmemory_array[i_realstartaddr];

    
endmodule