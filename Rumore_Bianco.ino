const int triggerPin = 10;
const int echoPin = 9;
const int maxDistance = 400;

long duration;
int distance;

void setup() {
  pinMode(triggerPin, OUTPUT);
  pinMode(echoPin, INPUT);
  Serial.begin(9600);
  distance = 0;
}

void loop() {
  digitalWrite(triggerPin, LOW);
  delayMicroseconds(2);

  digitalWrite(triggerPin, HIGH);
  delayMicroseconds(10);

  duration = pulseIn(echoPin, HIGH);
  distance = (int)(duration * 0.034/2);
  //Serial.write(distance);
  Serial.println(String(distance));
  delay(30);
}
