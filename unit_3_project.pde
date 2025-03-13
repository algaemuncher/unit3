PImage approved;
//rgb
color red = #eb0c0c;
color green = #0ceb0c;
color blue = #0c0ceb;
//secondaries
color yellow = #ebeb0c;
color cyan = #0cebeb;
color magenta = #eb0ce7;
//shades
color white = #FFFFFF;
color black = #000000;
color cselected = black;
int mode;
float sliderY = 50;
float size;

final int DRAW = 1;
final int ERASE = 2;
final int STAMP = 3;

void setup() {
  size(600, 600);
  background(142);
  size = 5;
  mode = DRAW;
  approved = loadImage("Green_stamp.png");
}
void draw() {
  menubar();
}
void menubar() {
  fill(75);
  stroke(0);
  strokeWeight(1);
  rect(0, 0, 600, 140);
  //colored circles
  tactcircle(30, 35, 30, red);
  tactcircle(30, 90, 30, yellow);
  tactcircle(75, 35, 30, green);
  tactcircle(75, 90, 30, cyan);
  tactcircle(120, 35, 30, blue);
  tactcircle(120, 90, 30, magenta);
  tactcircle(165, 35, 30, white);
  tactcircle(165, 90, 30, black);
  //thickness slider
  strokeWeight(3);
  stroke(225);
  line(230, 20, 230, 105);
  fill(225);
  circle(230, sliderY, 20);
  strokeWeight(size);
  line(280, 20, 280, 105);
  tactstamp(310, 10);
  eraser();
  tactrect(460, 10);
  tactrect(460, 53);
  tactrect(460, 96);
  fill(200);
  textSize(25);
  text("new",493,35);
  text("save",492,76);
  text("load",492,122);
}
void tactcircle(int x, int y, int radius, color c) {
  fill(c);
  circle(x, y, radius);
  if (dist(x, y, mouseX, mouseY) < radius/2) {
    stroke(255);
  } else {
    stroke(0);
  }
  circle(x, y, radius);
  if (mousePressed == true && dist(x, y, mouseX, mouseY) < radius+1) {
    cselected = c;
    mode = DRAW;
  }
}
void tactstamp(int x, int y) {
  if (x < mouseX && mouseX < x+135 && y < mouseY && mouseY < y+125) {
    fill(255);
  } else {
    fill(0);
  }
  if (mode == STAMP) {
    stroke(23, 212, 194);
  } else {
    stroke(0);
  }
  strokeWeight(2);
  rect(x, y, 135, 110);
  image(approved, x+5, y+5, 125, 100);
}
void tactrect(int x, int y) {
  if (x < mouseX && mouseX < x+110 && y < mouseY && mouseY < y+33) {
    stroke(255);
  } else {
    stroke(0);
  }
  rect(x, y, 110, 33);
}
void eraser() {
  if (75 < mouseX && mouseX < 75+45 && 55 < mouseY && mouseY < 55+16) {
    stroke(255);
  } else {
    stroke(0);
  }
  strokeWeight(1);
  fill(242, 128, 182);
  rect(75, 55, 45, 16);
  fill(20, 61, 224);
  rect(105, 55, 15, 16);
}
void mouseDragged() {
  dragdraw(size);
  slidercontrol();
  stamp();
  erase();
}
void mousePressed() {
  dragdraw(size);
  slidercontrol();
  stamp();
  erase();
}

void mouseReleased() {
  if (310 < mouseX && mouseX < 310+135 && 10 < mouseY && mouseY < 10+125 && mode != STAMP) {
    mode = STAMP;
  } else if (310 < mouseX && mouseX < 310+135 && 10 < mouseY && mouseY < 10+125 && mode == STAMP) {
    mode = DRAW;
  }
  if (75 < mouseX && mouseX < 75+45 && 55 < mouseY && mouseY < 55+16 && mode != ERASE) {
    mode = ERASE;
  } else if (75 < mouseX && mouseX < 75+45 && 55 < mouseY && mouseY < 55+16 && mode == ERASE) {
    mode = DRAW;
  }
  clear();
  save();
  load();
}
void dragdraw(float size) {
  if (mouseY > 140) {
    if (mode == DRAW) {
      fill(cselected);
      stroke(cselected);
      strokeWeight(size);
      line(pmouseX, pmouseY, mouseX, mouseY);
    }
  }
}
void slidercontrol() {
  if (210 < mouseX && mouseX < 250 && 20 < mouseY && mouseY < 105) {
    sliderY = mouseY;
    size = map(sliderY, 20, 105, 1, 20);
  }
}
void erase() {
  if (mouseY > 140) {
    if (mode == ERASE) {
      stroke(142);
      strokeWeight(size);
      line(pmouseX, pmouseY, mouseX, mouseY);
    }
  }
}
void saveImage(File f) {
  if (f != null) {
    PImage canvas = get(0,141,width,height-141);
    canvas.save(f.getAbsolutePath());
  }
}
void openImage(File f){
  if (f != null){
    int n = 0;
    while (n < 10){
      PImage pic = loadImage(f.getPath());
      image(pic,0,0);
      n = n + 1;
    }
  }
}
void clear(){
  if (mouseX > 460 && mouseY > 10 && mouseX < 570 && mouseY < 43){
    noStroke();
    fill(142);
    rect(0,140,600,460);
  }
}
void save(){
  if (mouseX > 460 && mouseY > 53 && mouseX < 570 && mouseY < 86){
    selectOutput("MUST BE IN ACCEPTABLE FORMATS (png,jpg,etc)","saveImage");
  }
}
void load(){
  if (mouseX > 460 && mouseY > 96 && mouseX < 570 && mouseY < 129){
    selectInput("Pick an image to load","openImage");
  }
}
void stamp() {
  if (mouseY > 140) {
    if (mode == STAMP) {
      image(approved, mouseX-60, mouseY-50, 125, 100);
    }
  }
}
