color black = #000000;
color white = #FFFFFF;
color selected = black;
int toggle = -1;
void setup(){
  size(500,500);
}
void draw(){
  background(142);
  stroke(white);
  fill(selected);
  rect(50,50,200,100);
  if (toggle > 0){
    guidelines();
  }
}
void mousePressed(){
  if (mouseX > 250 && mouseY > 50 && mouseX < 50 && mouseY < 150){
    toggle = toggle * -1;
  }
}
void guidelines(){
  selected = 100;
}
