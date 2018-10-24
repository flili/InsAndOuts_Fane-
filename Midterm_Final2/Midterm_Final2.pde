/*FANE LI
  THIS IS A MIDTERM FOR THE CLASS MTEC2280 - FALL2018
  MADLIB GAME - MIDTERM FINAL FINAL 
*/


//-------------------------------------------------------------------------------------------------------------------------------//
//  IMAGES

PImage red;
PImage b;
PImage yellow;
PImage roll;
PImage force;
PImage pois;
PImage ups;


//-------------------------------------------------------------------------------------------------------------------------------//
//sound import
import processing.sound.*;


//-------------------------------------------------------------------------------------------------------------------------------//
//greeting
String[] words = { "Helloooo!", "Hey", "Hola", "Have a nice day!", "Play this game"};
int greeting = int(random(words.length));


//-------------------------------------------------------------------------------------------------------------------------------//
//SOUND FILE
SoundFile file;

String inst = "data/instrumental.mp3";
String path;


//-------------------------------------------------------------------------------------------------------------------------------//
//states
String state= "intro";


//-------------------------------------------------------------------------------------------------------------------------------//
//font
PFont product;
PFont title;


//-------------------------------------------------------------------------------------------------------------------------------//
//reveal story
String sentence1 ="Once upon a time there was a kid named ";


//-------------------------------------------------------------------------------------------------------------------------------//
//string he/she
String ch1 = "he";


//-------------------------------------------------------------------------------------------------------------------------------//
//setup run once
void setup() {
//-------------------------------------------------------------------------------------------------------------------------------//
//Assign image
  red = loadImage ("red.jpg");
  b = loadImage ("b.png");
  yellow = loadImage ("yellow.jpg");
  roll = loadImage ("roll.png");
  force = loadImage("force.png");
  pois = loadImage("pois.png");
  ups = loadImage("ups.png");


//-------------------------------------------------------------------------------------------------------------------------------//
//sound
  path = sketchPath(inst);
  file = new SoundFile (this, path);
  file.loop();
  
  
//-------------------------------------------------------------------------------------------------------------------------------//
//size of the canvas
  size (1920, 1000);
  //fullScreen();


//-------------------------------------------------------------------------------------------------------------------------------//
//text
  textAlign(CENTER);
  textSize(36);
  
//-------------------------------------------------------------------------------------------------------------------------------//  
//load font
  product = createFont("ProductR.ttf",42);
}


//-------------------------------------------------------------------------------------------------------------------------------//
//display on the screen
void draw() {
  if (state=="intro") {
    intro();
    
    
    //  rect(690,430,540,100);

    //if (mousePressed && mousex)
  }
  else if (state=="choice1") {
    choice1();
    textFont(product);
    text("Please move the mouse around and choose one:", width/2, height/4);
    text("blue", width/4, height/2);
    text("pink", width/2+width/4, height/2);
  }
  else if(state=="blue"){
    blue();
  }
  else if(state=="pink"){
    pink();
  }
  else if (state=="choice2"){
    choice2();
    text("emoji", width/4, height/2);
    text("reset", width/2+200, height/2);
  }
  else if(state=="emoji") {
    emoji();
  }
  else if (state =="emoji" || state == "reset") {
    story();
  }
  else if (state == "story"){
    intro();
  
  }
  
  println(state);
  println("mouseX", mouseX);
  println("mouseY", mouseY);
}


//-------------------------------------------------------------------------------------------------------------------------------//
//Display on the screen and the println when mouse pressed change display
void mousePressed() {
  if (state== "intro") {
    state="choice1";
}
  else if (state=="choice1") {
    if (mousePressed && mouseX < width/2 ){
    state= "blue";
  }
    else if (mousePressed && mouseX > width/2){
    state = "pink";
  }
}
  else if (state == "blue" || state == "pink") {
    state = "choice2";
}
  else if (state=="choice2") {
    if (mousePressed && mouseX < width/2 ){
    state= "emoji";
  }
    else if (state== "emoji" && mousePressed && mouseX > width/2){
    state = "story";
  }
}
  else if (state=="emoji" || state=="reset"){
    state="story";
 
  }
    else if (state == "reset"){
    state = "intro";
}

}


//-------------------------------------------------------------------------------------------------------------------------------//
//keypressed to return to the intro state.
void keyPressed(){
  if (key == 'R' || key == 'r'){
    state = "intro";
  }
}


//-------------------------------------------------------------------------------------------------------------------------------//
//FUNCTIONS TO THE STATES
// INTRO
void intro(){
  background(255);
  clickPlay();
  fill(0);
  text(words[greeting],width/2,height/2.5);   
}


//-------------------------------------------------------------------------------------------------------------------------------//
//INTRO CLICK PLAY BOX
void clickPlay(){
  textFont(product,50);
  stroke(0);
  strokeWeight(5);
  fill(255);
  rect(690,430,540,100);
  fill(0);
  text("Click to start the game", width/2, height/2);
}


//-------------------------------------------------------------------------------------------------------------------------------//
//CHOICE 1
void choice1(){
  fill(255);
  if (mouseX <= width/2){
    //blue
    background(184,225,250);    
  }else if (mouseX >= width/2){
    //pink
    background(250,184,216);
  }
}


//-------------------------------------------------------------------------------------------------------------------------------//
//BLUE OPTION
void blue (){
  //blue
    background(184,225,250);
    textFont(product);
    text("Please select one:", width/2, 100);
    red();
    b();
    yellow();
}


//-------------------------------------------------------------------------------------------------------------------------------//
//PINK OPTION
void pink (){
  //pink
    background(250,184,216);
    textFont(product);
    text("Please select one:", width/2, 100);
    red();
    b();
    yellow();
}


//void gameOver(){
  //background(255, 0, 0);
  //text("everyone loses.", width/2, height/2);
  //text("click to play again.", width/2, height/2 + 50);
//}
  
void red(){
  imageMode(CENTER);
  image (red, width/4, height/3,50,50);
  //text("this is red", width/2, height/2);
}
void b(){
  imageMode(CENTER);
  image (b, width/2, height/3,50,50);
}
void yellow(){
  imageMode(CENTER);
  image (yellow, width/2+250, height/3,50,50);
}


void choice2(){
  if (mouseX <= width/2){
    //
    fill(0);
    background(255);    
  }else if (mouseX >= width/2){
    //
    fill(255);
    background(0);
  }
  
}

void emoji(){
  background(0);
  fill (255);
  text ("Hey",200,200);
  imageMode(CENTER);
  image (roll, width/2, height/3,150,150);
}

//-------------------------------------------------------------------------------------------------------------------------------//
//REVEAL STORY
void story(){
  text(sentence1,100,100);
}


void reset(){
  background(255);
  fill(0);
  text("play again", width/2, height/2);
}