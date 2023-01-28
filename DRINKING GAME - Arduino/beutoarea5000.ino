#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>
#include <Fonts/FreeSerif9pt7b.h>

#define SCREEN_WIDTH 128 // OLED display width, in pixels
#define SCREEN_HEIGHT 64 // OLED display height, in pixels
#define echoPin 2 // attach pin D2 Arduino to pin Echo of HC-SR04
#define trigPin 4 //attach pin D3 Arduino to pin Trig of HC-SR04
#define controlButton 3
#define plusButton 6
#define minusButton 7

volatile bool active = false;

// Declaration for an SSD1306 display connected to I2C (SDA, SCL pins)
Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, -1);

long duration; // variable for the duration of sound wave travel
int distance; // variable for the distance measurement

void setup() {
  Serial.begin(115200);
  pinMode(8, OUTPUT);
  digitalWrite(8, HIGH);
  pinMode(trigPin, OUTPUT); // Sets the trigPin as an OUTPUT
  pinMode(echoPin, INPUT); // Sets the echoPin as an INPUT

  pinMode(controlButton, INPUT); //Set the control button as INPUT
  pinMode(plusButton, INPUT); //Set the plus button as INPUT
  pinMode(minusButton, INPUT); //Set the minus button as INPUT

  digitalWrite(controlButton, HIGH);

  attachInterrupt(digitalPinToInterrupt(controlButton), activate, RISING);

  Serial.println("Ultrasonic Sensor HC-SR04 Test"); // print some text in Serial Monitor
  Serial.println("with Arduino UNO R3");

  if (!display.begin(SSD1306_SWITCHCAPVCC, 0x3C)) {
    Serial.println("SSD1306 allocation failed");
    for (;;);
  }

  delay(2000);
  display.setFont(&FreeSerif9pt7b);
  display.clearDisplay();
  display.setTextSize(1);
  display.setTextColor(WHITE);
  display.setCursor(0, 20);
  display.println("BEUTOAREA \n 5000");
  display.display();

  delay(2000);
  display.clearDisplay();
  display.setCursor(0, 20);
  display.println("BEA \n  FRAIERE");
  display.display();

  delay(2000);
  display.setTextSize(1);
  display.clearDisplay();
}

int i = 100;
int plusState = 0;
int minusState = 0;
int setTimes = 100;

void loop() {
  if (!active) {
    display.setTextSize(1);
    display.clearDisplay();
    display.setCursor(0, 20);
    display.println("ALEGE TIMP");
    plusState = digitalRead(plusButton);
    minusState = digitalRead(minusButton);

    if (plusState) {
      setTimes++;
    }
    if (minusState) {
      setTimes--;
    }

    display.println(setTimes / 10);
    display.display();
    i = setTimes;
  } else {
    display.setTextSize(3); 
    digitalWrite(trigPin, LOW);
    delayMicroseconds(2);
    // Sets the trigPin HIGH (ACTIVE) for 10 microseconds
    digitalWrite(trigPin, HIGH);
    delayMicroseconds(10);
    digitalWrite(trigPin, LOW);
    // Reads the echoPin, returns the sound wave travel time in microseconds
    duration = pulseIn(echoPin, HIGH);
    // Calculating the distance
    distance = duration * 0.034 / 2; // Speed of sound wave divided by 2 (go and back)
    // Displays the distance on the Serial Monitor

    if (distance > 10) {
      i = setTimes;
    }

    delay(80);
    i -= 1;
    if (i <= 0) {
      digitalWrite(8, LOW);
      display.clearDisplay();
      display.setCursor(0, 40);
      display.println("BEA!!");
      display.display();
    } else {
      digitalWrite(8, HIGH);
      display.clearDisplay();
      display.setCursor(0, 40);
      display.println(i / 10);
      display.display();
    }
  }
}

void activate() {
  active = !active;
}