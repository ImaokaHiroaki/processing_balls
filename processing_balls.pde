import processing.svg.PGraphicsSVG;

int n[] = new int[0];
int i=0;

float origin_x = 500;
float origin_y = 300;
  
void setup() {
  background(255);
  size(1000,600);
}

void draw() {
  drawBackground();
  drawBall();
  
  if(keyPressed) {
    if(key == 's') {
      println("save");
      beginRecord(SVG, "PApplet.svg");
      drawBall();
      endRecord();
    }
  }
}

void drawBackground(){
  background(255);
  float num_x = mouseX/100;
  float num_y = mouseY/50;
  
  float line_x = 0;
  float line_y = 0;
  
  float current_x = 0;
  float current_y = 0;
    
  stroke(100,100,255);
  for(int j=0;j<11;j++){
    line(line_x,0,line_x,height);
      for(int k=0;k<13;k++){
        line(0,line_y,width,line_y);
          line_y += height / 12;
          if (mouseY>=line_y && mouseY<line_y+height/12) {
            current_y = line_y;
          }
          if (mouseX>=line_x && mouseX<line_x+width/10) {
            current_x = line_x;
          }
       }
        line_x += width / 10;
  }
  
  fill(200,200,255);
  rect(current_x,current_y,width/10,height/12);
    
}

void drawBall() {
  float ball_x,ball_y;
  float num_x = mouseX/100;
  float num_y = mouseY/50;
  
  stroke(255,255,255);
  
  for(int i=0; i<500; i++){
    fill(255,255-i/2,0);
    ball_x = origin_x + i * cos(radians(i*num_x)) /2; 
    ball_y = origin_y + i * sin(radians(i*num_y)) /2;
    ellipse(ball_x,ball_y, 25, 25);
  }
}