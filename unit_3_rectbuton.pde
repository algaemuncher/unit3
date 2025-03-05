color black = #000000;
color white = #FFFFFF;
color selected = black;
int toggle = -1;
void setup(){
  size(500,500);
}
void draw(){
  background(142);
  strokeWeight(3);
  stroke(200);
  fill(100);
  if (toggle == 0){
    guidelines(0);
  }
  rect(50,50,200,100);
  fill(black);
  if (toggle == 1){
    guidelines(1);
  }
  rect(50,200,200,100);
  if (toggle == 2){
    guidelines(2);
  }
  fill(white);
  rect(50,350,200,100);
  fill(selected);
  rect(300,50,100,400);
}
void mousePressed(){
  if (mouseX < 250 && mouseY > 50 && mouseX > 50 && mouseY < 150){
    toggle = 0;
  }
  if (mouseX < 250 && mouseY > 200 && mouseX > 50 && mouseY < 300){
    toggle = 1;
  }
  if (mouseX < 250 && mouseY > 350 && mouseX > 50 && mouseY < 450){
    toggle = 2;
  }
}
void guidelines(int x){
  if (x == 0){
    selected = 100;
  }
  if (x == 1){
    selected = black;
  }
  if (x == 2){
    selected = white;
  }
}
