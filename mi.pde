PImage block;
PImage stone;
int i;
int camX = 0;
int camY = 0;

void setup(){
  size(600,600,P3D);
  //block = loadImage("block.png");
  stone = loadImage("stone.jpg");
  textureMode(NORMAL); 
  //stone = block.get(0,0,16,16);
  background(0);
  i = 0;
} 

void drawTex(PImage image,int x1, int y1, int z1, int x2, int y2, int z2){
  beginShape();
  texture(image);
  vertex( x1, y1, z1,  0, 0);
  vertex( x2, y1, z2,  1, 0);
  vertex( x2, y2, z2,  1, 1);
  vertex( x1, y2, z2,  0, 1);
  endShape();
}

void drawBox(PImage image, int xx, int yy, int zz){
  int size = 100;
  int ex = xx+100;
  int ey = yy+100;
  int ez = zz+100;
  beginShape();
  texture(image);
  vertex( xx, yy, zz,  0, 0);
  vertex( ex, yy, zz,  1, 0);
  vertex( ex, ey, zz,  1, 1);
  vertex( xx, ey, zz,  0, 1);
  endShape();
  
  beginShape();
  texture(image);
  vertex( xx, yy, zz,  0, 0);
  vertex( xx, yy, ez,  1, 0);
  vertex( xx, ey, ez,  1, 1);
  vertex( xx, ey, zz,  0, 1);
  endShape();
  
  beginShape();
  texture(image);
  vertex( xx, yy, zz,  0, 0);
  vertex( xx, yy, ez,  1, 0);
  vertex( xx, ey, ez,  1, 1);
  vertex( xx, ey, zz,  0, 1);
  endShape();
}

void draw(){
  background(0);
  lights();
  /*
  if (keyPressed) {
    if (keyCode == LEFT) camX -= 1;
    if (keyCode == RIGHT) camX += 1;
    if (keyCode == UP) camY -= 1;
    if (keyCode == DOWN) camY += 1;
  }*/
  //camX = z*cos(s);
  camX = (width/2)-mouseX;
  camY = (height/2)-mouseY; camY*=-1;
  /*
  camera((width/2)-mouseX,(height/2)-mouseY, 300.0, // 視点X, 視点Y, 視点Z
         0.0, 0.0, 0.0, // 中心点X, 中心点Y, 中心点Z
         0.0, 1.0, 0.0); // 天地X, 天地Y, 天地Z
         */
  camera( 0,  0,   0, // 視点X, 視点Y, 視点Z
         camX, camY, 100, // 中心点X, 中心点Y, 中心点Z
         0.0, 1.0, 0.0); // 天地X, 天地Y, 天地Z
         
  text(pmouseX,0,0);
  drawBox(stone, -100,  0,  0);
  drawBox(stone, -100,  0,  0);
  drawBox(stone,    0,  0,  0);
}