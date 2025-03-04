color black = #000000;
color white = #FFFFFF;
color selected = black;
float sliderX;
float shade = 135;

void setup(){
  size(500,500);
  strokeWeight(5);
  stroke(255,0,0);
  fill(255,0,0);
  sliderX = 250;
}
void draw(){
  background(shade);
  line(50,250,450,250);
  circle(sliderX,250,75);
}
void mouseDragged(){
  controlSlider();
}
void mouseReleased(){
  controlSlider();
}
void controlSlider(){
  if (mouseX < 451 && mouseY > 174 && mouseX > 49 && mouseY < 326){
    sliderX = mouseX;
  }
  shade = sliderX * .5;
}
