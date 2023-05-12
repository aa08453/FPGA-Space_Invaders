`timescale 1ns / 1ps
// Setup RocketSprite Module
module RocketSprite(
 input wire [9:0] xx, // current x position
 input wire [9:0] yy, // current y position
 input wire aactive, // high during active pixel drawing
 output reg RSpriteOn, // 1=on, 0=off (Rocket)
 output reg P1SpriteOn,
 output reg P2SpriteOn,
 output reg S1SpriteOn,
 output reg S2SpriteOn,
 output reg S3SpriteOn,
 output reg S4SpriteOn,
 output wire [7:0] dataout, // 8 bit pixel value from Rocket.mem
 output wire [7:0] P1dataout,
 output wire [7:0] P2dataout,
 output wire [7:0] S1dataout,
 output wire [7:0] S2dataout,
 output wire [7:0] S3dataout,
 output wire [7:0] S4dataout,  
 input wire BR, // right button
 input wire BL, // left button
 input wire Pclk, // 25MHz pixel clock
 input wire start,
 input wire reset
 );
 // instantiate RocketRom code
 reg [9:0] address; // 2^10 or 1024, need 34 x 27 = 918
 RocketRom RocketVRom (.i_addr(address),.i_clk2(Pclk),.o_data(dataout));
 
 reg [13:0] p1address;
 PlanetROM1 Planet1VRom (.i_p1addr(p1address),.i_clk2(Pclk),.o_p1data(P1dataout));
 
 reg [14:0] p2address;
 PlanetROM2 Planet2VRom (.i_p2addr(p2address),.i_clk2(Pclk),.o_p2data(P2dataout));
 
 reg [11:0] s1address;
 StarRom StarV1Rom (.i_saddr(s1address),.i_clk2(Pclk),.o_sdata(S1dataout));
 
 reg [11:0] s2address;
 StarRom StarV2Rom (.i_saddr(s2address),.i_clk2(Pclk),.o_sdata(S2dataout));
 
 reg [11:0] s3address;
 StarRom StarV3Rom (.i_saddr(s3address),.i_clk2(Pclk),.o_sdata(S3dataout));
 
 reg [11:0] s4address;
 StarRom StarV4Rom (.i_saddr(s4address),.i_clk2(Pclk),.o_sdata(S4dataout));
 
 // setup character positions and sizes
 reg [9:0] RocketX = 297; // Rocket X start position
 reg [8:0] RocketY = 455; // Rocket Y start position
 localparam RocketWidth = 35; // Rocket width in pixels
 localparam RocketHeight = 29; // Rocket height in pixels
 
 
 reg [9:0] Planet1X = 120; // Rocket X start position
 reg [8:0] Planet1Y = 150; // Rocket Y start position
 localparam Planet1Width = 130; // Rocket width in pixels
 localparam Planet1Height = 114; // Rocket height in pixels
 
 reg [9:0] Planet2X = 450; // Rocket X start position
 reg [8:0] Planet2Y = 320; // Rocket Y start position
 localparam Planet2Width = 130; // Rocket width in pixels
 localparam Planet2Height = 132; // Rocket height in pixels
 
 reg [9:0] Star1X = 400; // Rocket X start position
 reg [8:0] Star1Y = 250; // Rocket Y start position
 
 reg [9:0] Star2X = 80; // Rocket X start position
 reg [8:0] Star2Y = 370; // Rocket Y start position
 
 reg [9:0] Star3X = 255; // Rocket X start position
 reg [8:0] Star3Y = 120; // Rocket Y start position
 
 reg [9:0] Star4X = 569; // Rocket X start position
 reg [8:0] Star4Y = 60; // Rocket Y start position
 
 localparam StarWidth = 50; // Rocket width in pixels
 localparam StarHeight = 47; // Rocket height in pixels
 
 //BulletSprite Bullet1 (.xx(xx), .yy(yy), .aactive(aactive), .BSpriteOn(BSpriteOn), .dataout2(dataout2), .BR(BR), .BL(BL), .Pclk(Pclk));
 always @ (posedge Pclk)
 begin
 
 if (reset)
 begin
 RocketX <= 297;
 RocketY <= 455;
 end
 
 if (start==0)
 begin
        if (xx==639 && yy==479)
     begin // check for left or right button pressed
        if (BR == 1 && RocketX<640-RocketWidth-3)
            RocketX<=RocketX+3;
        if (BL == 1 && RocketX>5)
            RocketX<=RocketX-3;
     end 
    
    // check if rocket is being drawn
     if (aactive)
        begin // check if xx,yy are within the confines of the Rocket
     if (xx==RocketX-1 && yy==RocketY)
        begin
        address <= 0;
        RSpriteOn <=1;
     end
     if ((xx>RocketX-1) && (xx<RocketX+RocketWidth) && (yy>RocketY-1) && (yy<RocketY+RocketHeight))
        begin
        address <= address + 1;
        RSpriteOn <=1;
     end
     else
        RSpriteOn <=0;
     end
     
     if (aactive)
        begin // check if xx,yy are within the confines of the Rocket
     if (xx==Planet1X-1 && yy==Planet1Y)
        begin
        p1address <= 0;
        P1SpriteOn <=1;
     end
     if ((xx>Planet1X-1) && (xx<Planet1X+Planet1Width) && (yy>Planet1Y-1) && (yy<Planet1Y+Planet1Height))
        begin
        p1address <= p1address + 1;
        P1SpriteOn <=1;
     end
     else
        P1SpriteOn <=0;
     end
     
     if (aactive)
        begin // check if xx,yy are within the confines of the Rocket
     if (xx==Planet2X-1 && yy==Planet2Y)
        begin
        p2address <= 0;
        P2SpriteOn <=1;
     end
     if ((xx>Planet2X-1) && (xx<Planet2X+Planet2Width) && (yy>Planet2Y-1) && (yy<Planet2Y+Planet2Height))
        begin
        p2address <= p2address + 1;
        P2SpriteOn <=1;
     end
     else
        P2SpriteOn <=0;
     end
     
     if (aactive)
        begin // check if xx,yy are within the confines of the Rocket
     if (xx==Star1X-1 && yy==Star1Y)
        begin
        s1address <= 0;
        S1SpriteOn <=1;
     end
     if ((xx>Star1X-1) && (xx<Star1X+StarWidth) && (yy>Star1Y-1) && (yy<Star1Y+StarHeight))
        begin
        s1address <= s1address + 1;
        S1SpriteOn <=1;
     end
     else
        S1SpriteOn <=0;
     end
     
     
     if (aactive)
        begin // check if xx,yy are within the confines of the Rocket
     if (xx==Star2X-1 && yy==Star2Y)
        begin
        s2address <= 0;
        S2SpriteOn <=1;
     end
     if ((xx>Star2X-1) && (xx<Star2X+StarWidth) && (yy>Star2Y-1) && (yy<Star2Y+StarHeight))
        begin
        s2address <= s2address + 1;
        S2SpriteOn <=1;
     end
     else
        S2SpriteOn <=0;
     end
    
    if (aactive)
        begin // check if xx,yy are within the confines of the Rocket
     if (xx==Star3X-1 && yy==Star3Y)
        begin
        s3address <= 0;
        S3SpriteOn <=1;
     end
     if ((xx>Star3X-1) && (xx<Star3X+StarWidth) && (yy>Star3Y-1) && (yy<Star3Y+StarHeight))
        begin
        s3address <= s3address + 1;
        S3SpriteOn <=1;
     end
     else
        S3SpriteOn <=0;
     end
    
    if (aactive)
        begin // check if xx,yy are within the confines of the Rocket
     if (xx==Star4X-1 && yy==Star4Y)
        begin
        s4address <= 0;
        S4SpriteOn <=1;
     end
     if ((xx>Star4X-1) && (xx<Star4X+StarWidth) && (yy>Star4Y-1) && (yy<Star4Y+StarHeight))
        begin
        s4address <= s4address + 1;
        S4SpriteOn <=1;
     end
     else
        S4SpriteOn <=0;
     end
    
 end
 end
endmodule
