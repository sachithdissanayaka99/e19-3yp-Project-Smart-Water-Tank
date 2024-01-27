#define INLETVALVE 21
#define OUTLETVALVE 19

void waterLevelPinSet(int trigPin, int echoPin){

  pinMode(echoPin,INPUT);
  pinMode(trigPin,OUTPUT);
}

int waterLevelCalculator(int trigPin, int echoPin){

    digitalWrite(trigPin,LOW);
    delayMicroseconds(2);

    digitalWrite(trigPin,HIGH);
    delayMicroseconds(20);

    digitalWrite(trigPin,LOW);

    float duration = pulseIn(echoPin, HIGH);

    int level = (int)(duration/100);

    if(level>100){
      level = 100;
    }
    if(level<0){
      level = 0;
    }

    if(level>90 && level!=100){
      digitalWrite(INLETVALVE,HIGH);
      digitalWrite(14,HIGH);
    }else{
      digitalWrite(INLETVALVE,LOW);
      digitalWrite(14,LOW);
    }

    if(level<20 && level!=0){
      digitalWrite(OUTLETVALVE,LOW);
      digitalWrite(12,HIGH);
    }else{
      digitalWrite(OUTLETVALVE,HIGH);
      digitalWrite(12,LOW);
    }

    return level;
}