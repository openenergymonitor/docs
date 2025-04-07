# Solid stone end-terrace, 5 kW Gen 6 Samsung

**HeatpumpMonitor.org:** [System 4](https://heatpumpmonitor.org/system/view?id=4).

This system achieved an SPF H4 of 4.4. (3.9 for hot water, 4.6 for space heating).

Key factor that made this performance possible is the **design flow temperature of 40°C** and weather compensation set to match.

This design temperature was in turn made practical by an [accurate heat loss calculation](https://docs.openenergymonitor.org/heatpumpmonitor/measured_heat_loss.html#accurate-vs-default-cibse-heat-loss-calculations) that placed the **heat loss for the house at 4.0 kW**. The main factors in the more accurate heat loss calculation were blower door test informed air change rates at 0.5 ACH, lower stone wall U-values at 1.5 W/K.m2 (SPAB report), -2 design outside temperature and assuming an occupied neighbor at 18°C. Heat loss increases to 4.3 kW with an unoccupied neighbor.

5x K2 and 3x P+ radiators combined to produce a rated output capacity of 14.7 kW.  These radiators provide 4 kW of heat output at 40°C.

A 5 kW Gen 6 Samsung heat pump was selected. This is often considered a budget heat pump, but the results from this system show that it can hold it's own against more premium brands when attached to a similar system and ran at similar temperatures.

The system is a simple **open loop**, single zone system. **Anti-freeze values** were used for freeze protection, the system was flushed well and filled with pure water + inhibitor only (no glycol).

System achieves a fractionally better than average [% of ideal Carnot COP or practical efficiency factor](https://docs.openenergymonitor.org/heatpumpmonitor/prc_carnot.html) at 49.1%. 

## Key Stats

|Property |Value|
|---|---|
|SPF H4|4.4|
|Space heating only|4.6|
|Hot water only |3.9|
|Proportion hot water|17.5%|
|||
|Measured heat loss|4.0 kW|
|Calculated heat loss|4.0 kW|
|Defrost max output|4.7 kW|
|||
|Rated output of radiators|14.7 kW|
|||
|Weighed average flow temperature|33.1°C|
|Weighted average flow minus outside temperature|25.3°K|
|Weighted average outside temperature|7.8°C|
|Weighted average % carnot |49.1%|
|||
|Design flow temperature|40°C|
|Design outside temperature |-2°C|
|||
|Mean flow temp on coldest day |33.9°C|
|Max flow temp on coldest day |35.4°C|
|Outside temperature|-1.8°C|
|Internal temperature coldest day|19.5°C|

## Default CIBSE comparison

*The [default CIBSE heat loss](https://docs.openenergymonitor.org/heatpumpmonitor/measured_heat_loss.html#accurate-vs-default-cibse-heat-loss-calculations) for this property would have been ~7.6 kW (A combination of CIBSE category A air change rates, lower design outside temperature and unoccupied neighbors). More often than not this would result in a 10 kW heat pump being installed, 2.5x the actual heat loss.*

*The system would have likely been designed to a design flow temperature of 50°C, which as is often the case would have resulted in roughly the same size radiators being upgraded/installed (50°C needed to output 7.6 kW rather than 40°C for 4 kW). Had weather comp been set to match the higher design calculation the potential performance benefit of those rads would not have been realised.*