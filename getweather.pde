void getweather() {
  weather.update();

  voiceSpeed = 170;


  //if (myPort1.available() > 0) {
  //lightval = myPort1.read();
  //}
  lightval = 250;
  println("lightval", lightval);
  if (lightval >= 100) {
    fill(255);
    textFont(createFont("Montserrat-UltraLight.otf", 60));
    textAlign(CENTER, CENTER);
    text("Hello, "+user+" !", width/2, 70);
    textAlign(LEFT, DOWN);
    textSize(49);
    text(weather.getCityName()+"  "+weather.getTemperature()+" °C ", width/2-180, 180);
    //text(weather.getWeather(), width/2+50, 120);
    //text("Country: "+weather.getCountryName(), width/2, 200);
    textSize(24);
    text(weather.getLastUpdated()+"", width/2-180, 240);
    textSize(30);
    text("Humidity: "+weather.getHumidity(), width/2-180, 300);
    text("Wind Speed: "+weather.getWindSpeed(), width/2-180, 360);
    text("Wind Direction: "+weather.getWindDirection(), width/2-180, 420);
    String sunrise = weather.getSunrise();
    text("Sunrise: "+sunrise, width/2-180, 480);
    String sunset = weather.getSunset();
    text("Sunset: "+sunset, width/2-180, 540);

    textAlign(CENTER, CENTER);
    image(runimage, width/2-180, 560, 100, 100);
    textSize(40);
    text(readtime+ " minute(s)", width/2+30, 640);

    part1 = "Hello" + user + "          It is" +weather.getLastUpdated() + "      Today's temperature in"+weather.getCityName() + " is " + weather.getTemperature() +"degrees Celsius"; 
    part2 = "Your exercise plan today is to run for " + readtime+" minutes" +"                   Let's get started!";

  } else if (lightval < 100) {
    image(img2, 0, 0, width, height);
  }
}


import java.io.IOException;

static class TextToSpeech extends Object {

  // Store the voices, makes for nice auto-complete in Eclipse

  static final String ALEX = "Alex";

  // throw them in an array so we can iterate over them / pick at random
  static String voice = ALEX;

  // this sends the "say" command to the terminal with the appropriate args
  static void say(String script, String voice, int speed) {
    try {
      Runtime.getRuntime().exec(new String[] {"say", "-v", voice, "[[rate " + speed + "]]" + script});
    }
    catch (IOException e) {
      System.err.println("IOException");
    }
  }

  // Overload the say method so we can call it with fewer arguments and basic defaults
  static void say(String script) {
    // 200 seems like a resonable default speed
    say(script, ALEX, 200);
  }
}
