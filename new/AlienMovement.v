`timescale 1ns / 1ps

module Alien1Movement(
    input wire [9:0]xx,
    input wire [9:0]yy,
    input wire aactive,
    input wire Pclk,
    input wire [1:0]X_off,
    input wire [1:0]Y_off,
    output reg A1SpriteOn,
    output wire [7:0] A1dataout
    );
    
    reg [9:0] A1address; // 2^10 or 1024, need 31 x 26 = 806
 Alien1Rom Alien1VRom (.i_A1addr(A1address),.i_clk2(Pclk),.o_A1data(A1dataout));
    
    reg [9:0] A1X = 297;
    reg [9:0] A1Y = 10;
    localparam A1Width = 31; 
    localparam A1Height = 26;
    
    reg [1:0] Adir1 = 1;
    reg [9:0] delaliens1 = 0;
    
always @ (posedge Pclk)
     begin
        if (xx==639 && yy==479)
         begin
            delaliens1<=delaliens1+1;
            if (delaliens1>1)
                begin
                    delaliens1<=0;
                    if (A1X<=5)
                        Adir1<=1;
                    else if (A1X>=634-31)
                        Adir1<=0;
                    if (Adir1 == 1 && A1X<640-A1Width)
                        begin
                            A1X<=A1X+X_off;
                            A1Y<=A1Y+Y_off;
                        end
                    if (Adir1 == 0 && A1X>1)
                         begin
                             A1X<=A1X-X_off;
                             A1Y<=A1Y+Y_off;
                         end
                end
            end
             if (aactive)
                begin // check if xx,yy are within the confines of the Rocket
             if (xx==A1X-1 && yy==A1Y)
                begin
                A1address <= 0;
                A1SpriteOn <=1;
             end
             if ((xx>A1X-1) && (xx<A1X+A1Width) && (yy>A1Y-1) && (yy<A1Y+A1Height))
                begin
                A1address <= A1address + 1;
                A1SpriteOn <=1;
             end
             else
                A1SpriteOn <=0;
             end
 end
endmodule
