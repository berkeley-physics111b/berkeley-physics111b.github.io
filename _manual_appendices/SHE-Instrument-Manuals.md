---
title: "Instrument Manuals"
order: 3
summary: "Operating instructions for the Keithley 2400 SourceMeter, Keithley 6514 electrometer, LakeShore 330 temperature controller and LakeShore 450 gaussmeter."
---

**(Note: These are generic manuals for various instruments, not specific instructions for using them in the Semiconductor Hall Effect experiment.)**

For the Full Manuals goto the \[[Physics111 Library Site](http://physics111.lib.berkeley.edu/Physics111/)\]

**Contents**

  - [1 Keithley 2400 SourceMeter Operation Instructions](#keithley-2400-sourcemeter-operation-instructions)
  - [2 Keithley 6514 System Electrometer Operation Instructions](#keithley-6514-system-electrometer-operation-instructions)
  - [3 LakeShore 330 Temperature Controller Operation Instructions](#lakeshore-330-temperature-controller-operation-instructions)
  - [4 LakeShore 450 Gaussmeter Operation Instructions](#lakeshore-450-gaussmeter-operation-instructions)

# Keithley 2400 SourceMeter Operation Instructions

The 2400 SourceMeter has the capability of either supplying voltage or current to the Device Under Test (DUT). Since in this experiment we are going to supply the current to the sample we will use the current source function of the 2400 SourceMeter. Therefore, in the following procedure it is referred to current settings and not voltage. For the full operational instructions consult "2400 Series SourceMeter User's Manual."

1.  *Turning on the SourceMeter:*
      - To turn on the unit press the \[Power\] round button in the left bottom corner to the on position. The SourceMeter will begin to perform self-test on its EPROM and RAM that take few seconds. Once the self-tests are passed, the firmware revision levels and the line frequency are displayed. The instrument goes to its normal display state with the output off and the "Off" message is displayed. The SourceMeter must be turned on and allowed to warm up for at least one hour to achieve accuracy.
2.  *Selecting the Current as the source:*
      - Press the \[SOURCE I\] key to select the current source. The presently programmed source value **ISRC** and compliance level **Cmpl** are displayed.
3.  *Selecting the Source Value*
      - Press \[EDIT\], the blue round button in the far left corner. You should see either **ISRC** or the **Cmpl** flashing. By pressing \[EDIT\] again you will be able to select either **ISRC** or **Cmpl**. Select **ISRC**. Note that after 6 seconds of idle time, the SourceMeter restores to its default mode. You must press \[EDIT\] again to return to the edit mode.
      - Press \[RANGE \] keys to select the range (decimal place) of the current source you wish to input.
      - To input the actual value, you have two options. One, you can use the \[EDIT \] cursor keys to place the cursor at the appropriate position and using \[SOURCE \] keys to increment the values. The other way is to use the numeric entry. When the edit mode is entered, the cursor is located on the most significant digit value. Using the number keys (displayed in blue color above the buttons) 0 through 9 key in the desired value.
      - Press \[Enter\] to activate or wait six seconds. You will exit the edit mode and the input value will be shown.
4.  *Setting the compliance limit:*  
    A compliance limit is set to protect the DUT from damaging currents and voltages. When using the I-Source, the voltage compliance is set. When using voltage as the source, the current compliance is set. Compliance defines the maximum absolute value the SourceMeter can output.
      - Press \[EDIT\] to enter the edit mode. Once again, after idle 6 seconds the edit mode times out and is cancelled. To reactivate the edit mode, press \[EDIT\] again.
      - You should see what function is selected for edit: Source **ISRC** or compliance **Cmpl**. Press \[EDIT\] to select **Cmpl**.
      - Use \[RANGE \] keys to select the range (decimal place) that will accommodate the value you want to set for the compliance.
      - Enter the desired compliance **value**. This is the same procedure as for selecting the source value. There are two ways to do it. One is to use the \[EDIT \] cursor keys to place the cursor at the appropriate position and using the \[SOURCE \] keys to increment the value. The other way is to use the numeric entry. When the edit mode is entered, the cursor is located on the most significant digit value. Using the number keys 0 through 9 key in the desired value.
      - Press \[ENTER\] or wait six seconds to exit from the edit mode.
5.  *Select measurement function and range*
      - Press \[MEAS I\] to measure the source current
6.  *Turning output on.*
      - Press the \[ON/OFF OUTPUT\] key. The red OUTPUT indicator will turn on.
7.  *Turning the unit off.*  
    It is important to turn off the SourceMeter properly in order to avoid electric shock.
      - Press the \[ON/OFF OUTPUT\] key to turn the output off. The red LED light will turn off. **It is very important that you turn the output off before turning the SourceMeter's power off\!**
      - Press the \[Power\] button to off position.

# Keithley 6514 System Electrometer Operation Instructions

The 6514 Electrometer measures voltage, current, resistance, and charge.

1.  *Turning the 6514 Electrometer on*
      - Press the \[ON\] round button located in the left bottom corner. Let the unit to warm up for at least an hour before taking precise measurements. This will ensure the accuracy of the unit's measurement.
      - Enable Zero check before making function or connection changes by pressing the \[ZCHK\] button. Zero check should always be enabled before making function or connection changes. When Zero check is enabled, the input amplifier is reconfigured to shunt the input signal to low.
2.  *Measuring Resistance*  
    *The maximum common-mode input voltage, which is the voltage between the input (HI or LO) and chassis ground, is 500V peak. Exceeding this value may create a shock hazard.*
      - Press \[Ω\] to select the resistance measurement. This automatically enables zero check.
      - Press \[GRD\] to select either Guard On or Off options. The purpose of guarding is to eliminate the effects of leakage resistance and capacitance that can exist between input HI and LO. This leakage resistance and capacitance could adversely affect high-impedance measurements. To select Guard On/Off press \[RANGE Δ/∇ \] until it is displayed On/Off. Press \[ENTER\] to activate the selection
      - Select \[AUTO RANGE\] or select the manual measurement range by using the \[RANGE Δ/∇\] keys.
      - Deselect Zero Check by pressing \[ZCHK\].
      - Connect the DUT to the electrometer.
3.  *Measuring Voltage*  
    *Note: the maximum input voltage to 6514 is 250 V peak and exceeding this value may cause damage to the instrument.*  
    *The maximum common-mode input voltage, which is the voltage between the input (HI or LO) and chassis ground, is 500V peak. Exceeding this value may create a shock hazard.*
      - Press \[ZCHK\] key to enable zero check. When on, "ZC" or "ZZ" message is displayed. It should always be enabled before making function or connection changes.
      - Press \[V\] to select the volt measurement function.
      - Press \[GRD\] to select either Guard On or Off options. The purpose of guarding is to eliminate the effects of leakage resistance and capacitance that can exist between input HI and LO. This leakage resistance and capacitance could adversely affect high-impedance measurements. To select Guard On/Off press \[RANGE Δ/∇\] until it is displayed On/Off. Press \[ENTER\] to activate the selection
      - Select \[AUTO RANGE\] or select the manual measurement range by using the \[RANGE Δ/∇\] keys.
      - Press \[ZCOR\] until the "ZZ," "ZC," or "CZ" message is displayed. Zero correct function enables to algebraically subtract the voltage offset term from the measurement. To measure voltage, we want "CZ" function enabled. The "CZ" means that the zero check is off and the zero correct is on.
      - Connect the DUT to the electrometer.
4.  *Measuring Current*  
    *Note: the maximum input current to 6514 is 21mA and exceeding this value may cause damage to the instrument.*  
    *The maximum common-mode input voltage, which is the voltage between the input (HI or LO) and chassis ground, is 500V peak. Exceeding this value may create a shock hazard.*
      - Enable Zero check by pressing \[ZCHK\] button. You should see a message displaying "ZC" or "ZZ." Zero check should always be enabled before making function or connection changes.

      - Select the amps function by pressing \[I\] key.

      - Perform Zero correction by selecting 20pA range (the lowest range) by pressing \[RANGE Δ/∇\] keys and press \[ZCOR\] until *ZZ' message is displayed. Zero correct*

      - Select \[AUTO RANGE\] or select the manual measurement range by using the \[RANGE Δ/∇\] keys.

      - Connect the DUT to the electrometer.

        *Safety shield is required whenever a hazardous voltage (\>30V) is present on the noise shield. This can occur when the test circuit is floated above earth ground at a hazardous voltage level.*
5.  *Measuring Charge*
      - Enable Zero check by pressing \[ZCHK\] button. You should see a message displaying "ZC" or "ZZ." Zero check should always be enabled before making function or connection changes.
      - Select \[AUTO RANGE\] or select the manual measurement range by using the \[RANGE Δ/∇\] keys. With auto range enabled, the instrument will auto range between HIGH range group (2μC and 20μC) or the LOW range group (20nC and 200nC). To select HIGH range group, press \[SHIFT\] and then the \[RANGE Δ\] key. To select the LOW range group, press \[SHIFT\] and then the \[RANGE ∇\] key.
      - If desired set and enable auto discharge. When enabled, auto discharge resets the charge reading to zero when the specified charge level is reached. After the integrator resets, the charge measurement process simply restarts at zero. The charge reading resets every time the specified charge level is reached. To enable auto discharge, press \[SHIFT\] and then \[AUTO-DIS\]. Use the cursor keys «» and Δ/∇ to enter a discharge level. To change range, place the cursor on the range indicator and uses the keys. Press \[ENTER\] to activate the desired level. To disable the auto discharge press \[SHIFT\] and then \[AUTO-DIS\] second time.
      - Connect the input cable to the 6514 Electrometer's open input. Make sure the test circuit is not connected to the input.
      - Disable zero check by pressing \[ZCHK\] until zero check is deselected. Press \[REL\] key to zero the display (charge may be induced on the input when the zero check is disabled). Relative nulls the offset or subtracts a baseline reading from present and future readings. When a REL value is established, subsequent readings will be the difference between the actual input and the REL value. To set Rel value, perform the following steps:
          - Display the readings you want as the REL value. This could be a zero offset reading that you want to null out, or it could be an applied level that you want to use as a baseline.
          - Press \[REL\]. The REL annunciator turns on and subsequent readings will be the difference between the actual input and the REL value.
          - To disable REL, press the \[REL\] key a second time or select a different measurement function. The REL annunciator turns off.
      - Connect the charge to be measured to the electrometer.
      - Take the charge reading from the display. If using auto discharge, use the REL key to zero the display when the integrator resets (you need to press \[REL\] twice since it was already enabled).

# LakeShore 330 Temperature Controller Operation Instructions

The 330 temperature controller is a microprocessor-based instrument with digital control of a variable current output. There are four primary sensor input types, one of which we are using: the silicon diode temperature sensor.

*Keypad Definitions:*

**\[Units\]** – lets you choose temperature in Kelvin (K) or Celsius (C). Units in K is the default selection. The additional sensor units is Volts (V). Use the key to cycle the Sample sensor units and key to cycle the Control sensor units.

**\[Baud\]** – Selects a Baud Rate of 300 or 1200 for Serial Interface. You will not need to change this value.

**\[Address\]** – selects the bus address and terminator for IEEE-488 Interface. You will not need to do anything here.

**\[Escape\]** – terminates a function without changing existing settings. To reset the unit to factory defaults press and hold both \[ESCAPE\] and \[UNITS\].

**\[Channel\]** – lets you choose what sensor to use for sample and control. Holding the \[Δ/∇\] key to cycle the Sample display between channel A or B. Holding the \[Δ/∇\] key to cycle the Control display between channel A or B. *You should not need to adjust these.*

**\[Input Type\]** – displays the currently selected sensor input type. By pressing and holding the \[Input Type\] key you should see the message "A SI" and "B SI" meaning that channel A and B Sensors are silicon diodes.

**\[Curve\]** – Selects the Channel A and B sensor response curve. To determine the currently selected curve, press \[CURVE\]. The curve for out settings should be 02.

**\[P\]** – (Proportional) – manually adjusts control loop gain term. We will not be using this.

**\[I\]** – (Integral) – manually adjusts control loop reset term. We will not be using this.

**\[D\]** – (Derivative) – manually adjusts control loop rate term. We will not be using this.

**\[Heater\]** – cycles heater display between LOW, MEDIUM, HIGH, and OFF. We will be using the HIGH setting that will give us 50W maximum power.

**\[Set Point\]** – displays or adjusts the control loop temperature setpoint. You do not need to adjust this value.

**\[Control\]** – Returns bottom display to Control sensor readouts after reading or adjusting the setpoint.

**\[Enter\]** – accepts changes made in the field display. Press and hold \[ENTER\] key to access the Power Up configuration setup display.

**\[Local\]** – switches controller between local (LOC) and remote (REM) operation. Operation in local mode does not disable the interface activity. In remote mode, the interface control and front panel keys are disabled.

**\[SoftCal\]** – improves silicon diode sensor accuracy by setting up a special modification to the Standart Curve 10. You will not be using this feauture.

**\[Auto Tune\]** – sets controller tuning to P, PI, PID, Zone, or Off. Do not worry about this value.

# LakeShore 450 Gaussmeter Operation Instructions

**Front Panel Keypad Definitions**

**Max Reset:** Works with Max Hold function. It clears the Max Hold value.

**Max Hold:** Turns Max Hold feature ON and OFF. It displays the largest field magnitude measured since the last Max Reset. Captures and displays the highest field reading. Press \[MAX HOLD\] to view the maximum value in the lower line of the display and the field reading in the upper line. Press \[MAX RESET\] key to clear reading.

**Zero Probe:** cancels out the zero offset of the probe or small magnetic fields. It is normally used in conjunction with the zero gauss chamber, but may also be used with an unshielded probe (registering the local earth magnetic field). To use, first allow the temperature of the probe and chamber to equalize; a large temperature discrepancy affects the quality of the calibration. Place tip of the probe into Zero Gauss Chamber, press \[ZERO PROBE\], then \[ENTER\]. Do not move probe while calibrating (the message on the screen will read "Calibrating"). Once the screen returns to normal display, the calibration is complete. For best results periodically zero the probe. To cancel large magnetic fields, use the Relative function.

**Select Range:** Manually selects field measurement range. Available ranges depend on which probe is installed. For manual ranging, press \[SELECT RANGE\] to view the full-scale value for the present range. Press \[SELECT RANGE\] or the \[Δ/∇\] keys to cycle through allowable full-scale ranges for the installed probe. Press \[ENTER\] to accept the new range or \[ESCAPE\] to retain the old range. Changing ranges in this way disables the Auto Range function until \[AUTO RANGE\] is pressed.

**Auto Range:** Turns Auto Range feature ON and OFF. Allows the Model 450 to automatically select field measurement range. Press \[AUTO RANGE\] or the \[Δ/∇\] keys to cycle between On and Off. Push \[ENTER\] to accept the new setting or \[ESCAPE\] to retain the old setting and return to the normal display. Do not use Auto Ranging with Peak and Max Hold operation or during small field measurement in a large background field, such as measuring a small DC field in presence of a large AC field, or vice versa.

**AC/DC:** Selects periodic AC or static DC magnetic fields. The AC selection provides the option of Peak or RMS readings. In DC operation, the display shows the DC field at the probe with sign (orientation) followed by the appropriate field units, the letters DC, displaying 4¾ digits with filter OFF or 5¾ digits with Filter ON. In AC operation, select either RMS or Peak. Both meet specified accuracy from 10 to 400 Hz. The lowest range for the type probe installed is not available in the AC Peak mode. The AC RMS reading is a measurement of true RMS, defined as the square root of the average of the square of the field function taken through one period. The RMS reading works on complex waveforms to a crest factor of 7 and rejects the DC component if it is not large enough to overload the selected range. The AC Peak readings can be used in two different ways. With \[MAX HOLD\] OFF, it measures the Peak (Crest) of a periodic, symmetrical waveform. If field change at the probe is unpredictable, the peak reading will not always show the largest field value. In this case, check monitor output with an oscilloscope to see how the reading relates to the field. With \[MAX HOLD\] ON, the Peak reading measures the amplitude of a single peak like a magnetizing pulse. It captures the reading until reset with \[MAX RESET\].

**Peak/RMS:** The AC selection provides the option of Peak or Root Mean Square (RMS) readings. Also use Peak with the Max Hold feature to measure single peaks.

**Filter:** Turns filter ON or OFF and configures filter. Filter ON enables high-resolution DC readings. The display filter function quiets the display making it more readable when the probe is exposed to a noisy field. Take care when using the filter on changing fields; it may level off peaks and slow instrument response. Users may configure the filter function to view desired field changes and block noise. The filter also quiets noise within the instrument by adding a digit of usable resolution in DC. To turn ON the display filter, press \[FILTER\]. Press \[FILTER\] or \[Δ/∇\] keys to toggle between ON and OFF. Press \[ENTER\] to accept the new setting or \[Escape\] to retain the old setting and return to the normal display. Press and hold \[FILTER\] to select Field Compensation and temperature Compensation ON or OFF.

**Gauss/Tesla:** Changes display units from Gauss to Tesla. Gauss (G) is used in the cgs system, where 1 G = 10-4 T. Tesla (T) is used in the SI system, where 1 T = 104 G. Press \[GAUSS / TESLA\] to change between the units.

**Relative Set:** lets the user see small variations in larger fields. With the relative feature turned ON, this key captures the field reading as the relative setpoint, or the user may enter a number via the keypad. Works with the Relative On/Off key.

**Relative On/Off:** Displays the positive or negative deviation from setpoint in the lower line of the display. Often used to offset large magnetic fields. May also be used with Max Hold and Alarm.

**Alarm Set:** Sets high and low alarm points. The alarm setpoints are absolute (unsigned) i.e., the positive or negative aspect of the field reading is ignored.

**Alarm On/Off:** Turns alarm feature ON or OFF. After setting high and low alarm points with Alarm Set, the alarm is activated whenever the magnetic field goes inside or outside the range defined—regardless of the sign (positive or negative) of the reading. Press and hold Alarm On/Off to turn the alarm ON or OFF and select the alarm to sound inside or outside the range.

**Local:** Selects local or remote operation. When set to Local, the unit responds to front panel controls. When set to Remote, the unit is controlled via the IEEE-488 Interface. Remote users have the option to lock out front panel controls.

**Address:** If using the IEEE-488 Interface, press this key to adjust the bus address of the Model 450 and terminators.

**Baud:** If using the Serial Interface, press this key to select the Model 450 Baud Rate from 300, 1200, or 9600.

**Analog Out:** Adjusts the scaling of the Corrected Analog Output. The default setting makes the currently selected range the maximum and minimum values corresponding to the +3 volt and –3 volt outputs. The Monitor Analog Output scaling cannot be modified.

**Escape:** Terminates a function without changing existing settings. Press and hold Escape for about 20 seconds to reset the instrument, returning many parameters to factory defaults.

Δ: Toggles between various settings shown in the display and increments a numerical display.

∇: Toggles between various settings shown in the display and decrements a numerical display.

**Enter:** Accepts changes in the field display. Press and hold Enter to access the Keypad Lock display, and enter a 3-digit code to lockout the keypad from accepting changes.
