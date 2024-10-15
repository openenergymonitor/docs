# OpenEVSE Kit Build Guide

OpenEVSE is a fully open-source EVSE (Electric Vehicle Supply Equipment) charging station designed by [OpenEVSE](http://openevse.com) and sold in the [OpenEVSE Shop](https://store.openevse.com/collections/all-products).

![Nissan LEAF OpenEVSE](img/openevse-banner.png)

OpenEnergyMonitor has collaborated with OpenEVSE to improve energy monitoring integration and control as well as tailoring the setup for use in Europe and the UK. This page provides **European specific** build and setup instructions.

---

## Assembly

**This build guide is for OpenEVSE kits purchased via the [OpenEVSE Shop](https://store.openevse.com/collections/all-products).**

```{image} img/ev-charging/evse-build/evse-build-0.png.jpg
:width: 100%
```

**Step 1**

```{image} img/ev-charging/evse-build/evse-build-1.png.jpg
:width: 200px
:align: left
```

- Check kit contents
- Note: cable glands and base-plate are inside the enclosure in the photo

<div style="clear:both"></div>

**Step 2**

```{image} img/ev-charging/evse-build/evse-build-2.png.jpg
:width: 200px
:align: left
```

- Check screws and fastners
- *Note: there may be spare screws included*

<div style="clear:both"></div>

**Step 3**

```{image} img/ev-charging/evse-build/evse-build-3.png.jpg
:width: 200px
:align: left
```

- Screw contactor to base plate using FOUR self-tapping screws
- Mount the FOUR 10mm standoffs to the top side of the plate with FOUR M2.5 x 6 mm screws
- Mount Earth bar to the plate with ONE 1/4" self tapping screws<br>Mount plate in enclosure with SIX coarse threaded 6mm screws

<div style="clear:both"></div>

**Step 4**

```{image} img/oem-ev-cable-wire.jpg
:width: 200px
:align: left
```

EV cable wiring

<div style="clear:both"></div>

```{image} img/crimped-evse-wire.png
:width: 200px
:align: left
```

**Bootlace ferrules crimped terminals should be used for EV cable connections.** This fine stranded wire is susceptible to creeping out of a terminal due to thermal cycling resulting in possible overheating

<div style="clear:both"></div>

```{image} img/ev-charging/evse-build/evse-build-4.png.jpg
:width: 200px
:align: left
```

- Install the TWO cable glands
- Insert EV Cable through the Cable Gland on the right and tighten
- Connect the ground wire to the ground block
- Thread **BOTH** Line and Neutral wires through the 4 wire GFCI coil with the orange self test loop (do NOT thread the Earth wire through)
- Thread **EITHER** Line OR Neutral through the Current Measurement Coil

<div style="clear:both"></div>

**Step 5**

```{image} img/ev-charging/evse-build/evse-build-5.png.jpg
:width: 200px
:align: left
```

- Connect the controller harness to the contactor

<div style="clear:both"></div>

**Step 6**

```{image} img/ev-charging/evse-build/evse-build-6.png.jpg
:width: 200px
:align: left
```

- Install the OpenEVSE controller
- Connect the pilot wire to the controller
- Connect the controller harness to the controller
- Connect the GFCI coil and the Current measurement coil to the controller

<div style="clear:both"></div>

**Step 7**

```{image} img/ev-charging/evse-build/evse-build-7.png.jpg
:width: 200px
:align: left
```

- Screw the LCD to the enclosure lid using self tapping screws
- Stick the touch button and WiFi module to the enclosure lid using double sided sticky tape. *On current models the touch button has been substituted for a physical push button*

<div style="clear:both"></div>

**Step 8**

```{image} img/ev-charging/evse-build/evse-build-8.png.jpg
:width: 200px
:align: left
```

- Use zip ties to tidy up the cables
- Ensure low voltage cables are routed away from 230V connections

<div style="clear:both"></div>

**Step 9**

```{image} img/ev-charging/evse-build/evse-build-9.png.jpg
:width: 200px
:align: left
```

- Once the EVSE has been assembled it can be tested
- See [Testing OpenEVSE](https://openevse.dozuki.com/Guide/Testing+Basic+and+Advanced/12)
- An [EV Simulator Kit](https://shop.openenergymonitor.com/ev-simulator-kit/) useful for testing

<div style="clear:both"></div>


##  Supply Connection

```{warning}
Mains supply connection should only be undertaken by a qualified electrician.
```

*The following is recommendation for a typical domestic installation in the UK:*

The EVSE should be installed by a competent electrician in accordance with BS7671:2018+A2:2022 (18th edition) and IET code of practice.

The EVSE requires:
 
- Dedicated circuit 
- RCD: dual-pole **Type-B RCD with 6mA DC leakage protection** e.g [Chint NL210](https://shop.openenergymonitor.com/type-b-rcd-1p-n-chint-nl210-63-263-30/
), Proteus 63/2/30B 
      
- MCB: **32A Curve B MCB** overcurrent protection (40A MCB can be used providing disconnecting time requirements are met) 
  
- EVSE should be earthed in accordance with BS7671:2018+A1:2020. 
- Earth rod* or CPC disconnection / O-PEN detection device e.g Matt-e unit should be used when applicable**. 
- **PME earth facility shall not be used as means of earthing if EVSE is connected to an EV located outdoors**. See BS7671:2018+A2:2022 Section 722.411.4.1
  
- All terminals should be checked for correct tightness upon final installation

*Earth-rod impedance must be <150Ω for reliable charging of all vehicle types (this exceeds the 200 Ω requirement of BS7671).

**It’s possible to obtain RCD, MCB and O-PEN protection in a single unit e.g Matt:e SP-EVCP-B or Garo G8EV40PMEB

---

## User Guide

Once the hardware is up and running see our [OpenEVSE Software User Guide](https://docs.openenergymonitor.org/emonevse/setup.html)

## Safety

OpenEVSE units have been designed to exceed the safety requirements for EV Charging Stations from SAE J1772, NEC, UL and CE. Before supplying power to the car (and continuously while charging) the EVSE unit conducts a number of checks, no power is supplied until all the checks have passed. See

- [OpenEVSE Safety Features](https://openev.freshdesk.com/support/solutions/articles/6000113537-openevse-safety-features)
- [OpenEVSE Safety Features Flow Diagram (.pdf)](img/OpenEVSE_flowchart.pdf)
