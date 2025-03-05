color black = #000000;
color white = #FFFFFF;
color selected = black;
float sliderX;
float sliderY;
float shade = 135;

void setup(){
  size(500,500);
  strokeWeight(5);
  stroke(255,0,0);
  fill(255,0,0);
  sliderX = 250;
  sliderY = 250;
}
void draw(){
  background(shade);
  stroke(255,0,0);
  line(50,50,450,450);
  circle(sliderX,sliderY,75);o
}
void mouseDragged(){
  controlSlider();
}
void mouseReleased(){
  controlSlider();
}
void controlSlider(){
  if (mouseX > 49 && mouseX < 451){
    sliderX = mouseX;
    sliderY = sliderX;
  }
  shade = sliderX * .5;
}
