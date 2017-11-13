/* ~~~~ Simple Teensy Analog Out Stim ~~~~
   Notes: Teensey 3.5/3.6 has two built in 12 bit dacs.
   I assume you have a 3.5 or 3.6 and have 2 outs. But you can easily go to 1.
   I use the builtin FlexiTimer2 to handle the interupts for timing.

   v1.0
   cdeister@brown.edu
*/

#include <FlexiTimer2.h>

float pCounter=0;
float tCounter=0;
bool itHead=0;
bool oVal;
int sampsPerSecond=1000; // samples per second
int evalEverySample=1;   // number of times to poll the stim funtion
int stimType=0;         // 0: pulse train
int pulseTime=500;
int delayTime=500;
float writeValA=0;
float writeValB=0;
int trTime=10;
float trLen[]={12000,20000};
int trCount=1;
float aVal=0;
float bVal=0;



float aSc[] = {2000,4095}; 
float bSc[] = {0,0};


const int dacPinA=A21;
const int dacPinB=A22;

const int led_pin = 13;     // default to pin 13




void setup()
{
  Serial.begin(9600);
  delay(2);
  analogWriteResolution(12);
  
  
  pinMode(led_pin, OUTPUT);

  FlexiTimer2::set(1, 1.0/1000, fStim); // call every 500 1ms "ticks"
  FlexiTimer2::start();
}

void fStim()
{
  stimType=0;
  pCounter=pCounter+1;
  tCounter=tCounter+1;
  aVal=aSc[trCount-1];
  bVal=bSc[trCount-1];

  if (pCounter>trLen[trCount-1] && trCount<=2){
    trCount=trCount+1;
    pCounter=1;
    tCounter=1;
  }
  
  if (trCount>2){
    stimType=2;
  }

  if (stimType==0){
    if (tCounter<=pulseTime){
      oVal=0;
      writeValA=0;
      writeValB=0;
      analogWrite(dacPinA, writeValA);
      analogWrite(dacPinB, writeValB);
      digitalWrite(led_pin, oVal);    
    }
    else if (tCounter>pulseTime && tCounter<=pulseTime+delayTime){
      oVal=1;
      writeValA=aVal;
      writeValB=bVal;
      digitalWrite(led_pin, oVal);  
    }
    else if (tCounter>=pulseTime+delayTime+1){ 
      oVal=0;
      writeValA=0;
      writeValB=0;
      digitalWrite(led_pin, oVal);
      tCounter=1;    
    }
    Serial.print(writeValA);
    Serial.print(',');
    Serial.print(writeValB);
    Serial.print(',');
    Serial.println(pCounter);
    
    
  }
  else if (stimType==2){
      oVal=0;
      writeValA=0;
      writeValB=0;
      analogWrite(dacPinA, writeValA);
      analogWrite(dacPinB, writeValB);
      digitalWrite(led_pin, oVal);
      pCounter=1;
      tCounter=1;   
  }

  
//  Serial.print(tCounter);
//  Serial.print(',');
  
}

void loop()
{
}
