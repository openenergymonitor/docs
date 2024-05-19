<a class="btn" href="https://shop.openenergymonitor.com/energy-monitoring/">Buy in Shop</a>

# Home Energy Monitoring

The OpenEnergyMonitor system can be used as a simple home energy monitoring system for understanding energy consumption.

- View and explore real-time power and daily energy consumption in kWh.
- MyElectric is a web app which runs on [Emoncms](https://Emoncms.org). 
- MyElectric is also available as a native [Android app](https://play.google.com/store/apps/details?id=org.emoncms.myapps&utm_source=global_co&utm_medium=prtnr&utm_content=Mar2515&utm_campaign=PartBadge&pcampaignid=MKT-Other-global-all-co-prtnr-py-PartBadge-Mar2515-1)

![MyElectric](img/home-energy/home-energy-front-emonpi2.jpg)

## 1. Hardware

Please follow the hardware installation guides here to get started:

- [emonPi2](../emonpi2/install.md)
- [emonTx4](../emontx4/emontx4_emonbase_install.md)

## 2. Emoncms Feed Setup

See [Emoncms > Log Local](../emoncms/intro-rpi.md) section of the setup guide.

For automatic MyElectric App setup use the suggested feed names below. **The names are case sensitive.**

**Assuming CT1 (P1) = site-consumption**

 1. Click on spanner icon to configure `emonPi2/P1`.
 2. Select `log to feed` and create a feed called `use` with the feed engine set to PHPFina and feed `interval=10s`.
 3. Select `power to kwh`, create a feed called `use_kwh` with feed engine `PHPFina` and feed `interval=10s`.

## 3. Configure MyElectric App

With your inputs configured as above and with use of the suggested feed names the MyElectric app will launch with no further configuration required.

Alternatively the MyElectric app will automatically show the configuration screen if it can't detect the expected feeds. It's then possible to select feeds from the drop down feed selector menus:

Once the required feeds are selected, the Launch App button will appear.

![MyElectric Config](img/home-energy/myelectric_config.png)

## My Electric App 

The main view shows a moving window power view of site-consumption in the top half and historic daily energy consumption in kWh in the bottom half.

**Energy View**

![MyElectric Web App](img/home-energy/myelectric_webapp.png)

**Cost View**

![MyElectric Web App](img/home-energy/myelectric_cost.png)



