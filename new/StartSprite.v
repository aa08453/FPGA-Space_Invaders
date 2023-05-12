`timescale 1ns / 1ps

module StartSprite(
    input wire [9:0] xx, // current x position
    input wire [9:0] yy, // current y position
    input wire aactive, // high during active pixel drawing
    output reg StartSpriteOn, // 1=on, 0=off (Start)
    output reg RealStartSpriteOn, // 1=on, 0=off (Start)
    output wire [7:0] startout, // 8 bit pixel value from Rocket.mem
    output wire [7:0] realstartout, // 8 bit pixel value from Rocket.mem  
    input wire Pclk, // 25MHz pixel clock
    input wire start
    );
    
//    reg [18:0] startaddress; // 2^10 or 1024, need 34 x 27 = 918
//    StartScreen_ROM StartVRom (.i_addr(startaddress),.i_clk2(PixCLK),.o_data(startout));

    reg [18:0] startaddress; // 2^10 or 1024, need 34 x 27 = 918
    StartScreenRom StartVRom (.i_startaddr(startaddress),.i_clk2(Pclk),.o_startdata(startout));
    
    reg [9:0] startX = 0; // Rocket X start position
    reg [8:0] startY = 0; // Rocket Y start position
    localparam startWidth = 640; // Rocket width in pixels
    localparam startHeight = 480; // Rocket height in pixels
//    reg StartSpriteOn = 0;

    reg [15:0] realstartaddress; // 2^10 or 1024, need 34 x 27 = 918
    RealStartScreenRom RealStartVRom (.i_realstartaddr(realstartaddress),.i_clk2(Pclk),.o_realstartdata(realstartout));
    
    reg [9:0] realstartX = 170; // Rocket X start position
    reg [8:0] realstartY = 140; // Rocket Y start position
    localparam realstartWidth = 300; // Rocket width in pixels
    localparam realstartHeight = 161; // Rocket height in pixels
    
    always @ (posedge Pclk)
    begin
    // check if rocket is being drawn
     if (aactive)
        begin // check if xx,yy are within the confines of the Rocket
     if (xx==startX-1 && yy==startY && start==1)
        begin
        startaddress <= 0;
        StartSpriteOn <=1;
     end
     if ((xx>startX-1) && (xx<startX+startWidth) && (yy>startY-1) && (yy<startY+startHeight) && (start==1))
        begin
        startaddress <= startaddress + 1;
        StartSpriteOn <=1;
     end
     else
        StartSpriteOn <=0;
     end    
    
    if (aactive)
        begin // check if xx,yy are within the confines of the Rocket
     if (xx==realstartX-1 && yy==realstartY && start==1)
        begin
        realstartaddress <= 0;
        RealStartSpriteOn <=1;
     end
     if ((xx>realstartX-1) && (xx<realstartX+realstartWidth) && (yy>realstartY-1) && (yy<realstartY+realstartHeight) && (start==1))
        begin
        realstartaddress <= realstartaddress + 1;
        RealStartSpriteOn <=1;
     end
     else
        RealStartSpriteOn <=0;
     end
    
 end

endmodule
