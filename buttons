void createinput() {

  cp5 = new ControlP5(this);
  cp5.addTextfield("Name")
    .setPosition(width/2-100, height/2-100)
    .setSize(200, 40)
    .setFont(createFont("Montserrat-Light.otf", 20))
    .setFocus(true)
    .setAutoClear(false)
    ;

  myKnob = cp5.addKnob("plan")
    .setRange(0, 60)
    .setValue(60)
    .setPosition(width/2-50, height/2-40)
    .setRadius(50)
    .setLabel("Your exercise plan")
    .setDragDirection(Knob.VERTICAL)
    ;

  cp5.addBang("ENTER")
    .setPosition(width/2-40, height/2+100)
    .setSize(80, 40)
    .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
    ;
}

void ENTER() {
  user = cp5.get(Textfield.class, "Name").getText();
  timer1.configure(SECOND_IN_MILLIS, HOUR_IN_MILLIS);

  println("### bang(). a bang event. setting user name to "+user);
  state = 1;
}

void plan(int theValue) {
  readtime = str(theValue);
  HOUR_IN_MILLIS = 1000 + theValue*1000;
  println("HOUR_IN_MILLIS "+HOUR_IN_MILLIS);
  println("a knob event. setting timer1 to "+theValue);
}


public void controlEvent(ControlEvent theEvent) {
  if (theEvent.isAssignableFrom(Textfield.class)) {
    println("controlEvent: accessing a string from controller '"
      +theEvent.getName()+"': "
      +theEvent.getStringValue()
      );
  }
}

public void input(String theText) {
  // automatically receives results from controller input
  println("a textfield event for controller 'input' : "+theText);
}
