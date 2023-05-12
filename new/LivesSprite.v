`timescale 1ns / 1ps

module LivesSprite(
 input wire [9:0] xx, // current x position
 input wire [9:0] yy, // current y position
 input wire aactive, // high during active pixel drawing
 output reg L1SpriteOn, // 1=on, 0=off (Rocket)
 output reg L2SpriteOn, // 1=on, 0=off (Rocket)
 output reg L3SpriteOn, // 1=on, 0=off (Rocket)
 output wire [7:0] L1dataout, // 8 bit pixel value from Rocket.mem
 output wire [7:0] L2dataout,
 output wire [7:0] L3dataout,
 input wire Pclk, // 25MHz pixel clock
 input wire start,
 input wire [9:0] lives
 );
 // instantiate RocketRom code
 reg [9:0] L1address; // 2^10 or 1024, need 34 x 27 = 918
 reg [9:0] L2address; // 2^10 or 1024, need 34 x 27 = 918
 reg [9:0] L3address; // 2^10 or 1024, need 34 x 27 = 918
 LiveRom Live1VRom (.i_liveaddr(L1address),.i_clk2(Pclk),.o_livedata(L1dataout));
 LiveRom Live2VRom (.i_liveaddr(L2address),.i_clk2(Pclk),.o_livedata(L2dataout));
 LiveRom Live3VRom (.i_liveaddr(L3address),.i_clk2(Pclk),.o_livedata(L3dataout));
 
 // setup character positions and sizes
 reg [9:0] L1X = 519; // Rocket X start position
 reg [8:0] L1Y = 10; // Rocket Y start position
 reg [9:0] L2X = 559; // Rocket X start position
 reg [8:0] L2Y = 10; // Rocket Y start position
 reg [9:0] L3X = 599; // Rocket X start position
 reg [8:0] L3Y = 10; // Rocket Y start position
 localparam LiveWidth = 31; // Rocket width in pixels
 localparam LiveHeight = 26; // Rocket height in pixels
 
 //BulletSprite Bullet1 (.xx(xx), .yy(yy), .aactive(aactive), .BSpriteOn(BSpriteOn), .dataout2(dataout2), .BR(BR), .BL(BL), .Pclk(Pclk));
     always @ (posedge Pclk)
     begin
     
     if (start==0 && lives==4)
     begin
    
        // check if rocket is being drawn
         if (aactive)
            begin // check if xx,yy are within the confines of the Rocket
         if (xx==L1X-1 && yy==L1Y)
            begin
            L1address <= 0;
            L1SpriteOn <=1;
         end
         if ((xx>L1X-1) && (xx<L1X+LiveWidth) && (yy>L1Y-1) && (yy<L1Y+LiveHeight))
            begin
            L1address <= L1address + 1;
            L1SpriteOn <=1;
     end
     else
        L1SpriteOn <=0;
     end

 end
end

always @ (posedge Pclk)
 begin
 
 if (start==0 && lives>=3)
 begin

    // check if rocket is being drawn
     if (aactive)
        begin // check if xx,yy are within the confines of the Rocket
     if (xx==L2X-1 && yy==L2Y)
        begin
        L2address <= 0;
        L2SpriteOn <=1;
     end
     if ((xx>L2X-1) && (xx<L2X+LiveWidth) && (yy>L2Y-1) && (yy<L2Y+LiveHeight))
        begin
        L2address <= L2address + 1;
        L2SpriteOn <=1;
     end
     else
        L2SpriteOn <=0;
     end

 end
end

always @ (posedge Pclk)
 begin
 
 if (start==0 && lives>=2)
 begin

    // check if rocket is being drawn
     if (aactive)
        begin // check if xx,yy are within the confines of the Rocket
     if (xx==L3X-1 && yy==L3Y)
        begin
        L3address <= 0;
        L3SpriteOn <=1;
     end
     if ((xx>L3X-1) && (xx<L3X+LiveWidth) && (yy>L3Y-1) && (yy<L3Y+LiveHeight))
        begin
        L3address <= L3address + 1;
        L3SpriteOn <=1;
     end
     else
        L3SpriteOn <=0;
     end

 end
end

endmodule

