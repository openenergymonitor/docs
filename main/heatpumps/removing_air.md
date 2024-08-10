# Removing Air from Heating Systems

Effectively removing trapped and dissolved air from a sealed heating system is crucial for ensuring the system's efficiency, the accurate functioning of heat meters, and its longevity.

## During Design / Installation

To maximize the effectiveness of air removal:

- **Install Automatic Air Vents (AAVs):** Place AAVs at the highest points of the primary pipework on the flow, return, and domestic hot water (DHW) coil.
- **Fit a Deaerator:** Install a deaerator such as a Spirovent on the primary flow line, ideally before the circulator pump.
- **Avoid Dead Legs:** Design pipework to eliminate dead legs and avoid creating areas where air could become trapped.

## During Commissioning

Follow these steps to ensure all air is effectively purged from the system:

1. **Fill the System:** Use the filling loop to fill the system, keeping all AAVs open and bleed all radiators.
2. **Increase System Pressure:** Raise and maintain the system pressure as high as possible, ideally up to 2.8 bar. This will compress air pockets into the smallest possible space.
3. **Enable the Circulator Pump Air Purge/Vent Cycle:**
   - Engage the purge cycle (if available) to pulse the circulator pump, helping move trapped air pockets through the system. This option is usually found on the circulator pump itself or on the heat pump controller [1].
   - If an automatic purge cycle isn't available, manually switch the pump to maximum power, then off repeatedly to achieve a similar effect.
4. **Open All Valves:** Ensure all radiator valves are fully open and switch the diverter valve between space heating and DHW modes.
5. **Bleed Radiators Again:** Keep the AAVs open and bleed the radiators again during this process; top up pressure if required to maintain a high pressure, ideally 2.8 bar.
6. **Purge by Zones:** If dealing with a large system or suboptimal pipe layout (e.g., ceiling drops, loops), consider purging each zone or radiator leg individually to increase flow velocity through the system.
7. **Conduct a Low Pressure 'Cook-Off':**
   - **Reduce Pressure:** Lower system pressure to 0.7 bar; water under lower pressure can dissolve less gas.
   - **Heat the System:** Set the heat pump to its maximum output to raise the system's temperature as high as possible [2]. Hot liquids dissolve less gas.
   - **Run for 1 Hour:** Operate the system at maximum temperature for about an hour with AAVs open.
   - **Restore Working Pressure:** Top the pressure back up to the normal working range of 1.5-2 bar.

## After Commissioning

- **Close the AAVs:** Once commissioning is complete, close the AAVs.
- **Customer Advice:** Advise the customer to periodically open the AAVs and attempt to bleed the highest radiators during the first few months of operation to ensure any residual air is removed.

## Troubleshooting

If air is still a problem:

- **Consider using a vacuum degasser:** This equipment is commonly used to remove air from commercial heating systems.
- **Consider filling with demineralised water:** Ensure the correct pH for your system. This has lower conductivity and will prevent hydrogen release. See: [Heating Water Treatment Explained (VDI 2035)](https://www.heatgeek.com/heating-water-treatment-explained-vdi-2035).

## About this Guidance

The above guidance was written by OpenEnergyMonitor in collaboration with [Heat Geek](https://www.heatgeek.com/) and [MeterPoint](https://meterpoint.com/).

We’d love to hear from you! If you have any suggestions, tips, or feedback on the best methods for removing air from heating systems, please reach out.

***

[1]: On a Vaillant Arothem+ the purge cycle setting is available on the VWZ AI controller under settings: `Installer Level (code 17) > Test Menu > Check Programmes > P.06 Purge Building Circuit`.

[2]: There are various methods to force a heat pump to run at max output. Some units have a test program, while others need to be set to either max fixed-flow temperature or set weather compensation and indoor set point set to maximum. You may also need to adjust the Outside Threshold (OT) temperature to force the HP to run at maximum even if it’s hot outside. Another method is to trigger a DHW cycle with the diverter valve unplugged and Eco mode disabled to force the HP to output maximum temperature into the heating circuit.
