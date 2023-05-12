`timescale 1ns / 1ps

module EndSprite(
    input wire [9:0] xx, // current x position
    input wire [9:0] yy, // current y position
    input wire aactive, // high during active pixel drawing
    input wire gameend,
    output reg StartSpriteOn2, // 1=on, 0=off (Start)
    output reg RealEndSpriteOn, // 1=on, 0=off (Start)
    output wire [7:0] startout2, // 8 bit pixel value from Rocket.mem
    output wire [7:0] realendout, // 8 bit pixel value from Rocket.mem  
    input wire Pclk, // 25MHz pixel clock
    input wire start
    );

    reg [18:0] startaddress2; // 2^10 or 1024, need 34 x 27 = 918
    StartScreenRom StartV2Rom (.i_startaddr(startaddress2),.i_clk2(Pclk),.o_startdata(startout2));
    
    reg [9:0] startX = 0; // Rocket X start position
    reg [8:0] startY = 0; // Rocket Y start position
    localparam startWidth = 640; // Rocket width in pixels
    localparam startHeight = 480; // Rocket height in pixels
//    reg StartSpriteOn = 0;

    
 reg [16:0] realendaddress; // 2^10 or 1024, need 34 x 27 = 918
 RealEndScreenRom RealEndVRom (.i_realendaddr(realendaddress),.i_clk2(Pclk),.o_realenddata(realendout));
 
 reg [9:0] realendX = 170; // Rocket X start position
 reg [8:0] realendY = 92; // Rocket Y start position
 localparam realendWidth = 300; // Rocket width in pixels
 localparam realendHeight = 265; // Rocket height in pixels
    
    always @ (posedge Pclk)
    begin
    // check if rocket is being drawn
     if (aactive)
        begin // check if xx,yy are within the confines of the Rocket
     if (xx==startX-1 && yy==startY && gameend==1 && start==0)
        begin
        startaddress2 <= 0;
        StartSpriteOn2 <=1;
     end
     if ((xx>startX-1) && (xx<startX+startWidth) && (yy>startY-1) && (yy<startY+startHeight) && (gameend==1) && (start==0))
        begin
        startaddress2 <= startaddress2 + 1;
        StartSpriteOn2 <=1;
     end
     else
        StartSpriteOn2 <=0;
     end    
    
    if (aactive)
        begin // check if xx,yy are within the confines of the Rocket
     if (xx==realendX-1 && yy==realendY && gameend==1 && start==0)
        begin
        realendaddress <= 0;
        RealEndSpriteOn <=1;
     end
     if ((xx>realendX-1) && (xx<realendX+realendWidth) && (yy>realendY-1) && (yy<realendY+realendHeight) && (gameend==1) && (start==0))
        begin
        realendaddress <= realendaddress + 1;
        RealEndSpriteOn <=1;
     end
     else
        RealEndSpriteOn <=0;
     end
    
 end

endmodule