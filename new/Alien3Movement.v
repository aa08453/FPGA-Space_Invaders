`timescale 1ns / 1ps

module Alien3Movement(
    input wire [9:0]xx,
    input wire [9:0]yy,
    input wire aactive,
    input wire Pclk,
    input wire [1:0]X_off,
    input wire [1:0]Y_off,
    output reg A3SpriteOn,
    output wire [7:0] A3dataout
    );
    
    reg [9:0] A3address; // 2^10 or 1024, need 31 x 26 = 806
 Alien3Rom Alien3VRom (.i_A3addr(A3address),.i_clk2(Pclk),.o_A3data(A3dataout));
    
    reg [9:0] A3X = 135; // Alien3 X start position
    reg [9:0] A3Y = 180; // Alien3 Y start position
    localparam A3Width = 31; // Alien3 width in pixels
    localparam A3Height = 27;
        
    reg [1:0] Adir3 = 1;
    reg [9:0] delaliens3 = 0;
    
always @ (posedge Pclk)
     begin
        if (xx==639 && yy==479)
         begin
            delaliens3<=delaliens3+1;
            if (delaliens3>1)
                begin
                    delaliens3<=0;
                    if (A3X<=5)
                        Adir3<=1;
                    else if (A3X>=634-31)
                        Adir3<=0;
                    if (Adir3 == 1 && A3X<640-A3Width)
                        begin
                            A3X<=A3X+X_off;
                            A3Y<=A3Y+Y_off;
                        end
                    if (Adir3 == 0 && A3X>1)
                         begin
                             A3X<=A3X+X_off;
                             A3Y<=A3Y+Y_off;
                         end
                end
            end
             if (aactive)
                begin // check if xx,yy are within the confines of the Rocket
             if (xx==A3X-1 && yy==A3Y)
                begin
                A3address <= 0;
                A3SpriteOn <=1;
             end
             if ((xx>A3X-1) && (xx<A3X+A3Width) && (yy>A3Y-1) && (yy<A3Y+A3Height))
                begin
                A3address <= A3address + 1;
                A3SpriteOn <=1;
             end
             else
                A3SpriteOn <=0;
             end
 end
endmodule
