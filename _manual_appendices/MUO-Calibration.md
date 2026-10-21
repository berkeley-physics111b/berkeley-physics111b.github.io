---
title: "Calibration"
order: 3
summary: "Setting up the DG645 delay generator to calibrate the timing and efficiency of the muon lifetime electronics."
---

# Calibration Procedure for Electronics on Muon Lifetime

In this section we set up the SRS DG645 Digital Delay Generator for testing the efficiency of our digitizer. The DG645 may be thought of as a function generator which is specifically designed to generate very precise, synchronized pulses. You should first take a look at the manual of this device and briefly familiarize yourself with its capabilities. Quantitatively, to what precision is the timing of the pulses guaranteed by the manufacturer? Is it good enough for our purposes? The manual for this generator may be found [online](http://www.thinksrs.com/downloads/PDFs/Manuals/DG645m.pdf).

Setup the DG645 as follows:

Set the Delay Generator to trigger internally at 25kHz (every 40 $\mu s$). If the Muon Program Range is set to something other than 40$\mu s$, this rate should be changed to match it. To do this:

  - Use the up / down arrows in TRIG MODE to select INT
  - Type in 25000 and press ENTER. The display should read "trg 25 000. 000 000" and the LED next to Hz should be lit.

Set the generator to create a 100ns pulse 1 $ \mu s $ after the internal trigger fires. To do this:

  - Use the left / right arrows under EDGE to select the rising edge of the AB pulse. The green LED just to the left of "AB" should be lit.
  - Type 1 and click $ \mu s$ (this is the down arrow under MODIFY). The display should read "A = 0 + 000. 000 001 000 000" with the "sec" LED lit.
  - Now select the falling edge of the AB pulse. The green LED just to the right of "AB" should be lit.
  - Type 100 and click ns (this is the up arrow under MODIFY). The display should ready "b = A + 000. 000 000 100 000".

Now set the offset of the AB pulse to 0 and the amplitude to 0.5V. To do this:

  - With the AB pulse still selected (rising or falling edge), click LEVEL until the screen reads "offset" (the rising edge LED should be lit). Type 0 and press ENTER.
  - Press LEVEL until the screen reads "step". Type 0.5 and click ENTER.

The AB output of the Delay Generator should now be outputting a 100ns pulse every 40 $ \mu s$. Plug the digitizer card into the AB output of the Delay Generator. Open Scope Soft Front Panel, and view the signal. If the signal matches what you expect, you have set up the Generator correctly.

**IMPORTANT NOTE:** the output of the Delay Generator expects a 50$\Omega $ load. If the load impedance is much larger, the signal amplitude will double. The digitizer card may be configured to have a 50$\Omega $ input impedance or a 1M$\Omega $ impedance. If you are using Scope Soft, make sure the input impedance is 50$\Omega $ (enable DC coupling, click Channel and select the input impedance to be 50 $\Omega $). When using a separate Oscilloscope, use a T junction with a 50$\Omega $ terminator. The Muon software (View Signals and Muon Detection) both set the impedance to 50$\Omega $ automatically.
