-- Clear Sky ESP32 Power Production Wokwi Test File 
-- Created on April 19, 2025
-- By Chris Kelsey of Blue Vision Studios
#include <Arduino.h>
#include <math.h>

// Define pins for a, b, and switch_v
const int pinA = 2; 
const int pinB = 4;
const int pinSwitch = 5;

int lastA = LOW, lastB = LOW, lastSwitch = LOW;
long long transitions = 0;  // Allow large transition values

// Constants for power calculation (adjusted to a realistic range)
const double CAPACITANCE = 1.0e-12;   // Scaled down capacitance value (picoFarads)
const double VOLTAGE = 1.2;           // Typical voltage (1.2V)
const double FREQUENCY = 1.0e6;      // 1 MHz frequency for testing

unsigned long lastMillis = 0;

void setup() {
  Serial.begin(115200);

  // Set pins as input
  pinMode(pinA, INPUT);
  pinMode(pinB, INPUT);
  pinMode(pinSwitch, INPUT);

  // Initial values for tracking transitions
  lastA = digitalRead(pinA);
  lastB = digitalRead(pinB);
  lastSwitch = digitalRead(pinSwitch);
}

void loop() {
  // Simulate transitions in a manageable range
  transitions = 1000000;  

  // Simulate negative transitions to represent energy production
  long long negativeTransitions = -1000000;

  // Choose between positive or negative transitions for the simulation
  transitions = negativeTransitions;  // Use this to simulate energy production

  // Calculate power usage based on transitions
  double wattage = transitions * CAPACITANCE * pow(VOLTAGE, 2) * FREQUENCY;

  // Print the wattage to the serial monitor
  Serial.print("Wattage: ");
  Serial.println(wattage, 5);  // Print wattage with 5 decimal places

  // Print the current status for each pin
  int currentA = digitalRead(pinA);
  int currentB = digitalRead(pinB);
  int currentSwitch = digitalRead(pinSwitch);

  Serial.print("Pin A: ");
  Serial.print(currentA);
  Serial.print(" | Pin B: ");
  Serial.print(currentB);
  Serial.print(" | Pin Switch: ");
  Serial.println(currentSwitch);

  delay(10);  // Simulate a delay between transitions
}

