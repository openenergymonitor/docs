# Low flow temperature = High performance

## Weighted by heat output average flow minus outside temperature

The best correlation with performance on HeatpumpMonitor.org is weighted by heat output average flow minus outside temperature [[Open chart]](https://heatpumpmonitor.org/?chart=1&selected_xaxis=weighted_flowT_minus_outsideT&selected_color=weighted_prc_carnot&filter=query:hp_type:air&minDays=290). This is the expected result of course, given the [Carnot COP equation](https://docs.openenergymonitor.org/heatpumps/basics.html#carnot-cop-equation), but it is nice to have the theory confirmed!

This chart indicates that systems that achieve SPF 4 or above deliver most of their heat at a *flow - outside* temperature of 27°C ±3°C. The average outside temperature is around 6-8°C and so this relates to a flow temperature of around 34°C.

*There is clearly a wide range of values above and below the line of best fit and the reasons for this variation is more difficult to pin down. See page about the [practical efficiency factor](prc_carnot) for further discussion.*

![image](img/weighted_flow_minus_outside.png)


## Weighted by heat output average flow temperature

It is also possible to plot weighted by heat output average flow temperature vs performance directly [[Open chart]](https://heatpumpmonitor.org/?chart=1&selected_xaxis=weighted_flowT&selected_color=weighted_prc_carnot&filter=query:hp_type:air&minDays=290). While the correlation is slightly less strong, it is an easier chart to read:

- SPF 4.0+ systems deliver most heat at approximately 34°C ± 3°C.
- SPF 3.5+ systems deliver most heat at approximately 37°C ± 4°C.

![image](img/weighted_flow.png)

## Good performance = lower average design flow temperatures .. than we think!?

It's also possible to look at the coldest day [[Open chart]](https://heatpumpmonitor.org/?chart=1&selected_xaxis=measured_mean_flow_temp_coldest_day&selected_color=weighted_flowT&filter=query:hp_type:air&minDays=290), which should if close to design conditions, indicate the flow temperatures that systems actually need to run at during these conditions. These can be compared with with expectations from the design calculations.

While the correlation with performance is relatively poor here, it is interesting that a lot of the systems that are achieving SPF 4.0+ over a full year are running at relatively low flow temperatures when at or close to design conditions. 

- SPF 4.0+ systems have coldest day average flow temperatures of 34°C ±6°C.
- SPF 3.5+ systems have coldest day average flow temperatures of 39°C ±6°C.

![image](img/mean_flow_coldest_day.png)

It's worth clicking through to a few of these systems to see how they run on the coldest days:  

- **System 68:** 10 kW Viessmann, SPF 5.0, [Average flow temp when running: 33°C (Max: 36°C)](https://emoncms.org/app/view?name=viessmann_combined&readkey=d9fa0b89bb710d76148a53d979624a2f&mode=power&start=1736380800&end=1736467200)<br>*Room temperature 19.0°C (19.4°C in the evening). Outside temperature: -3.2°C. Design flow temperature: 40°C.*

- **System 278:** 10 kW Vaillant, SPF 4.8, [Average flow temp when running: 33°C (Max 35.5C)](https://emoncms.org/app/view?name=MyHeatpump&readkey=5f77aee3a3079c38a1f7e2d4c20d4443&mode=power&start=1736467200&end=1736553600).<br>*Room temperature 19.4°C (20°C in the evening). Outside temperature: -2°C. Design flow temperature: 43°C.*

- **System 53:** 5 kW Vaillant, SPF 4.5, [Average flow temp when running: 31.3°C (Max 36C)](https://emoncms.org/app/view?name=MyHeatpump&readkey=1548bb92f8413211bb7c36cfa154ac94&mode=power&start=1736467200&end=1736553600)<br>*Room temperature 19.8°C (20.8°C in the evening). Outside temperature: -0.6°C. Design flow temperature: 35°C.*

## Calculated design flow temperature vs measured flow temperature on coldest day

Comparing the stated design flow temperature of each system with the actual average flow temperature when running on the coldest day [[Open chart]](https://heatpumpmonitor.org/?chart=1&selected_xaxis=flow_temp&selected_color=combined_cop&filter=query:hp_type:air&minDays=290&selected_yaxis=measured_mean_flow_temp_coldest_day), we can see that most systems operate at lower flow temperatures than those calculated in their heat loss design calculations: 

- Systems designed for 35°C are those that run closest to their design temperature.
- Systems designed for 40°C run typically closer ~36°C (with wide spread of values).
- Systems designed for 45°C run typically closer ~38°C (with wide spread of values).
- Systems designed for 50°C run typically closer ~40-42°C (again with wide spread of values).

![image](img/design_vs_measured_flow_temp.png)

A part of this gap, for some systems, between design an measured coldest day mean flow temperature will be due to the measured coldest day not quite matching the design conditions, e.g lower average internal temperature and/or higher average outside temperature. This does not however appear to explain most of the difference.

The following chart shows the measured conditions on the coldest day vs the difference between the design flow temperature and measured flow temperature. While the extremes do show an effect, there is significant variation (Difference up to ~15°C, typically 0-10C°C lower measured flow temp) for systems that are close to design temperature (DT: 20-24K):

![image](img/design_vs_measured_conditions.png)

The fact that many systems operate at lower-than-design flow temperatures aligns with our understanding that the assumptions used in heat loss calculations often overestimate heat loss.

As a result, after tuning weather compensation settings to reflect actual demand, these systems can run at lower flow temperatures.