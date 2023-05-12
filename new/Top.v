`timescale 1ns / 1ps

module Top(
 input wire CLK, 
 input wire RESET, 
 output wire HSYNC, 
 output wire VSYNC, 
 output reg [3:0] RED, 
 output reg [3:0] GREEN, 
 output reg [3:0] BLUE,
 input btnR,
 input btnL,
 input wire START
 );
 
 wire rst = RESET;

 wire [9:0] x; 
 wire [9:0] y; 
 wire active; 
 wire PixCLK;
 vga640x480 display (.i_clk(CLK),.i_rst(rst),.o_hsync(HSYNC), 
 .o_vsync(VSYNC),.o_x(x),.o_y(y),.o_active(active),
 .pix_clk(PixCLK));
 
wire StartSpriteOn;
wire RealSpriteOn;
wire [7:0] startout;
wire [7:0] realstartout;
StartSprite StartDisplay (.xx(x),.yy(y),.aactive(active),
 .StartSpriteOn(StartSpriteOn),.RealStartSpriteOn(RealStartSpriteOn),
 .startout(startout),.realstartout(realstartout),.Pclk(PixCLK),.start(START));

 wire RocketSpriteOn;
 wire Planet1SpriteOn;
 wire Planet2SpriteOn;
 wire Star1SpriteOn;
 wire Star2SpriteOn;
 wire Star3SpriteOn;
 wire Star4SpriteOn;
 wire [7:0] dout; // pixel value from Rocket.mem
 wire [7:0] P1out;
 wire [7:0] P2out;
 wire [7:0] S1out;
 wire [7:0] S2out;
 wire [7:0] S3out;
 wire [7:0] S4out;
 RocketSprite RocketDisplay (.xx(x),.yy(y),.aactive(active),
 .RSpriteOn(RocketSpriteOn),.P1SpriteOn(Planet1SpriteOn),.P2SpriteOn(Planet2SpriteOn),
 .S1SpriteOn(Star1SpriteOn),.S2SpriteOn(Star2SpriteOn),.S3SpriteOn(Star3SpriteOn),.S4SpriteOn(Star4SpriteOn),
 .dataout(dout),.P1dataout(P1out),.P2dataout(P2out),
 .S1dataout(S1out),.S2dataout(S2out),.S3dataout(S3out),.S4dataout(S4out),
 .BR(btnR),.BL(btnL),.Pclk(PixCLK),.start(START),.reset(rst));
 
 
 wire BulletSpriteOn;
 wire BulletSpriteOn2;
 wire [7:0] Bdout;
 wire [7:0] Bdout2;
 bulletSprite Bullet(.xx(x),.yy(y),.aactive(active),
 .BSpriteOn(BulletSpriteOn),.BSpriteOn2(BulletSpriteOn2),
 .dataout(Bdout),.dataout2(Bdout2),
 .BR(btnR),.BL(btnL),.Pclk(PixCLK),.start(START),.reset(rst));

 wire Alien1SpriteOn;
 wire Alien2SpriteOn;
 wire Alien3SpriteOn; 
 wire Alien4SpriteOn;
// wire Alien5SpriteOn;
// wire Alien6SpriteOn;
// wire Alien7SpriteOn;
// wire Alien8SpriteOn;
 wire [7:0] A1dout; // pixel value from Alien1.mem
 wire [7:0] A2dout; // pixel value from Alien2.mem
 wire [7:0] A3dout;
 wire [7:0] A4dout;
// wire [7:0] A5dout;
// wire [7:0] A6dout;
// wire [7:0] A7dout;
// wire [7:0] A8dout;
 wire L1SpriteOn;
 wire L2SpriteOn;
 wire L3SpriteOn;
 wire [7:0] L1dataout;
 wire [7:0] L2dataout;
 wire [7:0] L3dataout;
 wire S10SpriteOn;
 wire S11SpriteOn;
 wire S12SpriteOn;
 wire S13SpriteOn;
 wire S14SpriteOn;
 wire S15SpriteOn;
 wire S16SpriteOn;
 wire S17SpriteOn;
 wire S18SpriteOn;
 wire S19SpriteOn;
 wire S20SpriteOn;
 wire S21SpriteOn;
 wire S22SpriteOn;
 wire S23SpriteOn;
 wire S24SpriteOn;
 wire S25SpriteOn;
 wire S26SpriteOn;
 wire S27SpriteOn;
 wire S28SpriteOn;
 wire S29SpriteOn;
 wire HS10SpriteOn;
 wire HS11SpriteOn;
 wire HS12SpriteOn;
 wire HS13SpriteOn;
 wire HS14SpriteOn;
 wire HS15SpriteOn;
 wire HS16SpriteOn;
 wire HS17SpriteOn;
 wire HS18SpriteOn;
 wire HS19SpriteOn;
 wire HS20SpriteOn;
 wire HS21SpriteOn;
 wire HS22SpriteOn;
 wire HS23SpriteOn;
 wire HS24SpriteOn;
 wire HS25SpriteOn;
 wire HS26SpriteOn;
 wire HS27SpriteOn;
 wire HS28SpriteOn;
// wire HS29SpriteOn;
 wire gameend;
 wire [7:0] S10dataout;
 wire [7:0] S11dataout;
 wire [7:0] S12dataout;
 wire [7:0] S13dataout;
 wire [7:0] S14dataout;
 wire [7:0] S15dataout;
 wire [7:0] S16dataout;
 wire [7:0] S17dataout;
 wire [7:0] S18dataout;
 wire [7:0] S19dataout;
 wire [7:0] S20dataout;
 wire [7:0] S21dataout;
 wire [7:0] S22dataout;
 wire [7:0] S23dataout;
 wire [7:0] S24dataout;
 wire [7:0] S25dataout;
 wire [7:0] S26dataout;
 wire [7:0] S27dataout;
 wire [7:0] S28dataout;
 wire [7:0] S29dataout;
 wire [7:0] HS10dataout;
 wire [7:0] HS11dataout;
 wire [7:0] HS12dataout;
 wire [7:0] HS13dataout;
 wire [7:0] HS14dataout;
 wire [7:0] HS15dataout;
 wire [7:0] HS16dataout;
 wire [7:0] HS17dataout;
 wire [7:0] HS18dataout;
 wire [7:0] HS19dataout;
 wire [7:0] HS20dataout;
 wire [7:0] HS21dataout;
 wire [7:0] HS22dataout;
 wire [7:0] HS23dataout;
 wire [7:0] HS24dataout;
 wire [7:0] HS25dataout;
 wire [7:0] HS26dataout;
 wire [7:0] HS27dataout;
 wire [7:0] HS28dataout;
// wire [7:0] HS29dataout;
 AlienSprites_2 ADisplay (.xx(x),.yy(y),.aactive(active),.BulletSpriteOn(BulletSpriteOn),.BulletSpriteOn2(BulletSpriteOn2),
 .A1SpriteOn(Alien1SpriteOn), .A2SpriteOn(Alien2SpriteOn), .A3SpriteOn(Alien3SpriteOn),.A4SpriteOn(Alien4SpriteOn),
 //.A5SpriteOn(Alien5SpriteOn),.A6SpriteOn(Alien6SpriteOn),.A7SpriteOn(Alien7SpriteOn),.A8SpriteOn(Alien8SpriteOn),
 .A1dataout(A1dout),.A2dataout(A2dout),.A3dataout(A3dout),.A4dataout(A4dout),
 //.A5dataout(A5dout),.A6dataout(A6dout),.A7dataout(A7dout),.A8dataout(A8dout),
 .L1SpriteOn(L1SpriteOn),
 .L2SpriteOn(L2SpriteOn),
 .L3SpriteOn(L3SpriteOn),
 .L1dataout(L1dataout),.L2dataout(L2dataout),.L3dataout(L3dataout),
 
 .S10SpriteOn(S10SpriteOn),.S11SpriteOn(S11SpriteOn),.S12SpriteOn(S12SpriteOn),
 .S13SpriteOn(S13SpriteOn),.S14SpriteOn(S14SpriteOn),.S15SpriteOn(S15SpriteOn),
 .S16SpriteOn(S16SpriteOn),.S17SpriteOn(S17SpriteOn),.S18SpriteOn(S18SpriteOn),.S19SpriteOn(S19SpriteOn),
 .S20SpriteOn(S20SpriteOn),.S21SpriteOn(S21SpriteOn),.S22SpriteOn(S22SpriteOn),
 .S23SpriteOn(S23SpriteOn),.S24SpriteOn(S24SpriteOn),.S25SpriteOn(S25SpriteOn),
 .S26SpriteOn(S26SpriteOn),.S27SpriteOn(S27SpriteOn),.S28SpriteOn(S28SpriteOn),
 .S29SpriteOn(S29SpriteOn),
 
 .HS10SpriteOn(HS10SpriteOn),.HS11SpriteOn(HS11SpriteOn),.HS12SpriteOn(HS12SpriteOn),
 .HS13SpriteOn(HS13SpriteOn),.HS14SpriteOn(HS14SpriteOn),.HS15SpriteOn(HS15SpriteOn),
 .HS16SpriteOn(HS16SpriteOn),.HS17SpriteOn(HS17SpriteOn),.HS18SpriteOn(HS18SpriteOn),.HS19SpriteOn(HS19SpriteOn),
 .HS20SpriteOn(HS20SpriteOn),
 .HS21SpriteOn(HS21SpriteOn),.HS22SpriteOn(HS22SpriteOn),
 .HS23SpriteOn(HS23SpriteOn),
 .HS24SpriteOn(HS24SpriteOn),.HS25SpriteOn(HS25SpriteOn),
 .HS26SpriteOn(HS26SpriteOn),
 .HS27SpriteOn(HS27SpriteOn),
 .HS28SpriteOn(HS28SpriteOn),
// .HS29SpriteOn(HS29SpriteOn),
 
 .S10dataout(S10dataout),.S11dataout(S11dataout),.S12dataout(S12dataout),
 .S13dataout(S13dataout),.S14dataout(S14dataout),.S15dataout(S15dataout),
 .S16dataout(S16dataout),.S17dataout(S17dataout),.S18dataout(S18dataout),.S19dataout(S19dataout),
 .S20dataout(S20dataout),.S21dataout(S21dataout),.S22dataout(S22dataout),
 .S23dataout(S23dataout),.S24dataout(S24dataout),.S25dataout(S25dataout),
 .S26dataout(S26dataout),.S27dataout(S27dataout),.S28dataout(S28dataout),
 .S29dataout(S29dataout),
 
 .HS10dataout(HS10dataout),.HS11dataout(HS11dataout),.HS12dataout(HS12dataout),
 .HS13dataout(HS13dataout),.HS14dataout(HS14dataout),.HS15dataout(HS15dataout),
 .HS16dataout(HS16dataout),.HS17dataout(HS17dataout),.HS18dataout(HS18dataout),.HS19dataout(HS19dataout),
 .HS20dataout(HS20dataout),
 .HS21dataout(HS21dataout),.HS22dataout(HS22dataout),
 .HS23dataout(HS23dataout),
 .HS24dataout(HS24dataout),.HS25dataout(HS25dataout),
 .HS26dataout(HS26dataout),
 .HS27dataout(HS27dataout),
 .HS28dataout(HS28dataout),
// .HS29dataout(S29dataout),
 
 .Pclk(PixCLK),.start(START),.reset(rst),.gameend(gameend));


wire StartSpriteOn2;
wire RealEndSpriteOn;
wire [7:0] startout2;
wire [7:0] realendout;
EndSprite EndDisplay (.xx(x),.yy(y),.aactive(active),.gameend(gameend),
 .StartSpriteOn2(StartSpriteOn2),.RealEndSpriteOn(RealEndSpriteOn),
 .startout2(startout2),.realendout(realendout),.Pclk(PixCLK),.start(start)); 
 
 reg [7:0] palette [0:191];  // 8 bit values from the 192 hex entries in the colour palette
    reg [7:0] COL = 0;          // background colour palette value
    initial begin
        $readmemh("zero_pal.mem", palette); // load 192 hex values into "palette"
    end
    
  reg [7:0] onepalette [0:191];  // 8 bit values from the 192 hex entries in the colour palette
    initial begin
        $readmemh("one_pal.mem", onepalette); // load 192 hex values into "palette"
    end
    
  reg [7:0] twopalette [0:191];  // 8 bit values from the 192 hex entries in the colour palette
    initial begin
        $readmemh("two_pal.mem", twopalette); // load 192 hex values into "palette"
    end
    
  reg [7:0] threepalette [0:191];  // 8 bit values from the 192 hex entries in the colour palette
    initial begin
        $readmemh("three_pal.mem", threepalette); // load 192 hex values into "palette"
    end
    
  reg [7:0] fourpalette [0:191];  // 8 bit values from the 192 hex entries in the colour palette
    initial begin
        $readmemh("four_pal.mem", fourpalette); // load 192 hex values into "palette"
    end
    
  reg [7:0] fivepalette [0:191];  // 8 bit values from the 192 hex entries in the colour palette
    initial begin
        $readmemh("five_pal.mem", fivepalette); // load 192 hex values into "palette"
    end
    
  reg [7:0] sixpalette [0:191];  // 8 bit values from the 192 hex entries in the colour palette
    initial begin
        $readmemh("six_pal.mem", sixpalette); // load 192 hex values into "palette"
    end
    
  reg [7:0] sevenpalette [0:191];  // 8 bit values from the 192 hex entries in the colour palette
    initial begin
        $readmemh("seven_pal.mem", sevenpalette); // load 192 hex values into "palette"
    end
    
  reg [7:0] eightpalette [0:191];  // 8 bit values from the 192 hex entries in the colour palette
    initial begin
        $readmemh("eight_pal.mem", eightpalette); // load 192 hex values into "palette"
    end
    
  reg [7:0] ninepalette [0:191];  // 8 bit values from the 192 hex entries in the colour palette
    initial begin
        $readmemh("nine_pal.mem", ninepalette); // load 192 hex values into "palette"
    end
  
  reg [7:0] livespalette [0:191];  // 8 bit values from the 192 hex entries in the colour palette
    initial begin
        $readmemh("Heart_pal.mem", livespalette); // load 192 hex values into "palette"
    end
    
    reg [7:0] bulletpalette [0:191];  // 8 bit values from the 192 hex entries in the colour palette
    initial begin
        $readmemh("bullet_blackbg_PAL.mem", bulletpalette); // load 192 hex values into "palette"
    end
    
     reg [7:0] realendpalette [0:191];  // 8 bit values from the 192 hex entries in the colour palette
    initial begin
        $readmemh("GameOver_pal.mem", realendpalette); // load 192 hex values into "palette"
    end
    
    reg [7:0] rocketpalette [0:191];  // 8 bit values from the 192 hex entries in the colour palette
    initial begin
        $readmemh("Rocket_v2_Pal.mem", rocketpalette); // load 192 hex values into "palette"
    end
    
    reg [7:0] realstartpalette [0:191];  // 8 bit values from the 192 hex entries in the colour palette
    initial begin
        $readmemh("StartScreen_Pal.mem", realstartpalette); // load 192 hex values into "palette"
    end
    
    reg [7:0] planet1palette [0:191];  // 8 bit values from the 192 hex entries in the colour palette
    initial begin
        $readmemh("planet01_pal.mem", planet1palette); // load 192 hex values into "palette"
    end
    
     reg [7:0] planet2palette [0:191];  // 8 bit values from the 192 hex entries in the colour palette
    initial begin
        $readmemh("planet02_pal.mem", planet2palette); // load 192 hex values into "palette"
    end
    
     reg [7:0] starpalette [0:191];  // 8 bit values from the 192 hex entries in the colour palette
    initial begin
        $readmemh("star_pal.mem", starpalette); // load 192 hex values into "palette"
    end
    
    reg [7:0] alien01palette [0:191];  // 8 bit values from the 192 hex entries in the colour palette
    initial begin
        $readmemh("alien01_pal.mem", alien01palette); // load 192 hex values into "palette"
    end
    
    reg [7:0] alien02palette [0:191];  // 8 bit values from the 192 hex entries in the colour palette
    initial begin
        $readmemh("alien02_pal.mem", alien02palette); // load 192 hex values into "palette"
    end
    
    reg [7:0] alien03palette [0:191];  // 8 bit values from the 192 hex entries in the colour palette
    initial begin
        $readmemh("alien03_pal.mem", alien03palette); // load 192 hex values into "palette"
    end

 always @ (posedge PixCLK)
 begin
 if (active)
 begin
 if (RealEndSpriteOn==1)
 begin
 RED <= (realendpalette[(realendout*3)])>>4; // RED bits(7:4) from colour palette
 GREEN <= (realendpalette[(realendout*3)+1])>>4; // GREEN bits(7:4) from colour palette
 BLUE <= (realendpalette[(realendout*3)+2])>>4; // BLUE bits(7:4) from colour palette
 end
 else
 if (RealStartSpriteOn==1)
 begin
 RED <= (realstartpalette[(realstartout*3)])>>4; // RED bits(7:4) from colour palette
 GREEN <= (realstartpalette[(realstartout*3)+1])>>4; // GREEN bits(7:4) from colour palette
 BLUE <= (realstartpalette[(realstartout*3)+2])>>4; // BLUE bits(7:4) from colour palette
 end
 else
 if (StartSpriteOn==1)
 begin
 RED <= (realstartpalette[(startout*3)])>>4; // RED bits(7:4) from colour palette
 GREEN <= (realstartpalette[(startout*3)+1])>>4; // GREEN bits(7:4) from colour palette
 BLUE <= (realstartpalette[(startout*3)+2])>>4; // BLUE bits(7:4) from colour palette
 end
 else
 if (StartSpriteOn2==1)
 begin
 RED <= (realstartpalette[(startout2*3)])>>4; // RED bits(7:4) from colour palette
 GREEN <= (realstartpalette[(startout2*3)+1])>>4; // GREEN bits(7:4) from colour palette
 BLUE <= (realstartpalette[(startout2*3)+2])>>4; // BLUE bits(7:4) from colour palette
 end
 else
 if (RocketSpriteOn==1)
 begin
 RED <= (rocketpalette[(dout*3)])>>4; // RED bits(7:4) from colour palette
 GREEN <= (rocketpalette[(dout*3)+1])>>4; // GREEN bits(7:4) from colour palette
 BLUE <= (rocketpalette[(dout*3)+2])>>4; // BLUE bits(7:4) from colour palette
 end
 
 else
 if (S10SpriteOn==1)
 begin
 RED <= (palette[(S10dataout*3)])>>4; // RED bits(7:4) from colour palette
 GREEN <= (palette[(S10dataout*3)+1])>>4; // GREEN bits(7:4) from colour palette
 BLUE <= (palette[(S10dataout*3)+2])>>4; // BLUE bits(7:4) from colour palette
 end
 else
 if (S11SpriteOn==1)
 begin
 RED <= (onepalette[(S11dataout*3)])>>4; // RED bits(7:4) from colour palette
 GREEN <= (onepalette[(S11dataout*3)+1])>>4; // GREEN bits(7:4) from colour palette
 BLUE <= (onepalette[(S11dataout*3)+2])>>4; // BLUE bits(7:4) from colour palette
 end
 else
 if (S12SpriteOn==1)
 begin
 RED <= (twopalette[(S12dataout*3)])>>4; // RED bits(7:4) from colour palette
 GREEN <= (twopalette[(S12dataout*3)+1])>>4; // GREEN bits(7:4) from colour palette
 BLUE <= (twopalette[(S12dataout*3)+2])>>4; // BLUE bits(7:4) from colour palette
 end
 else
 if (S13SpriteOn==1)
 begin
 RED <= (threepalette[(S13dataout*3)])>>4; // RED bits(7:4) from colour palette
 GREEN <= (threepalette[(S13dataout*3)+1])>>4; // GREEN bits(7:4) from colour palette
 BLUE <= (threepalette[(S13dataout*3)+2])>>4; // BLUE bits(7:4) from colour palette
 end
 else
 if (S14SpriteOn==1)
 begin
 RED <= (fourpalette[(S14dataout*3)])>>4; // RED bits(7:4) from colour palette
 GREEN <= (fourpalette[(S14dataout*3)+1])>>4; // GREEN bits(7:4) from colour palette
 BLUE <= (fourpalette[(S14dataout*3)+2])>>4; // BLUE bits(7:4) from colour palette
 end
 else
 if (S15SpriteOn==1)
 begin
 RED <= (fivepalette[(S15dataout*3)])>>4; // RED bits(7:4) from colour palette
 GREEN <= (fivepalette[(S15dataout*3)+1])>>4; // GREEN bits(7:4) from colour palette
 BLUE <= (fivepalette[(S15dataout*3)+2])>>4; // BLUE bits(7:4) from colour palette
 end
 else
 if (S16SpriteOn==1)
 begin
 RED <= (sixpalette[(S16dataout*3)])>>4; // RED bits(7:4) from colour palette
 GREEN <= (sixpalette[(S16dataout*3)+1])>>4; // GREEN bits(7:4) from colour palette
 BLUE <= (sixpalette[(S16dataout*3)+2])>>4; // BLUE bits(7:4) from colour palette
 end
 else
 if (S17SpriteOn==1)
 begin
 RED <= (sevenpalette[(S17dataout*3)])>>4; // RED bits(7:4) from colour palette
 GREEN <= (sevenpalette[(S17dataout*3)+1])>>4; // GREEN bits(7:4) from colour palette
 BLUE <= (sevenpalette[(S17dataout*3)+2])>>4; // BLUE bits(7:4) from colour palette
 end
 else
 if (S18SpriteOn==1)
 begin
 RED <= (eightpalette[(S18dataout*3)])>>4; // RED bits(7:4) from colour palette
 GREEN <= (eightpalette[(S18dataout*3)+1])>>4; // GREEN bits(7:4) from colour palette
 BLUE <= (eightpalette[(S18dataout*3)+2])>>4; // BLUE bits(7:4) from colour palette
 end
 else
 if (S19SpriteOn==1)
 begin
 RED <= (ninepalette[(S19dataout*3)])>>4; // RED bits(7:4) from colour palette
 GREEN <= (ninepalette[(S19dataout*3)+1])>>4; // GREEN bits(7:4) from colour palette
 BLUE <= (ninepalette[(S19dataout*3)+2])>>4; // BLUE bits(7:4) from colour palette
 end
 
 else
 if (S20SpriteOn==1)
 begin
 RED <= (palette[(S20dataout*3)])>>4; // RED bits(7:4) from colour palette
 GREEN <= (palette[(S20dataout*3)+1])>>4; // GREEN bits(7:4) from colour palette
 BLUE <= (palette[(S20dataout*3)+2])>>4; // BLUE bits(7:4) from colour palette
 end
 else
 if (S21SpriteOn==1)
 begin
 RED <= (onepalette[(S21dataout*3)])>>4; // RED bits(7:4) from colour palette
 GREEN <= (onepalette[(S21dataout*3)+1])>>4; // GREEN bits(7:4) from colour palette
 BLUE <= (onepalette[(S21dataout*3)+2])>>4; // BLUE bits(7:4) from colour palette
 end
 else
 if (S22SpriteOn==1)
 begin
 RED <= (twopalette[(S22dataout*3)])>>4; // RED bits(7:4) from colour palette
 GREEN <= (twopalette[(S22dataout*3)+1])>>4; // GREEN bits(7:4) from colour palette
 BLUE <= (twopalette[(S22dataout*3)+2])>>4; // BLUE bits(7:4) from colour palette
 end
 else
 if (S23SpriteOn==1)
 begin
 RED <= (threepalette[(S23dataout*3)])>>4; // RED bits(7:4) from colour palette
 GREEN <= (threepalette[(S23dataout*3)+1])>>4; // GREEN bits(7:4) from colour palette
 BLUE <= (threepalette[(S23dataout*3)+2])>>4; // BLUE bits(7:4) from colour palette
 end
 else
 if (S24SpriteOn==1)
 begin
 RED <= (fourpalette[(S24dataout*3)])>>4; // RED bits(7:4) from colour palette
 GREEN <= (fourpalette[(S24dataout*3)+1])>>4; // GREEN bits(7:4) from colour palette
 BLUE <= (fourpalette[(S24dataout*3)+2])>>4; // BLUE bits(7:4) from colour palette
 end
 else
 if (S25SpriteOn==1)
 begin
 RED <= (fivepalette[(S25dataout*3)])>>4; // RED bits(7:4) from colour palette
 GREEN <= (fivepalette[(S25dataout*3)+1])>>4; // GREEN bits(7:4) from colour palette
 BLUE <= (fivepalette[(S25dataout*3)+2])>>4; // BLUE bits(7:4) from colour palette
 end
 else
 if (S26SpriteOn==1)
 begin
 RED <= (sixpalette[(S26dataout*3)])>>4; // RED bits(7:4) from colour palette
 GREEN <= (sixpalette[(S26dataout*3)+1])>>4; // GREEN bits(7:4) from colour palette
 BLUE <= (sixpalette[(S26dataout*3)+2])>>4; // BLUE bits(7:4) from colour palette
 end
 else
 if (S27SpriteOn==1)
 begin
 RED <= (sevenpalette[(S27dataout*3)])>>4; // RED bits(7:4) from colour palette
 GREEN <= (sevenpalette[(S27dataout*3)+1])>>4; // GREEN bits(7:4) from colour palette
 BLUE <= (sevenpalette[(S27dataout*3)+2])>>4; // BLUE bits(7:4) from colour palette
 end
 else
 if (S28SpriteOn==1)
 begin
 RED <= (eightpalette[(S28dataout*3)])>>4; // RED bits(7:4) from colour palette
 GREEN <= (eightpalette[(S28dataout*3)+1])>>4; // GREEN bits(7:4) from colour palette
 BLUE <= (eightpalette[(S28dataout*3)+2])>>4; // BLUE bits(7:4) from colour palette
 end
 else
 if (S29SpriteOn==1)
 begin
 RED <= (ninepalette[(S29dataout*3)])>>4; // RED bits(7:4) from colour palette
 GREEN <= (ninepalette[(S29dataout*3)+1])>>4; // GREEN bits(7:4) from colour palette
 BLUE <= (ninepalette[(S29dataout*3)+2])>>4; // BLUE bits(7:4) from colour palette
 end
 
 else
 if (HS10SpriteOn==1)
 begin
 RED <= (palette[(HS10dataout*3)])>>4; // RED bits(7:4) from colour palette
 GREEN <= (palette[(HS10dataout*3)+1])>>4; // GREEN bits(7:4) from colour palette
 BLUE <= (palette[(HS10dataout*3)+2])>>4; // BLUE bits(7:4) from colour palette
 end
 else
 if (HS11SpriteOn==1)
 begin
 RED <= (onepalette[(HS11dataout*3)])>>4; // RED bits(7:4) from colour palette
 GREEN <= (onepalette[(HS11dataout*3)+1])>>4; // GREEN bits(7:4) from colour palette
 BLUE <= (onepalette[(HS11dataout*3)+2])>>4; // BLUE bits(7:4) from colour palette
 end
 else
 if (HS12SpriteOn==1)
 begin
 RED <= (twopalette[(HS12dataout*3)])>>4; // RED bits(7:4) from colour palette
 GREEN <= (twopalette[(HS12dataout*3)+1])>>4; // GREEN bits(7:4) from colour palette
 BLUE <= (twopalette[(HS12dataout*3)+2])>>4; // BLUE bits(7:4) from colour palette
 end
 else
 if (HS13SpriteOn==1)
 begin
 RED <= (threepalette[(HS13dataout*3)])>>4; // RED bits(7:4) from colour palette
 GREEN <= (threepalette[(HS13dataout*3)+1])>>4; // GREEN bits(7:4) from colour palette
 BLUE <= (threepalette[(HS13dataout*3)+2])>>4; // BLUE bits(7:4) from colour palette
 end
 else
 if (HS14SpriteOn==1)
 begin
 RED <= (fourpalette[(HS14dataout*3)])>>4; // RED bits(7:4) from colour palette
 GREEN <= (fourpalette[(HS14dataout*3)+1])>>4; // GREEN bits(7:4) from colour palette
 BLUE <= (fourpalette[(HS14dataout*3)+2])>>4; // BLUE bits(7:4) from colour palette
 end
 else
 if (HS15SpriteOn==1)
 begin
 RED <= (fivepalette[(HS15dataout*3)])>>4; // RED bits(7:4) from colour palette
 GREEN <= (fivepalette[(HS15dataout*3)+1])>>4; // GREEN bits(7:4) from colour palette
 BLUE <= (fivepalette[(HS15dataout*3)+2])>>4; // BLUE bits(7:4) from colour palette
 end
 else
 if (HS16SpriteOn==1)
 begin
 RED <= (sixpalette[(HS16dataout*3)])>>4; // RED bits(7:4) from colour palette
 GREEN <= (sixpalette[(HS16dataout*3)+1])>>4; // GREEN bits(7:4) from colour palette
 BLUE <= (sixpalette[(HS16dataout*3)+2])>>4; // BLUE bits(7:4) from colour palette
 end
 else
 if (HS17SpriteOn==1)
 begin
 RED <= (sevenpalette[(HS17dataout*3)])>>4; // RED bits(7:4) from colour palette
 GREEN <= (sevenpalette[(HS17dataout*3)+1])>>4; // GREEN bits(7:4) from colour palette
 BLUE <= (sevenpalette[(HS17dataout*3)+2])>>4; // BLUE bits(7:4) from colour palette
 end
 else
 if (HS18SpriteOn==1)
 begin
 RED <= (eightpalette[(HS18dataout*3)])>>4; // RED bits(7:4) from colour palette
 GREEN <= (eightpalette[(HS18dataout*3)+1])>>4; // GREEN bits(7:4) from colour palette
 BLUE <= (eightpalette[(HS18dataout*3)+2])>>4; // BLUE bits(7:4) from colour palette
 end
 else
 if (HS19SpriteOn==1)
 begin
 RED <= (ninepalette[(HS19dataout*3)])>>4; // RED bits(7:4) from colour palette
 GREEN <= (ninepalette[(HS19dataout*3)+1])>>4; // GREEN bits(7:4) from colour palette
 BLUE <= (ninepalette[(HS19dataout*3)+2])>>4; // BLUE bits(7:4) from colour palette
 end
 
 else
 if (HS20SpriteOn==1)
 begin
 RED <= (palette[(HS20dataout*3)])>>4; // RED bits(7:4) from colour palette
 GREEN <= (palette[(HS20dataout*3)+1])>>4; // GREEN bits(7:4) from colour palette
 BLUE <= (palette[(HS20dataout*3)+2])>>4; // BLUE bits(7:4) from colour palette
 end
 else
 if (HS21SpriteOn==1)
 begin
 RED <= (onepalette[(HS21dataout*3)])>>4; // RED bits(7:4) from colour palette
 GREEN <= (onepalette[(HS21dataout*3)+1])>>4; // GREEN bits(7:4) from colour palette
 BLUE <= (onepalette[(HS21dataout*3)+2])>>4; // BLUE bits(7:4) from colour palette
 end
 else
 if (HS22SpriteOn==1)
 begin
 RED <= (twopalette[(HS22dataout*3)])>>4; // RED bits(7:4) from colour palette
 GREEN <= (twopalette[(HS22dataout*3)+1])>>4; // GREEN bits(7:4) from colour palette
 BLUE <= (twopalette[(HS22dataout*3)+2])>>4; // BLUE bits(7:4) from colour palette
 end
 else
 if (HS23SpriteOn==1)
 begin
 RED <= (threepalette[(HS23dataout*3)])>>4; // RED bits(7:4) from colour palette
 GREEN <= (threepalette[(HS23dataout*3)+1])>>4; // GREEN bits(7:4) from colour palette
 BLUE <= (threepalette[(HS23dataout*3)+2])>>4; // BLUE bits(7:4) from colour palette
 end
 else
 if (HS24SpriteOn==1)
 begin
 RED <= (fourpalette[(HS24dataout*3)])>>4; // RED bits(7:4) from colour palette
 GREEN <= (fourpalette[(HS24dataout*3)+1])>>4; // GREEN bits(7:4) from colour palette
 BLUE <= (fourpalette[(HS24dataout*3)+2])>>4; // BLUE bits(7:4) from colour palette
 end
 else
 if (HS25SpriteOn==1)
 begin
 RED <= (fivepalette[(HS25dataout*3)])>>4; // RED bits(7:4) from colour palette
 GREEN <= (fivepalette[(HS25dataout*3)+1])>>4; // GREEN bits(7:4) from colour palette
 BLUE <= (fivepalette[(HS25dataout*3)+2])>>4; // BLUE bits(7:4) from colour palette
 end
 else
 if (HS26SpriteOn==1)
 begin
 RED <= (sixpalette[(HS26dataout*3)])>>4; // RED bits(7:4) from colour palette
 GREEN <= (sixpalette[(HS26dataout*3)+1])>>4; // GREEN bits(7:4) from colour palette
 BLUE <= (sixpalette[(HS26dataout*3)+2])>>4; // BLUE bits(7:4) from colour palette
 end
 else
 if (HS27SpriteOn==1)
 begin
 RED <= (sevenpalette[(HS27dataout*3)])>>4; // RED bits(7:4) from colour palette
 GREEN <= (sevenpalette[(HS27dataout*3)+1])>>4; // GREEN bits(7:4) from colour palette
 BLUE <= (sevenpalette[(HS27dataout*3)+2])>>4; // BLUE bits(7:4) from colour palette
 end
 else
 if (HS28SpriteOn==1)
 begin
 RED <= (eightpalette[(HS28dataout*3)])>>4; // RED bits(7:4) from colour palette
 GREEN <= (eightpalette[(HS28dataout*3)+1])>>4; // GREEN bits(7:4) from colour palette
 BLUE <= (eightpalette[(HS28dataout*3)+2])>>4; // BLUE bits(7:4) from colour palette
 end
// else
// if (HS29SpriteOn==1)
// begin
// RED <= (ninepalette[(HS29dataout*3)])>>4; // RED bits(7:4) from colour palette
// GREEN <= (ninepalette[(HS29dataout*3)+1])>>4; // GREEN bits(7:4) from colour palette
// BLUE <= (ninepalette[(HS29dataout*3)+2])>>4; // BLUE bits(7:4) from colour palette
// end
 
 else
 if (L1SpriteOn==1)
 begin
 RED <= (livespalette[(L1dataout*3)])>>4; // RED bits(7:4) from colour palette
 GREEN <= (livespalette[(L1dataout*3)+1])>>4; // GREEN bits(7:4) from colour palette
 BLUE <= (livespalette[(L1dataout*3)+2])>>4; // BLUE bits(7:4) from colour palette
 end
 else
 if (L2SpriteOn==1)
 begin
 RED <= (livespalette[(L2dataout*3)])>>4; // RED bits(7:4) from colour palette
 GREEN <= (livespalette[(L2dataout*3)+1])>>4; // GREEN bits(7:4) from colour palette
 BLUE <= (livespalette[(L2dataout*3)+2])>>4; // BLUE bits(7:4) from colour palette
 end
 else
 if (L3SpriteOn==1)
 begin
 RED <= (livespalette[(L3dataout*3)])>>4; // RED bits(7:4) from colour palette
 GREEN <= (livespalette[(L3dataout*3)+1])>>4; // GREEN bits(7:4) from colour palette
 BLUE <= (livespalette[(L3dataout*3)+2])>>4; // BLUE bits(7:4) from colour palette
 end
 else
 if (BulletSpriteOn==1)
 begin
 RED <= (bulletpalette[(Bdout*3)])>>4; // RED bits(7:4) from colour palette
 GREEN <= (bulletpalette[(Bdout*3)+1])>>4; // GREEN bits(7:4) from colour palette
 BLUE <= (bulletpalette[(Bdout*3)+2])>>4; // BLUE bits(7:4) from colour palette
 end
 else
 if (BulletSpriteOn2==1)
 begin
 RED <= (bulletpalette[(Bdout2*3)])>>4; // RED bits(7:4) from colour palette
 GREEN <= (bulletpalette[(Bdout2*3)+1])>>4; // GREEN bits(7:4) from colour palette
 BLUE <= (bulletpalette[(Bdout2*3)+2])>>4; // BLUE bits(7:4) from colour palette
 end
 else
                if (Alien1SpriteOn==1)
                    begin
                        RED <= (alien01palette[(A1dout*3)])>>4;        // RED bits(7:4) from colour palette
                        GREEN <= (alien01palette[(A1dout*3)+1])>>4;    // GREEN bits(7:4) from colour palette
                        BLUE <= (alien01palette[(A1dout*3)+2])>>4;     // BLUE bits(7:4) from colour palette
                    end
                else
                if (Alien2SpriteOn==1)
                    begin
                        RED <= (alien02palette[(A2dout*3)])>>4;        // RED bits(7:4) from colour palette
                        GREEN <= (alien02palette[(A2dout*3)+1])>>4;    // GREEN bits(7:4) from colour palette
                        BLUE <= (alien02palette[(A2dout*3)+2])>>4;     // BLUE bits(7:4) from colour palette
                    end
                else
                if (Alien3SpriteOn==1)
                    begin
                        RED <= (alien03palette[(A3dout*3)])>>4;        // RED bits(7:4) from colour palette
                        GREEN <= (alien03palette[(A3dout*3)+1])>>4;    // GREEN bits(7:4) from colour palette
                        BLUE <= (alien03palette[(A3dout*3)+2])>>4;     // BLUE bits(7:4) from colour palette
                    end
                else
                if (Alien4SpriteOn==1)
                    begin
                        RED <= (alien01palette[(A4dout*3)])>>4;        // RED bits(7:4) from colour palette
                        GREEN <= (alien01palette[(A4dout*3)+1])>>4;    // GREEN bits(7:4) from colour palette
                        BLUE <= (alien01palette[(A4dout*3)+2])>>4;     // BLUE bits(7:4) from colour palette
                    end
//                  else
//                if (Alien5SpriteOn==1)
//                    begin
//                        RED <= (palette[(A5dout*3)])>>4;        // RED bits(7:4) from colour palette
//                        GREEN <= (palette[(A5dout*3)+1])>>4;    // GREEN bits(7:4) from colour palette
//                        BLUE <= (palette[(A5dout*3)+2])>>4;     // BLUE bits(7:4) from colour palette
//                    end
//                 else
//                if (Alien6SpriteOn==1)
//                    begin
//                        RED <= (palette[(A6dout*3)])>>4;        // RED bits(7:4) from colour palette
//                        GREEN <= (palette[(A6dout*3)+1])>>4;    // GREEN bits(7:4) from colour palette
//                        BLUE <= (palette[(A6dout*3)+2])>>4;     // BLUE bits(7:4) from colour palette
//                    end
//                 else
//                if (Alien7SpriteOn==1)
//                    begin
//                        RED <= (palette[(A7dout*3)])>>4;        // RED bits(7:4) from colour palette
//                        GREEN <= (palette[(A7dout*3)+1])>>4;    // GREEN bits(7:4) from colour palette
//                        BLUE <= (palette[(A7dout*3)+2])>>4;     // BLUE bits(7:4) from colour palette
//                    end
//                 else
//                if (Alien8SpriteOn==1)
//                    begin
//                        RED <= (palette[(A8dout*3)])>>4;        // RED bits(7:4) from colour palette
//                        GREEN <= (palette[(A8dout*3)+1])>>4;    // GREEN bits(7:4) from colour palette
//                        BLUE <= (palette[(A8dout*3)+2])>>4;     // BLUE bits(7:4) from colour palette
//                    end
                else
                if (Planet1SpriteOn==1)
                    begin
                        RED <= (planet1palette[(P1out*3)])>>4;        // RED bits(7:4) from colour palette
                        GREEN <= (planet1palette[(P1out*3)+1])>>4;    // GREEN bits(7:4) from colour palette
                        BLUE <= (planet1palette[(P1out*3)+2])>>4;     // BLUE bits(7:4) from colour palette
                    end
                else
                if (Planet2SpriteOn==1)
                    begin
                        RED <= (planet2palette[(P2out*3)])>>4;        // RED bits(7:4) from colour palette
                        GREEN <= (planet2palette[(P2out*3)+1])>>4;    // GREEN bits(7:4) from colour palette
                        BLUE <= (planet2palette[(P2out*3)+2])>>4;     // BLUE bits(7:4) from colour palette
                    end
                else
                if (Star1SpriteOn==1)
                    begin
                        RED <= (starpalette[(S1out*3)])>>4;        // RED bits(7:4) from colour palette
                        GREEN <= (starpalette[(S1out*3)+1])>>4;    // GREEN bits(7:4) from colour palette
                        BLUE <= (starpalette[(S1out*3)+2])>>4;     // BLUE bits(7:4) from colour palette
                    end 
                else
                if (Star2SpriteOn==1)
                    begin
                        RED <= (starpalette[(S2out*3)])>>4;        // RED bits(7:4) from colour palette
                        GREEN <= (starpalette[(S2out*3)+1])>>4;    // GREEN bits(7:4) from colour palette
                        BLUE <= (starpalette[(S2out*3)+2])>>4;     // BLUE bits(7:4) from colour palette
                    end  
                else
                if (Star3SpriteOn==1)
                    begin
                        RED <= (starpalette[(S3out*3)])>>4;        // RED bits(7:4) from colour palette
                        GREEN <= (starpalette[(S3out*3)+1])>>4;    // GREEN bits(7:4) from colour palette
                        BLUE <= (starpalette[(S3out*3)+2])>>4;     // BLUE bits(7:4) from colour palette
                    end  
                 else
                if (Star4SpriteOn==1)
                    begin
                        RED <= (starpalette[(S4out*3)])>>4;        // RED bits(7:4) from colour palette
                        GREEN <= (starpalette[(S4out*3)+1])>>4;    // GREEN bits(7:4) from colour palette
                        BLUE <= (starpalette[(S4out*3)+2])>>4;     // BLUE bits(7:4) from colour palette
                    end                 
                else
                    begin
                        RED <= (palette[(COL*3)])>>4;           // RED bits(7:4) from colour palette
                        GREEN <= (palette[(COL*3)+1])>>4;       // GREEN bits(7:4) from colour palette
                        BLUE <= (palette[(COL*3)+2])>>4;        // BLUE bits(7:4) from colour palette
                    end
            end
        else
                begin
                    RED <= 0;   // set RED, GREEN & BLUE
                    GREEN <= 0; // to "0" when x,y outside of
                    BLUE <= 0;  // the active display area
                end
    end
endmodule
