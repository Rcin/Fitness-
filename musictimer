void musictimer()
{  
  image(img3, 0, 0, width, height);
  cp5.hide();

  updateTimeText();  
  beat = new BeatDetect();
  player[0].play();
  if (!timer2.isRunning()) {
    timer2.configure(100, load);
    timer2.start();
  }
  musicserial();
  if (count<=3) {
    timer1.stop(CountdownTimer.StopBehavior.STOP_IMMEDIATELY);
  } else {
    timer1.start();
  }

  beat.detect(player[0].mix);
  pushMatrix();
  fill(#1A1F18, 20);
  noStroke();
  rect(0, 0, width, height);
  translate(width/2, height/2);
  noFill();
  fill(-1, 10);
  if (beat.isOnset()) rad = rad*0.9;
  else rad = 70;
  //ellipse(0, 0, 2*rad, 2*rad);
  strokeWeight(2);
  stroke(-1, 50);
  int bsize = player[0].bufferSize();
  for (int i = 0; i < bsize - 1; i+=5)
  {
    float x = (r)*cos(i*2*PI/bsize);
    float y = (r)*sin(i*2*PI/bsize);
    float x2 = (r + player[0].left.get(i)*100)*cos(i*2*PI/bsize);
    float y2 = (r + player[0].left.get(i)*100)*sin(i*2*PI/bsize);
    line(x, y, x2, y2);
  }
  beginShape();
  noFill();
  stroke(-1, 50);
  for (int i = 0; i < bsize; i+=30)
  {
    float x2 = (r + player[0].left.get(i)*100)*cos(i*2*PI/bsize);
    float y2 = (r + player[0].left.get(i)*100)*sin(i*2*PI/bsize);
    vertex(x2, y2);
    pushStyle();
    stroke(-1);
    strokeWeight(2);
    point(x2, y2);
    popStyle();
  }
  endShape();
  // if (flag)
  // showMeta();
  fill(255);
  textAlign(CENTER, CENTER);
  textFont(createFont("Montserrat-UltraLight.otf", 30));
  text(timeText, 0, 0);
  popMatrix();
}

void updateTimeText() {
  timeTextSeconds = elapsedTime % 60;
  timeTextMinutes = elapsedTime / 60;
  timeTextHours = timeTextMinutes / 60;
  timeText = nf(timeTextHours, 2) + ":" + nf(timeTextMinutes, 2) + ':' + nf(timeTextSeconds, 2);
}

void onTickEvent(CountdownTimer t, long timeLeftUntilFinish) {
  //println("t "+t);
  if (t == timer1) {
    if (timer1.isRunning()) {
      ++elapsedTime;
    }
    updateTimeText();
  }
}

// this will be called after the timer finishes running for the assigned time 
public void onFinishEvent(CountdownTimer t) {
  if (t == timer2) {  
    println("Count down finished!");
    if (count>3) {
      musicnum = int(random(5, 8));
    } else {
      musicnum = int(random(1, 4));
    }
    println("new", musicnum);
    count = 0;
  }
  if (t == timer1) {
    timerDone = true;
    player[0].pause();
  }
}
