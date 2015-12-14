import ddf.minim.*;
import ddf.minim.analysis.*;
import com.dhchoi.CountdownTimer;
import com.dhchoi.CountdownTimerService;
import controlP5.*;
import cc.arduino.*;
import org.firmata.*;

import processing.sound.*;
import processing.serial.*;

import com.onformative.yahooweather.*;
//for weather report
YahooWeather weather;  
int ledPin = 13;
int lightval=0;
Serial myPort1;
String part1;
String part2;
int updateIntervallMillis = 30000000; 
int voiceSpeed;

//for timer
final long SECOND_IN_MILLIS = 1000;
long HOUR_IN_MILLIS = 11000;
boolean timerDone;
String readtime;
CountdownTimer timer1;
int elapsedTime = 0;
String timeText = "";
int timeTextSeconds = 0, timeTextMinutes = 0, timeTextHours = 0; // the seconds and minutes to be displayed

//for interface
ControlP5 cp5;
int knobValue = 100;
Knob myKnob;
String user = "";
PImage img;
PImage img2;
PImage img3;
PImage runimage;

//for music player
Serial myPort2;
Minim minim;
AudioPlayer[] player = new AudioPlayer[9];
int musicnum;
BeatDetect beat;
int state = 0;
int  r = 200;
float rad = 70;
String moveval;
CountdownTimer timer2;
int load = 5000;
float x, y, z;
int count;
//float[] xPos = new float[4];
//float[] yPos = new float[4];
//float[] zPos = new float[4];
float[] xPos = new float[50];
float[] yPos = new float[50];
float[] zPos = new float[50];

void setup()
{ 
  size(1280, 720);
  //frameRate(200);
  minim = new Minim(this);
  player[0] = minim.loadFile("Aimer - LAST STARDUST.mp3");
  player[1] = minim.loadFile("1.mp3");
  player[2] = minim.loadFile("2.mp3");
  player[3] = minim.loadFile("3.mp3");
  player[4] = minim.loadFile("4.mp3");
  player[5] = minim.loadFile("5.mp3");
  player[6] = minim.loadFile("6.mp3");
  player[7] = minim.loadFile("7.mp3");
  player[8] = minim.loadFile("8.mp3");
  img = loadImage("background2.jpg");
  img2 = loadImage("background4.jpg");
  img3 = loadImage("background3.jpg");
  runimage = loadImage("running.png");
  weather = new YahooWeather(this, 2151849, "c", updateIntervallMillis);
  //myPort1 = new Serial(this, "/dev/tty.usbmodem1421", 9600);
  println(Serial.list());
  myPort2 = new Serial(this, "/dev/tty.usbserial-AJ031ELS", 9600);
  timer1 = CountdownTimerService.getNewCountdownTimer(this);
  timer2 = CountdownTimerService.getNewCountdownTimer(this);
  createinput();
}

void draw() {

  //println("Current state "+state);
  if (state == 0) {
    image(img2, 0, 0, width, height);
    fill(255);
    textFont(createFont("Montserrat-Hairline.otf", 80));
    textAlign(CENTER, CENTER);
    text("FITNESS+", width/2, 180);
    smooth();
    noStroke();
  } else if (state == 1) {
    image(img2, 0, 0, width, height);
    cp5.getController("Name").hide();
    myKnob.setVisible(false);
    cp5.getController("ENTER").hide();
    getweather();
  } else if (state == 2) {
    if (timerDone == true) {
      state = 3;
    } else {
      musictimer();
    }
  } else if (state == 3) {
    image(img3, 0, 0, width, height);
    cp5.getController("Name").hide();
    myKnob.setVisible(false);
    cp5.getController("ENTER").hide();
    musicplayer();
  }
}


void keyPressed() {
  if (state == 1 && key == ' ') {
    image(img3, 0, 0, width, height);
    state = 2;
  }
  if (key=='s')saveFrame("###.jpeg");
  if (state == 0) {
    switch(key) {
      case('1'):
      myKnob.setValue(180);
      break;
      case('3'):
      myKnob.shuffle();
      break;
    }
  } else if (state == 1) {
    TextToSpeech.say(part1, TextToSpeech.voice, voiceSpeed);
    delay(12000);
    TextToSpeech.say(part2, TextToSpeech.voice, voiceSpeed);
  } else if (state == 3) {
    if ( player[musicnum].isPlaying() )
    {
      player[musicnum].pause();
    } else
    {
      player[musicnum].play();
    }
  }
}

void mousePressed() {
  if (state == 3) {
    println("mouseX", mouseX, "mouseY", mouseY);
    if (mouseX >= 622 && mouseX <= 681 && mouseY >= 243 && mouseY<= 307) {
      println("Changesong!");
      //player[musicnum].pause();
      changesong();
      player[musicnum].rewind();
      player[musicnum].pause();
    } else {
      int position = int( map( mouseX, 0, width, 0, player[musicnum].length() ) );
      player[musicnum].cue( position );
    }
  }
}
