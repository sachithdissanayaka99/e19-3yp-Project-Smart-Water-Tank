#include <Arduino_BuiltIn.h>
#include "utils.h"
#include <PubSubClient.h>
#include "waterlevel.h"

#define TRIGPIN 18
#define ECHOPIN 5

int prevLevel = 0;

void setup() {
    Serial.begin(115200);
    pinMode(INLETVALVE,OUTPUT);
    pinMode(OUTLETVALVE,OUTPUT);
    pinMode(PUMP,OUTPUT);
    pinMode(32,OUTPUT);
    pinMode(35,OUTPUT);
    waterLevelPinSet(TRIGPIN,ECHOPIN);
    connectAWS();
}

void loop() {

  client.loop();
  int level = waterLevelCalculator(TRIGPIN,ECHOPIN);
  if(level!=100){
    Serial.println(level);
  }

  if((int)(level/10)==1 && prevLevel!=10){
    client.publish("esp32/pub","10");
    prevLevel = 10;
    
  }else if((int)(level/10)==2 && prevLevel!=20){
    client.publish("esp32/pub","20");
    prevLevel = 20;
  }else if((int)(level/10)==3 && prevLevel!=30){
    client.publish("esp32/pub","30");
    prevLevel = 30;
  }else if((int)(level/10)==4 && prevLevel!=40){
    client.publish("esp32/pub","40");
    prevLevel = 40;
  }else if((int)(level/10)==5 && prevLevel!=50){
    client.publish("esp32/pub","50");
    prevLevel = 50;
  }else if((int)(level/10)==6 && prevLevel!=60){
    client.publish("esp32/pub","60");
    prevLevel = 60;
  }else if((int)(level/10)==7 && prevLevel!=70){
    client.publish("esp32/pub","70");
    prevLevel = 70;
  }else if((int)(level/10)==8 && prevLevel!=80){
    client.publish("esp32/pub","80");
    prevLevel = 80;
  }else if((int)(level/10)==9 && prevLevel!=90){
    client.publish("esp32/pub","90");
    prevLevel = 90;
  }

  if(!client.connect(THINGNAME)){
    connectAWS();
  }
  
  delay(500); 
}