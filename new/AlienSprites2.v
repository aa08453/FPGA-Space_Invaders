`timescale 1ns / 1ps
module AlienSprites2(
// Setup AlienSprites Module
 input wire [9:0] xx, // current x position
 input wire [9:0] yy, // current y position
 input wire aactive, // high during active pixel drawing
 input wire BSpriteOn,
 output reg A1SpriteOn, // 1=on, 0=off
// output reg A2SpriteOn, // 1=on, 0=off
// output reg A3SpriteOn, // 1=on, 0=off
 output wire [7:0] A1dataout, // 8 bit pixel value from Alien1.mem
// output wire [7:0] A2dataout, // 8 bit pixel value from Alien2.mem
// output wire [7:0] A3dataout, // 8 bit pixel value from Alien3.mem
 input wire Pclk // 25MHz pixel clock
 );
// instantiate Alien1Rom code
 reg [9:0] A1address; // 2^10 or 1024, need 31 x 26 = 806
 Alien1Rom Alien1VRom (.i_A1addr(A1address),.i_clk2(Pclk),.o_A1data(A1dataout));

// reg [9:0] A2address;
// Alien2Rom Alien2VRom (.i_A2addr(A2address),.i_clk2(Pclk),.o_A2data(A2dataout));
 
// reg [9:0] A3address;
// Alien3Rom Alien3VRom (.i_A3addr(A3address),.i_clk2(Pclk),.o_A3data(A3dataout));

//// instantiate Alien2Rom code
// reg [9:0] A2address; // 2^10 or 1024, need 31 x 21 = 651
// Alien2Rom Alien2VRom (.i_A2addr(A2address),.i_clk2(Pclk),.o_A2data(A2dataout));
//// instantiate Alien3Rom code
// reg [9:0] A3address; // 2^10 or 1024, need 31 x 27 = 837
// Alien3Rom Alien3VRom (.i_A3addr(A3address),.i_clk2(Pclk),.o_A3data(A3dataout));
//// setup character positions and sizes

//For Alien 1
 reg [9:0] A1X = 297; // Alien1 X start position
 reg [9:0] A1Y = 10; // Alien1 Y start position
 localparam A1Width = 31; // Alien1 width in pixels
 localparam A1Height = 26; // Alien1 height in pixels
 
 //For Alien 2
// reg [9:0] A2X = 135; // Alien2 X start position
// reg [9:0] A2Y = 120; // Alien2 Y start position
// localparam A2Width = 31; // Alien2 width in pixels
// localparam A2Height = 21; // Alien2 height in pixels
 
// //For Alien 3
// reg [9:0] A3X = 135; // Alien3 X start position
// reg [9:0] A3Y = 180; // Alien3 Y start position
// localparam A3Width = 31; // Alien3 width in pixels
// localparam A3Height = 27; // Alien3 height in pixels
 
 
// reg [9:0] AoX = 0; // Offset for X Position of next Alien in row
// reg [9:0] AoY = 0; // Offset for Y Position of next row of Aliens
//reg [9:0] AcounterW = 0; // Counter to check if Alien width reached
//reg [9:0] AcounterH = 0; // Counter to check if Alien height reached
// reg [3:0] AcolCount = 11; // Number of horizontal aliens in all columns
 
 
// reg [1:0] Adir1 = 1; // direction of aliens: 0=right, 1=left
// reg [1:0] Adir2 = 1; // direction of aliens: 0=right, 1=left
// reg [1:0] Adir3 = 1; 
// reg [9:0] delaliens1=0; // counter to slow alien movement
// reg [9:0] delaliens2=0; // counter to slow alien movement
// reg [9:0] delaliens3=0;
 
                
reg [9:0] delaliens;
 always @ (posedge Pclk)
    begin
        // slow down the alien movement / move aliens left or right
        if (xx==639 && yy==479)
            begin
            if (BSpriteOn == A1SpriteOn)
                A1Y<=479;
            else
                delaliens<=delaliens+1;
                if (delaliens>1)
                    begin
                        delaliens<=0;
//                        if (Adir==1)
//                            begin
                                A1Y<=A1Y+5;
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
//always @ (posedge Pclk)
//     begin
//        if (xx==639 && yy==479)
//         begin
//            delaliens1<=delaliens1+1;
//            if (delaliens1>1)
//                begin
//                    delaliens1<=0;
//                    if (A1X<=5)
//                        Adir1<=1;
//                    else if (A1X>=634-31)
//                        Adir1<=0;
//                    if (Adir1 == 1 && A1X<640-A1Width)
//                        begin
//                            A1X<=A1X+4;
//                            A1Y<=A1Y+1;
//                        end
//                    if (Adir1 == 0 && A1X>1)
//                         begin
//                             A1X<=A1X-4;
//                             A1Y<=A1Y+1;
//                         end
//                end
//            end
// end

//always @ (posedge Pclk)
//     begin
//        if (xx==639 && yy==479)
//         begin
//            delaliens2<=delaliens2+1;
//            if (delaliens2>1)
//                begin
//                    delaliens2<=0;
//                    if (A2X<=5)
//                        Adir2<=1;
//                    else if (A2X>=634-31)
//                        Adir2<=0;
//                    if (Adir2 == 1 && A2X<640-A1Width)
//                        begin
//                            A2X<=A2X+1;
//                            A2Y<=A2Y+4;
//                        end
//                    if (Adir2 == 0 && A2X>1)
//                         begin
//                             A2X<=A2X+1;
//                             A2Y<=A2Y+4;
//                         end
//                end
//            end
//             if (aactive)
//                begin // check if xx,yy are within the confines of the Rocket
//             if (xx==A2X-1 && yy==A2Y)
//                begin
//                A2address <= 0;
//                A2SpriteOn <=1;
//             end
//             if ((xx>A2X-1) && (xx<A2X+A2Width) && (yy>A2Y-1) && (yy<A2Y+A2Height))
//                begin
//                A2address <= A2address + 1;
//                A2SpriteOn <=1;
//             end
//             else
//                A2SpriteOn <=0;
//             end
// end
 
//always @ (posedge Pclk)
//     begin
//        if (xx==639 && yy==479)
//         begin
//            delaliens3<=delaliens3+1;
//            if (delaliens3>1)
//                begin
//                    delaliens3<=0;
//                    if (A3X<=5)
//                        Adir3<=1;
//                    else if (A3X>=634-31)
//                        Adir3<=0;
//                    if (Adir3 == 1 && A3X<640-A3Width)
//                        begin
//                            A3X<=A3X+1;
//                            A3Y<=A3Y+4;
//                        end
//                    if (Adir3 == 0 && A3X>1)
//                         begin
//                             A3X<=A3X+1;
//                             A3Y<=A3Y+4;
//                         end
//                end
//            end
//             if (aactive)
//                begin // check if xx,yy are within the confines of the Rocket
//             if (xx==A3X-1 && yy==A3Y)
//                begin
//                A3address <= 0;
//                A3SpriteOn <=1;
//             end
//             if ((xx>A3X-1) && (xx<A3X+A3Width) && (yy>A3Y-1) && (yy<A3Y+A3Height))
//                begin
//                A3address <= A3address + 1;
//                A3SpriteOn <=1;
//             end
//             else
//                A3SpriteOn <=0;
//             end
// end

endmodule
