# Heat Pump Monitoring

The OpenEnergyMonitor system can be used to monitor the performance of heat pumps. The following covers a number of different configurations of the system from basic to more advanced monitoring.

[**Purchase Level 3 Heat Pump Monitoring Bundle**](https://shop.openenergymonitor.com/level-3-heat-pump-monitoring-bundle/)

![HeatpumpMonitoring](img/heatpump/hpdata.png)

## Level 1 (no COP): Electricity Consumption:

```{image} img/heatpump/config/hpmon_config_emonpi_ct_only.png
:width: 300px
:align: right
```

At a basic level it is possible to use either the EmonTx or the EmonPi to monitor the electrical consumption of a heat pump by clipping a CT sensor around the supply to the unit. This provides detailed 10s resolution power consumption graphs as well as cumulative energy consumption in kWh on a daily/monthly/annual basis. It's possible to use the power graphs to gain a basic insight into potential issues such as excessive cycling.

To install an emonTx4, emonTx3 or emonPi follow the general setup guides here, clip the CT sensor around either the insulated line or neutral cable for the heat pump rather than the whole house cable.

- [Install emonTx4](../emontx4/emontx4_emonbase_install.md)
- [Install emonTx3 & emonBase](../emontx3/install.md)
- [Install emonTx3 & ESP8266](../emontx3/esp8266.md)
- [Install emonPi](../emonpi/install.md)

It is also possible to measure the electricity consumption with higher accuracy using a pulse output from an electricity meter or modbus output from an SDM120 DIN rail mounted meter.

- [+ Add Pulse Counting](../emontx4/other_sensors.md)
- [Reading from a Modbus SDM120 electricity meter using emonPi/emonBase](https://docs.openenergymonitor.org/emonhub/emonhub-interfacers.html#reading-from-a-sdm120-single-phase-meter)
- [Reading from electricity meters that support MBUS](https://docs.openenergymonitor.org/emonhub/emonhub-interfacers.html#m-bus-reader-for-electric-and-heat-meters)

```{image} img/heatpump/config/hpmon_config_emonpi_ct_temps.png
:width: 300px
:align: right
```

## Level 2 (no COP): System temperatures:

Since the performance of a heat pump is greatly affected by the working temperatures, it is very useful to monitor the following system temperatures:

1. The water flow and return temperature from the heat pump unit.
2. For air-source heat pumps: The outside air temperature.
3. For ground-source heat pumps: The source inlet and outlet temperatures.
4. The hot water cylinder temperature (top and bottom).

The EmonTx and EmonPi units both support temperature sensing using one-wire DS18B20 temperature sensors, see the following setup guide for examples of how to connect up temperature sensors:

- [EmonTx4 heat pump monitor guide](../emontx4/heatpumpmonitor.md)
- [EmonTx4 temperature sensing](../emontx4/other_sensors.md)
- [EmonTx3 temperature sensing](../emontx3/install.md)
- [EmonPi temperature sensing](../emonpi/temperature_sensing.md)

*The theoretical performance of a heat pump is given by the Carnot COP equation, see [Github: A very simple heat pump model](https://github.com/emoncms/dynamic/blob/master/docs/heatpumpmodel.md). For an air-source heatpump measuring the water flow temperature and the outside air temperature can be used to estimate the expected COP. Many heat pumps provide an indication of expected COP at different ambient air and water temperatures in their datasheets. The Emoncms heat pump app includes a tool to estimate COP using this equation.*

## Level 3 (COP): Flow rate & Heat metering:

[**Purchase Level 3 Heat Pump Monitoring Bundle**](https://shop.openenergymonitor.com/level-3-heat-pump-monitoring-bundle/)

```{image} img/heatpump/config/hpmon_config_emonpi_ct_mbus.png
:width: 300px
:align: right
```

The COP of a heat pump can be measured by measuring the heat output in addition to the electrical input. This can be done by either interfacing with a heat meter using MBUS (e.g: Sharky 775, Sontex superstatic 440, Kamstrup 403 or Qalcosonic E3) or a pulse counter, or a flow meter with an analog voltage output (Grundfos or Sika Vortex Flow Meter).

- A heat meter with a pulse output can be connected to either the EmonTx or the EmonPi, see:<br> [+ Add Pulse Counting](../emontx4/other_sensors.md)
<!--- Using the analog input on a EmonTx or EmonPi to interface with an analog voltage output from a Grundfos or Sika Vortex Flow Meter-->
- Using our [MBUS to USB](https://shop.openenergymonitor.com/m-bus-to-usb-converter/) reader that plugs into a EmonPi or EmonBase. Setup and emonhub interfacer configuration documentation is available here: [MBUS Reader for Electric and Heat meters](https://docs.openenergymonitor.org/emonhub/emonhub-interfacers.html#m-bus-reader-for-electric-and-heat-meters).
- [Reading from a Modbus SDM120 electricity meter using emonPi/emonBase](https://docs.openenergymonitor.org/emonhub/emonhub-interfacers.html#reading-from-a-sdm120-single-phase-meter)
- Please read our guide on selecting the right heat meter, available in our heat pump monitor github repository here: [Github: Guide to selecting the right heat meter](https://github.com/openenergymonitor/HeatpumpMonitor/blob/master/selectingheatmeter.md)

## RaspberryPi HAT

In addition to configurations using our standard emonPi and emonTx monitoring hardware. We have also developed dedicated hardware designs with heat pump monitoring in mind. 

```{image} img/heatpump/pimbusreader.jpeg
:width: 300px
:align: right
```

This is a RaspberryPi HAT designed with heat pump monitoring in mind. It can interface with heat meters via MBUS and Modbus support for reading from SDM120 electricity meters can be added via a [Modbus USB adaptor](https://shop.openenergymonitor.com/modbus-rs485-to-usb-adaptor/). It has a RaspberryPi at it's core running our [emonSD image](https://shop.openenergymonitor.com/emonsd-industrial-pre-loaded-sd-card/) enabling local or/and remote logging and data visualisation.<br>
- [Github Documentation & Hardware Design](https://github.com/openenergymonitor/HeatpumpMonitor/tree/master/HeatpumpMonitorPi)
- [Purchase kit from OpenEnergyMonitor shop](https://shop.openenergymonitor.com/mbus-temperature-raspberrypi-hat-heatpump-monitoring/)


## My Heatpump dashboard

Emoncms includes an application specific heat pump dashboard available in the Apps module. The following video gives a good overview of what this dashboard can do, how to access daily electricity consumption and heat output data as well as detailed system temperature and power data.

There's also a little feature shown briefly at the end that simulates the heat output and COP of the heat pump based on the Carnot COP equation.

<div class='videoWrapper'>
<iframe width="560" height="315" src="https://www.youtube.com/embed/jBY1Sx3LR2o" frameborder="0" allowfullscreen></iframe>
</div>

It's also worth checking out David Bowen (@MyForest) heat pump app, see community forum post: [Heat Pump Experimentation App - Release News](https://community.openenergymonitor.org/t/heat-pump-experimentation-app-release-news/13423).

## Configurations

As discussed above, there are a number of different hardware configurations that can be used for heat pump monitoring. The following gives a quick overview of the main options.

<style>
#heatpump table { border-collapse: collapse; }
#heatpump table, th, td {
  border: 1px solid #ccc;
  padding:10px;
}
#heatpump ul {
margin-left:15px;
font-size:14px;
}
</style>

<table id="heatpump">
<tr>
<td>
<div style="margin-bottom:5px"><b>Level 2 (no COP)</b></div>
<div style="margin-bottom:5px"><b>EmonPi: Electric & Temperature</b></div>

<img src="img/heatpump/config/hpmon_config_emonpi_ct_temps.png" style="max-width:320px; padding:10px">

</td>
<td>
<ul>
<li>Easy installation on existing system.</li>
<li>Monitor electricity consumption and system temperatures.</li>
<li>Wifi or Ethernet connectivity.</li>
<li>EmonPi LCD makes setup easier.</li>
<li>Option to store and access data locally.</li>
</ul>
</td>
</tr>
<tr>
<td>
<div style="margin-bottom:5px"><b>Level 2 (no COP)</b></div>
<div style="margin-bottom:5px"><b>EmonTx WiFi: Electric & Temperature</b></div>

<img src="img/heatpump/config/hpmon_config_emontx_wifi_ct_temps.png" style="max-width:320px; padding:10px">

</td>
<td>
<ul>
<li>Easy installation on existing system.</li>
<li>Monitor electricity consumption and system temperatures.</li>
<li>Wifi connectivity.</li>
<li>Requires cloud / remote server data storage.</li>
<li>Lowest cost of hardware.</li>
</ul>
</td>
</tr>
<tr>
<td>
<div style="margin-bottom:5px"><b>Level 2 (no COP)</b></div>
<div style="margin-bottom:5px"><b>EmonTx + EmonBase: Electric & Temperature</b></div>

<img src="img/heatpump/config/hpmon_config_emontx_emonbase_ct_temps.png" style="max-width:320px; padding:10px">

</td>
<td>
<ul>
<li>Easy installation on existing system.</li>
<li>Monitor electricity consumption and system temperatures.</li>
<li>Wifi or Ethernet connectivity.</li>
<li>Option to store and access data locally on the emonBase.</li>
<li>433 MHz radio link between EmonTx and EmonBase</li>
</ul>
</td>
</tr>
<tr>
<td>
<div style="margin-bottom:5px"><b>Level 3 (COP)</b></div>
<div style="margin-bottom:5px"><b>EmonPi with MBUS Reader for heat meter</b></div>

<img src="img/heatpump/config/hpmon_config_emonpi_ct_mbus.png" style="max-width:320px; padding:10px">

</td>
<td>
<ul>
<li>Requires in-line installation of heat meter.</li>
<li>Monitor electricity consumption, system temperatures and heat output.</li>
<li>Accurate COP using heat and electricity measurements.</li>     
<li>Wifi or Ethernet connectivity.</li>
<li>EmonPi LCD makes setup easier.</li>
<li>Option to store and access data locally or remote.</li>
</ul>
</td>
</tr>
<tr>
<td>
<div style="margin-bottom:5px"><b>Level 3 (COP)</b></div>
<div style="margin-bottom:5px"><b>EmonPi with MBUS Reader</b></div>

<img src="img/heatpump/config/hpmon_config_emonpi_mbus.png" style="max-width:320px; padding:10px">

</td>
<td>
<ul>
<li>High accuracy electricity and heat monitoring.</li>
<li>Requires in-line installation of electric and heat meter.</li>
<li>Monitor electricity consumption, system temperatures and heat output.</li>
<li>Accurate COP using heat and electricity measurements.</li>   
<li>Wifi or Ethernet connectivity.</li>
<li>EmonPi LCD makes setup easier.</li>
<li>Option to store and access data locally or remote.</li>
<li>Note: Modbus recommended for reading from SDM120 electric meters (Seperate Modbus reader required).</li>
</ul>
</td>
</tr>
<tr>
<td>
<div style="margin-bottom:5px"><b>Level 3 (COP)</b></div>
<div style="margin-bottom:5px"><b>RaspberryPi & MBUS based heat pump monitor</b></div>

<img src="img/heatpump/config/hpmon_config_hpmonpi.png" style="max-width:320px; padding:10px">

<br><br>
</td>
<td>
<ul>
<li>High accuracy electricity and heat monitoring.</li>
<li>Requires in-line installation of electric and heat meter.</li>
<li>Monitor electricity consumption, system temperatures and heat output.</li>
<li>Accurate COP using heat and electricity measurements.</li>  
<li>Option to store and access data locally or remote.</li>
<li>Slightly lower cost than EmonPi with external MBUS reader option.</li> 
<li>Note: Modbus recommended for reading from SDM120 electric meters (Seperate Modbus reader required).</li>
<li><a href="https://shop.openenergymonitor.com/level-3-heat-pump-monitoring-bundle">Purchase Level 3 Heat Pump Monitoring Bundle</a></li>
</ul>
</td>
</tr>
</table>




