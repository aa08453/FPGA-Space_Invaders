`timescale 1ns / 1ps


module BulletSprite(
input wire [9:0] xx, // current x position
    input wire [9:0] yy, // current y position
    input wire aactive, // high during active pixel drawing
    output reg BSpriteOn, // 1=on, 0=off
    output wire [7:0] dataout2, // 8 bit pixel value from Bee.mem
    input wire BR, // right button
    input wire BL, // left button
    input wire Pclk // 25MHz pixel clock
    );

    // instantiate BeeRom code
    reg [9:0] address; // 2^10 or 1024, need 34 x 27 = 918
    RocketRom BulletVRom (.i_addr(address),.i_clk2(Pclk),.o_data(dataout2));
            
    // setup character positions and sizes
    reg [9:0] BulletX = 297; // Bee X start position
    reg [8:0] BulletY = 400; // Bee Y start position
    localparam BulletWidth = 34; // Bee width in pixels
    localparam BulletHeight = 27; // Bee height in pixels
    reg [9:0] constX = 297; // Bee X start position
    reg [8:0] constY = 400 + BulletHeight; // Bee Y start position
  
    always @ (posedge Pclk)
    begin
        if (xx==639 && yy==479)
            begin // check for left or right button pressed
                if (BR == 1 && constX<640-BulletWidth)
                    constX<=constX+1;
                if (BL == 1 && constX>1)
                    constX<=constX-1;
            end
            
        if (aactive)
            begin // check if xx,yy are within the confines of the Bee character
                if (xx==BulletX-1 && yy==BulletY)
                    begin
                        address <= 0;
                        BSpriteOn <=1;
                    end
                if ((xx>BulletX-1) && (xx<BulletX+BulletWidth) && (yy>BulletY-1) && (yy<BulletY+BulletHeight))
                    begin
                        address <= address + 1;
                        BSpriteOn <=1;
                    end
                else
                    BSpriteOn <=0;
            end
    end
    
    
reg [9:0] delaliens;
 always @ (posedge Pclk)
    begin
        // slow down the alien movement / move aliens left or right
        if (xx==639 && yy==479)
            begin
            if (BulletY < 10)
            begin
            BulletY <= constY;
            BulletX <= constX;
            end
            else
              begin
                delaliens<=delaliens+1;
                if (delaliens>1)
                    begin
                        delaliens<=0;
                                BulletY<=BulletY-5;
                    end
                   end
                  end
              end

endmodule