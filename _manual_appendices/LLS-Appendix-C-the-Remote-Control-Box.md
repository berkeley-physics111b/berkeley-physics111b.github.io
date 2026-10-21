---
title: "Appendix C: The Remote Control Box"
order: 7
summary: "Using the remote box to control the chopper, LEDs and halogen lamp from the lab station."
---

Source: <http://experimentationlab.berkeley.edu/node/98>

**All pages in this lab**

1.  [Low Light Signal Measurements](http://experimentationlab.berkeley.edu/LLS)
2.  [Introduction to Equipment (LLS)](IntroductiontoEquipment.md)
3.  [Introduction to Noise](IntroductiontoNoise.md)
4.  [Measuring the Light Signal from a Diode](LightSignal.md)
5.  [Appendix A: SR760 FFT Interface Program](LLS-Appendix-A-SR760-FFT-Interface-Program.md)
6.  [Appendix B: SR830 Lock-In Interface Program](LLS-Appendix-B-SR830-Lock-In-Interface-Program.md)
7.  **Appendix C: the Remote Control Box**
8.  [Appendix D: the Phase Sensitive (Lock-In) Detector](LLS-Appendix-D-the-Phase-Sensitive-Lock-In-Detector.md)
9.  [Appendix E: Interpreting the Data Sheet for the LED](LLS-Appendix-E-Interpreting-the-Data-Sheet-for-the-LED.md) and [Photodiode Data Sheet](LLS-Diode-data-sheets.md)

-----

# Appendix C: The Remote Control Box

The box in the corner of the room contains the SR540 Chopper Control, a set of LEDs and a halogen lamp. To make life easier for you, all of these things may be controlled remotely from the LowLight lab station using the controller box, pictured below:

![DetectorBox](img/DetectorBox_LLS-Appendix-C-the-Remote-Control-Box.png)

  - To do anything, you'll need to turn the AC Power on.
  - The Variac Voltage controls the halogen lamp, and in the future, a heat source. You may adjust the intensity of the lamp using the dial located above the Variac Voltage switch.
  - The SR540 Chopper Controller is controlled by the 0-5 DC Adjust dial and corresponding switch. The switch turns the SR540 on and off while the dial adjusts the frequency.
  - To turn on the LEDs, use the knob labeled To LEDS. There are three colors: red (2) , green (3), and yellow/orange (4). (1) is not currently being used.
  - The Thermistor ports are not being used.
  - The +5 V port provides +5 V DC.
  - The GND port provides a ground.
  - The Resistor Voltage port allows you to measure the voltage across the current-limiting resistor in series with whatever LED is on. *See the circuit diagram below*. By measuring the voltage across the resistor, you can determine both the current in the circuit as well as the voltage across the LED (5 V - *V*<sub>resistor</sub>). Thus you can calculate the power being dissipated by the LED.

![alt text](img/LLS73_LLS-Appendix-C-the-Remote-Control-Box.gif)
