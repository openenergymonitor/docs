# Troubleshooting

There are a number of factors that can negatively affect the performance of a heat pump. It's worth taking a systematic approach when trying to diagnose poor performance, which may manifest as either high running costs, low indoor temperatures or perhaps both together!? 

**A whole system approach:** A heat pump system's performance usually depends more on the overall system design than the heat pump unit itself and so when trying to understand and diagnose issues with a system it makes a big difference to have an understanding of all the different parts that make up the system.

- Control strategy, zoning and TRV's
- Heat loss calculation, is HP correctly sized? 
- Radiators or underfloor heating design
- Low loss headers, buffers 

## Checklist

- Design heat loss for the whole building
- Heat pump rated output at design outside temperature
- Design heat requirement for each room
- Radiator or underfloor heating design for each room


## 1. Control strategy, zoning and TRV's

One of the more usual reason for poor performance is just poorly setup controls. Luckily this is also the least expensive to fix and often easiest to adjust.

**Are your radiators hot to the touch?**<br>
We would define hot here as above 45°C during average UK January temperatures of around 6°C outside. A well performing system will typically have radiators running at closer to 35°C during these conditions. 

**Room thermostats, TRV's and zoning**<br>



## 2. Heat loss calculation, is the heat pump correctly sized?

As a basic starting point it's worthwhile checking that the heat pump is correctly sized for the heat loss of the building. A room by room heat loss calculation is usually performed as part of system design (in the UK following the BS EN 12831:2003 standard), you should be able to obtain these calculations from your installer if you do not have them already.

This should give a maximum heat loss figure for the whole house at a combination of standard internal temperatures and the design outside temperature. It should also give the heat requirement for each room in the house, which is used for sizing radiators and underfloor heating circuits (also often called heat emitters).

The design outside temperature required can vary significantly from location to location and it's worth checking the design temperature used for your calculation. 

Heat loss calculations are difficult to do well and the assumptions around how insulative different materials are alongside how air-tight a building is makes for quite large errors bars on the calculated results. It's worth bearing this in mind, see the calculated figures as indications and a useful guide, dont get too held up on the precision.

**Over-sizing and under-sizing:** It's worth noting that there are several factors that make it favourable to not over-size a heat pump, perhaps specifying a heat pump with quite a tight margin to the calculated design heat loss. When this is done right the overall system performance appears to be better over the full heating season, but it can also cause issues during cold spells that go below the design temperature or if defrosts reduce the average heat pump output below that suggested in the heat pumps datasheet. A topic that is worthwhile exploring in more detail.

**DIY heat loss calculation:** It's certainly a useful exercise to improve understanding to do your own heat loss calculation. There are several tools that can help you do this:

- [MCS heat pump design spreadsheet](https://trystanlea.org.uk/roombyroomheatloss)
- [heatloss.js](https://openenergymonitor.org/heatlossjs)
- [Heat punk by Midsummer wholesale](https://heatpunk.co.uk/home)
- [Heat engineer software](https://www.heat-engineer.com)

**Measured heat loss:** Another approach that can complement a heat loss calculation is to use internal temperature measurements, outdoor weather data, electricity and heating consumption data together to estimate the heat loss of a building experimentally.

- A basic physics approach
- Product: [Build test solutions measured thermal performance and SmartHTC.](https://www.buildtestsolutions.com/)

## 3. Radiators or underfloor heating 

The next thing to check is the radiator or/and underfloor heating design for each room. It's important to check the mean water temperature and then flow temperature required to obtain the designed heat requirement for each room.

**Example:** The room by room heat loss calculation indicates that a room has a heat loss of 750W at an internal temperature of 20C and outside temperature of -3C. A 1200mm x 600mm K2 double panel radiator has been fitted which has a rated output of 2112W at DT50. What is the mean water temperature required to output 750W?

    Delta_T = (Heat_output / Rated_Heat_Output)^(1/1.3) x Rated_Delta_T
    Delta_T = (750W / 2112W)^(1/1.3) x 50K = 22.5K
    
    Mean water temperature (MWT) = Room temperature + Delta_T
    MWT = 20°C + 22.5K = 42.5°C
    
The flow temperature that results from this depends on the DT between the flow and return. Heat pumps typically target a DT of 5K. Some heat pumps vary the pump speed to target a particular DT. Others have a fixed pump speed and varying DT. If we assume a DT of 5K we can work out that the flow temperature should in this example should be:
    
    flow temperature = MWT + 5K/2 = 45°C

This flow temperature at an outside temperature of -3°C will give a COP of ~2.9. At more normal UK January temperatures the heat requirement for the room will drop, this allows us to drop the flow temperature using a weather compensation curve to 39.6°C, the resulting COP should be ~3.8.

A radiator system designed to run with a flow temperature at 45°C at the design outside temperature ~ -3°C seems to be quite typical for installations in the UK. Some systems are designed to run hotter at up to 50°C and others cooler at around 40°C. A system is more likely to perform well if it has been designed to run at lower temperatures.




