# Design Recommendations

- To achieve high-end performance (SPF ≥ 4.0), HeatpumpMonitor.org results indicate that actual average flow temperatures during design conditions of 36.6°C ± 5.5°C are required [[1]](https://docs.openenergymonitor.org/heatpumpmonitor/low_temperature.html#good-performance-lower-average-design-flow-temperatures-than-we-think). For the purpose of easier communication this could be simplified to a rule of thumb to target design flow temperatures of no more than 42°C and ideally closer to 37°C.

- To achieve moderate-high performance (SPF ~3.5), HeatpumpMonitor.org results indicate that actual average flow temperatures during design conditions of 39.5°C ± 5.5°C are required [[1]](https://docs.openenergymonitor.org/heatpumpmonitor/low_temperature.html#good-performance-lower-average-design-flow-temperatures-than-we-think). Again for the purpose of easier communication this could be simplified to a rule of thumb to target design flow temperatures of no more than 45°C and ideally closer to 40°C.

- The use of accurate heat loss calculations makes it easier to design for lower flow temperatures and helps to prevent excessive oversizing (i.e. heat pump capacities two to three times greater than required). When adopting more precise heat loss assessment methods—such as air-permeability testing together with the EN 12831-1:2017 calculation method [[2]](https://docs.openenergymonitor.org/heatpumps/air_change_rate_calculations.html)— the following considerations should be addressed:

    - In designs where more accurate heat loss calculations result in lower heat loss figures, lower the default design flow temperatures instead of reducing emitter capacities. In practice, designs that previously required 45–50°C design flow temperatures (with over-estimated heat loss) for a given emitter design can now often only require 35–40°C with more accurate heat loss input assumptions [[3]](https://openenergymonitor.org/tools/SimpleHeatLoss.html), without changing radiator sizing. This is especially relevant for older pre-2000 properties.

    - Adding a reasonable margin (~1.2-1.5x) on an accurate heat loss seems to work fine for heat pumps that handle mild weather cycling well [[4]](https://docs.openenergymonitor.org/heatpumpmonitor/oversizing.html) and may actually be preferable, especially given max output defrost issues [[5]](https://docs.openenergymonitor.org/heatpumpmonitor/max_output_testing.html).

- Careful commissioning and adjustment of heat pump settings such as weather compensation to reflect actual building heat loss is key for ensuring that the best performance for a given system is achieved [[6]](https://docs.openenergymonitor.org/heatpumpmonitor/eoh.html#sub-optimal-weather-compensation-issue). 3rd party or integrated
optimisers can help automate this process.


**General recommendations**

- Design for open loop with no zoning, TRV's on max or high temperature cutoff only.

- Try to minimise the amount of setback on heating schedules e.g keep daytime and nightime room target temperatures fairly close e.g 18-19C setback, 20C afternoon/evening.
