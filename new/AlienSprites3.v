`timescale 1ns / 1ps
// Setup AlienSprites Module
 module AlienSprites(
 input wire [9:0] xx, // current x position
 input wire [9:0] yy, // current y position
 input wire aactive, // high during active pixel drawing
 output reg A1SpriteOn, // 1=on, 0=off
 output reg A2SpriteOn, // 1=on, 0=off
 output reg A3SpriteOn, // 1=on, 0=off
 output wire [7:0] A1dataout, // 8 bit pixel value from Alien1.mem
 output wire [7:0] A2dataout, // 8 bit pixel value from Alien2.mem
// output wire [7:0] A3dataout, // 8 bit pixel value from Alien3.mem
 input wire Pclk // 25MHz pixel clock
 );


endmodule
