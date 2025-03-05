color black = #000000;
color white = #FFFFFF;
color selected = black;
void setup() {
  size(500, 500);
}
void draw() {
  background(23,67,233);
  strokeWeight(2);
  tactile(150, 100, 50);
  fill(56);
  circle(150, 100, 100);
  tactile(150,250,50);
  fill(120);
  circle(150,250,100);
  tactile(150,400,50);
  fill(173);
  circle(150,400,100);
  tactile(-1,-1,1);
  fill(selected);
  rect(300,50,150,400);
}
void mouseReleased() {
  if (dist(150,100,mouseX,mouseY)<50){
    selected = 56;
  }
  if (dist(150,250,mouseX,mouseY)<50){
    selected = 120;
  }
  if (dist(150,400,mouseX,mouseY)<50){
    selected = 173;
  }
}
void tactile(int x, int y, int r) {
  if (dist(x, y, mouseX, mouseY) < r) {
    stroke(white);
  } else {
    stroke(black);
  }
}
