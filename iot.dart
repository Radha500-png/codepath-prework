const int ldrPin = A0;        // Analog pin connected to the LDR
const int yellowLEDPin = 9;   // PWM-capable pin for yellow LED
const int whiteLEDPin = 10;   // PWM-capable pin for white LED

void setup() {
  pinMode(yellowLEDPin, OUTPUT);
  pinMode(whiteLEDPin, OUTPUT);
  Serial.begin(9600);
}

void loop() {
  int ldrValue = analogRead(ldrPin); // Read the value from the LDR
  Serial.println(ldrValue); // Print LDR value for debugging

  // Calculate brightness for LEDs based on LDR value
  int yellowBrightness = map(ldrValue, 0, 1023, 255, 0); // Inverse relationship
  int whiteBrightness = map(ldrValue, 0, 1023, 0, 255);  // Direct relationship

  // Set the LED brightness
  analogWrite(yellowLEDPin, yellowBrightness);
  analogWrite(whiteLEDPin, whiteBrightness);

  delay(100); // Short delay to avoid flickering
}