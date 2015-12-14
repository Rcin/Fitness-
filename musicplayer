void musicplayer() {
  player[0].pause();
  pushMatrix();
  translate(0, 0);
  fill(255);
  textSize(30);
  textAlign(CENTER, CENTER);
  text("Music Player++", width/2, height/2);
  popMatrix();
  //timer2.reset(CountdownTimer.StopBehavior.STOP_IMMEDIATELY); 
  //timer2.start();
  musicserial();
  //if (count == 0) {
  musicplay();
  //}
}

void musicserial() {
  moveval = myPort2.readStringUntil('\n');
  if (moveval != null) {
    moveval = trim(moveval);
    int sensors[] = int(split(moveval, ','));
    //for (int sensorNum = 0; sensorNum < sensors.length; sensorNum++) {
    //  println("Sensor " + sensorNum + ": " + sensors[sensorNum] + "\t");
    //}
    if (sensors.length>1) {
      x = map(sensors[0], 0, 1023, 0, 250);
      y = map(sensors[1], 0, 1023, 0, 250);
      z = map(sensors[2], 0, 1023, 0, 255);
      if (state == 3) {
        //for (int i = 0; i < 3; i++) {
        for (int i = 0; i <49; i++) {
          xPos[i] = xPos[i+1];
          yPos[i] = yPos[i+1];
          zPos[i] = zPos[i+1];
        }
        //xPos[3] = x;
        //yPos[3] = y;
        //zPos[3] = z;
        xPos[49] = x;
        yPos[49] = y;
        zPos[49] = z;
      }
    } 
    if (timer1.isRunning() || timer2.isRunning()) {
      float dis = int(sqrt((x*x)+(y*y)));
      println(dis);
      if (dis >= 70) {
        //println("Running");
        count ++;
      }  
      println("count "+count);
    }
  }
}

void musicplay() {

  image(img, 0, 0, width, height);

  beat.detect(player[musicnum].mix);
  drawmove();
  //music visualization
  pushMatrix();
  translate(width/2, height/2-35);
  noFill();
  fill(-1, 10);

  if (beat.isOnset()) rad = rad*0.9;
  else rad = 70;
  stroke(-1, 50);


  int bsize = player[musicnum].bufferSize();
  for (int i = 0; i < bsize - 1; i+=5)
  { 
    strokeWeight(2);
    float x = (r)*cos(i*2*PI/bsize);
    float y = (r)*sin(i*2*PI/bsize);
    float x2 = (r + player[musicnum].left.get(i)*100)*cos(i*2*PI/bsize);
    float y2 = (r + player[musicnum].left.get(i)*100)*sin(i*2*PI/bsize);
    line(x, y, x2, y2);
  }
  beginShape();
  noFill();
  stroke(-1, 50);
  strokeWeight(2);
  for (int i = 0; i < bsize; i+=30)
  {
    float x2 = (r + player[musicnum].left.get(i)*100)*cos(i*2*PI/bsize);
    float y2 = (r + player[musicnum].left.get(i)*100)*sin(i*2*PI/bsize);
    vertex(x2, y2);
    pushStyle();
    stroke(-1);
    strokeWeight(2);
    point(x2, y2);
    popStyle();
  }
  endShape();
  fill(255);
  textAlign(CENTER, CENTER);
  textFont(createFont("Montserrat-UltraLight.otf", 25));
  if ( player[musicnum].isPlaying() ) {
    text("Press any key to pause.", 0, 25);
    color(180);
  } else
  { 
    text("Press any key to start.", 0, 25);
    color(180);
  }
  fill(100, 20);
  popMatrix();
  if (player[musicnum].position() >= player[musicnum].length()-2000) {
    println("Changesong here!");
    player[musicnum].rewind();
    player[musicnum].pause();
    changesong();
  }
}

void changesong() {  
  //player[musicnum].pause();
  count = 0;
  pushMatrix();
  translate(0, 0);
  fill(255);
  textAlign(CENTER, CENTER);
  textFont(createFont("Montserrat-UltraLight.otf", 25));
  text("REDETECTING", 0, -20);
  popMatrix();
  timer2.reset(CountdownTimer.StopBehavior.STOP_IMMEDIATELY); 
  timer2.configure(100, load);
  timer2.start();
  musicserial();
  //println("new music", musicnum);
}

void drawmove() {
  pushMatrix();
  translate(0, height/2);
  strokeWeight(2);
  fill(120, 20);
  //line(0, 0, width, 0);
  pushStyle();
  noStroke();
  fill(255, 80);
  
  //different drawing patterns below
  
  //strokeWeight(2);
  //for (int i = 0; i <= 3; i++) {
  //  stroke(255-zPos[i], 80);
  //}
  //translate(0, 0);
  //curve(width/4 + xPos[0]/2 -50, 10, width/4 + xPos[1]/2 - 50, 240*1, width/4 + xPos[2]/2 -50, 240*2, width/4 + xPos[3]/2 -50, 750);
  //curve(width/4 - yPos[0]/2 -50, 10, width/4 - yPos[1]/2 - 50, 240*1, width/4 - yPos[2]/2 -50, 240*2, width/4 - yPos[3]/2 -50, 750);
  //curve(3*width/4 + yPos[0]/2 + 50, 240*0, 3*width/4 + yPos[1]/2 +50, 240*1, 3*width/4 + yPos[2]/2 +50, 240*2, 3*width/4 + yPos[3]/2 +50, 240*3);
  //curve(3*width/4 - xPos[0]/2 + 50, 240*0, 3*width/4 - xPos[1]/2 +50, 240*1, 3*width/4 - xPos[2]/2 +50, 240*2, 3*width/4 - xPos[3]/2 +50, 240*3);
  for (int i =0; i<= 46; i++) {
    //stroke(120, 80);
    //curve(12.8*i, xPos[i]/2+260, 12.8*(i+1), xPos[i+1]/2+260, 12.8*(i+2), xPos[i+2]/2+260, 12.8*(i+3), xPos[i+3]/2+260);
    //stroke(180, 80);
    //curve(12.8*i, -yPos[i]/2+260, 12.8*(i+1), -yPos[i+1]/2+260, 12.8*(i+2), -yPos[i+2]/2+260, 12.8*(i+3), -yPos[i+3]/2+260);
    //stroke(240, 80);
    //curve(12.8*i, zPos[i]/2+260, 12.8*(i+1), zPos[i+1]/2+260, 12.8*(i+2), zPos[i+2]/2+260, 12.8*(i+3), zPos[i+3]/2+260);
    //line(140+10*i, xPos[i]/2, 140+10*i, -xPos[i]/2);
    rectMode(CENTER); 
    rect(8*i + 455, 300, 2, xPos[i]*0.4);
    rect(8*i+5, 300, 2, yPos[i]*0.4);
    rect(8*i + 895, 300, 2, zPos[i]*0.4);
  }
  popStyle();
  popMatrix();
  fill(100, 20);
}
