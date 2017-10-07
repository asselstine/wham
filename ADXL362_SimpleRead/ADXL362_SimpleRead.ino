/*
 ADXL362_SimpleRead.ino -  Simple XYZ axis reading example
 for Analog Devices ADXL362 - Micropower 3-axis accelerometer
 go to http://www.analog.com/ADXL362 for datasheet
 
 
 License: CC BY-SA 3.0: Creative Commons Share-alike 3.0. Feel free 
 to use and abuse this code however you'd like. If you find it useful
 please attribute, and SHARE-ALIKE!
 
 Created June 2012
 by Anne Mahaffey - hosted on http://annem.github.com/ADXL362

 Modified May 2013
 by Jonathan Ruiz de Garibay
 
Connect SCLK, MISO, MOSI, and CSB of ADXL362 to
SCLK, MISO, MOSI, and DP 10 of Arduino 
(check http://arduino.cc/en/Reference/SPI for details)
 
*/ 

#include <SPI.h>
#include <ADXL362.h>

ADXL362 xl;

int16_t temp;
int16_t XValue, YValue, ZValue, Temperature;
byte y = 0;

void setup(){
  
  Serial.begin(19200);
  xl.begin(10);                   // Setup SPI protocol, issue device soft reset
  xl.beginMeasure();              // Switch ADXL362 to measure mode  
	
//  Serial.println("Start Demo: Simple Read");
}

void loop(){
  if (Serial.available() > 0) {
    // read the incoming byte:
    y = Serial.read();
  } else {
    y = 0;
  }
    
  // read all three axis in burst to ensure all measurements correspond to same sample time
  xl.readXYZTData(XValue, YValue, ZValue, Temperature);  
//  Serial.print("XVALUE=");
  Serial.print(XValue);	 
  Serial.print(',');
//  Serial.print("\tYVALUE=");
  Serial.print(YValue);
  Serial.print(',');
//  Serial.print("\tZVALUE=");
  Serial.print(ZValue);
  Serial.print(',');	 
//  Serial.print("\tTEMPERATURE=");
//  Serial.println(Temperature);
//  Serial.print("\tTIME=");
  Serial.print(millis());
  Serial.print(',');   
  Serial.println(y);
  delay(30);                // Arbitrary delay to make serial monitor easier to observe
}

