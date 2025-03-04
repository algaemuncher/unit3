color black = #000000;
color white = #FFFFFF;
color selected = black;

void setup(){
  size(500,500);
}
void draw(){
  background(146);
  tactile(150,150,50);
  circle(150,150, 100);
}
void mouseReleased(){
  
}
void tactile(int x, int y, int r){
  if (dist(x,y,mouseX,mouseY) < r){
    stroke(white);
  } else{
    stroke(black);
  }
}
