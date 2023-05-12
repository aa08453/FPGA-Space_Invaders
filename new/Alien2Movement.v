`timescale 1ns / 1ps

module Alien2Movement(
    input wire [9:0]xx,
    input wire [9:0]yy,
    input wire aactive,
    input wire Pclk,
    input wire [1:0]X_off,
    input wire [1:0]Y_off,
    output reg A2SpriteOn,
    output wire [7:0] A2dataout
    );
    
    reg [9:0] A2address; // 2^10 or 1024, need 31 x 26 = 806
 Alien2Rom Alien2VRom (.i_A2addr(A2address),.i_clk2(Pclk),.o_A2data(A2dataout));
    
    reg [9:0] A2X = 135; // Alien2 X start position
    reg [9:0] A2Y = 120; // Alien2 Y start position
    localparam A2Width = 31; // Alien2 width in pixels
    localparam A2Height = 21;
        
    reg [1:0] Adir2 = 1;
    reg [9:0] delaliens2 = 0;
    
always @ (posedge Pclk)
     begin
        if (xx==639 && yy==479)
         begin
            delaliens2<=delaliens2+1;
            if (delaliens2>1)
                begin
                    delaliens2<=0;
                    if (A2X<=5)
                        Adir2<=1;
                    else if (A2X>=634-31)
                        Adir2<=0;
                    if (Adir2 == 1 && A2X<640-A2Width)
                        begin
                            A2X<=A2X+X_off;
                            A2Y<=A2Y+Y_off;
                        end
                    if (Adir2 == 0 && A2X>1)
                         begin
                             A2X<=A2X+X_off;
                             A2Y<=A2Y+Y_off;
                         end
                end
            end
             if (aactive)
                begin // check if xx,yy are within the confines of the Rocket
             if (xx==A2X-1 && yy==A2Y)
                begin
                A2address <= 0;
                A2SpriteOn <=1;
             end
             if ((xx>A2X-1) && (xx<A2X+A2Width) && (yy>A2Y-1) && (yy<A2Y+A2Height))
                begin
                A2address <= A2address + 1;
                A2SpriteOn <=1;
             end
             else
                A2SpriteOn <=0;
             end
 end
endmodule
