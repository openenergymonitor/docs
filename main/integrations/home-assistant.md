# Home Assistant

OpenEnergyMonitor hardware can be integrated with [Home Assistant](https://www.home-assistant.io/) in several ways. Which one suits you best depends on the hardware you have and whether you also want to log data with EmonCMS.

| Route | Hardware | Data path | EmonCMS required |
|---|---|---|---|
| [ESPHome](#esphome-via-emonwifi) | emonTx6, emonTx5 or emonTx4 + emonWiFi | emonTx → emonWiFi (ESPHome) → Home Assistant | No (optional) |
| [MQTT](#mqtt-via-emonhub) | emonPi3, emonPi2, emonBase (any emonHub based system) | emonHub → MQTT broker → Home Assistant | No |
| [Emoncms integration](#emoncms-integration) | Any system logging to EmonCMS, local or emoncms.org | EmonCMS feeds → Home Assistant | Yes |

## Choosing a route

- **New install, Home Assistant only:** emonTx6 with an emonWiFi expander, running ESPHome. No Raspberry Pi needed, and data appears in Home Assistant as native sensors.
- **Existing emonPi / emonBase system:** use MQTT to get real-time inputs into Home Assistant, while emonHub and EmonCMS keep running as before.
- **You already log to EmonCMS and just want the feeds in Home Assistant:** use the Emoncms integration. This is the simplest to set up, but it polls once a minute.

## ESPHome via emonWiFi

The [emonWiFi](https://github.com/openenergymonitor/emonwifi) is a small ESP32-C3 expander that plugs into the emonTx6, emonTx5 or emonTx4 and reads the emonTx serial output. It runs [ESPHome](https://esphome.io/), which has native support for the emonTx through the [emontx component](https://esphome.io/components/sensor/emontx/).

- Each channel (voltage, power, energy, temperature, pulse count) is exposed as a Home Assistant sensor, and energy sensors can be used directly in the Home Assistant Energy dashboard.
- ESPHome can additionally forward the data to EmonCMS over HTTP(S) or MQTT, so you can use both.
- The emonTx can be configured directly from Home Assistant, see [Configuring the emonTx from Home Assistant](#configuring-the-emontx-from-home-assistant) below.

```{warning}
Never plug the emonWiFi USB-C cable in while it is fitted to an emonTx, this can damage the emonTx. Read the hardware installation notes in the [emonWiFi repository](https://github.com/openenergymonitor/emonwifi) before fitting it.
```

**Getting started:**

1. Fit the emonWiFi to the emonTx, following the instructions for your emonTx version in the [emonWiFi repository](https://github.com/openenergymonitor/emonwifi).
2. Install the ESPHome Device Builder (available as a Home Assistant App).
3. Create a configuration using the example in the emonWiFi repository, and flash the emonWiFi over USB the first time. Later updates can be done over WiFi.
4. Adopt the device in Home Assistant: it will be discovered automatically.

A minimal sensor configuration looks like this (the emonWiFi uses GPIO20/GPIO21 for the serial link):

```yaml
uart:
  id: emontx_uart
  rx_pin: GPIO20
  tx_pin: GPIO21
  baud_rate: 115200
  rx_buffer_size: 2048

emontx:

sensor:
  - platform: emontx
    tag_name: "P1"
    name: "Power CT1"
  - platform: emontx
    tag_name: "E1"
    name: "Energy CT1"
```

See the [ESPHome emontx documentation](https://esphome.io/components/sensor/emontx/) for the full list of tags and options.

### Configuring the emonTx from Home Assistant

The [emonPi/Tx Configuration](https://github.com/FredM67/ha-emon-config) integration, available through [HACS](https://hacs.xyz/), adds a configuration panel to Home Assistant, so there is no need to send serial commands by hand. It provides:

- CT and voltage calibration, radio settings and other device settings, applied in one go
- Friendly names for CT, voltage, pulse and temperature channels
- Live readings, energy and pulse counter reset, and a serial terminal
- A generator for the ESPHome sensor configuration of the active channels
- Firmware update checks and wireless firmware updates for the emonTx6/emonPi3
- Support for several devices, and for 3-phase emonPi3 setups

**Requirements:** the emonWiFi must be added to the ESPHome integration in Home Assistant, and its ESPHome configuration must include the `emontx_ha_bridge` external component alongside the `emontx` component.

```{note}
The `emontx_ha_bridge` component is not yet part of mainline ESPHome. It must be loaded via `external_components`, see the [integration documentation](https://github.com/FredM67/ha-emon-config#esphome-setup) for a complete example configuration.
```

**Installation:**

1. In HACS, add `https://github.com/FredM67/ha-emon-config` as a custom repository (type *Integration*) and install **emonPi/Tx Configuration**.
2. Restart Home Assistant.
3. Go to `Settings > Devices & services > Add Integration` and search for **emonPi/Tx Configuration**.

## MQTT via emonHub

On emonPi3, emonPi2, emonBase and other systems running {doc}`emonHub </emonhub/overview>`, every input is published to the local MQTT broker (mosquitto). By default each value is published on its own topic using the {doc}`node variable format </emonhub/default-configuration>`:

```text
emon/<node name>/<input name>
```

For example, an emonPi3 publishes under the `EmonPi3` node name. The exact input names can be seen on the EmonCMS `Setup > Inputs` page, or by subscribing to `emon/#` with an MQTT client.

To use these values in Home Assistant:

1. Add the [MQTT integration](https://www.home-assistant.io/integrations/mqtt/) in Home Assistant and point it at the broker on the emonPi/emonBase. The default credentials are listed in the {doc}`emonSD documentation </emonsd/download>`. Change them if your system is reachable from outside your local network.
2. emonHub does not publish Home Assistant MQTT discovery messages, so define each sensor manually in `configuration.yaml`:

```yaml
mqtt:
  sensor:
    - name: "emonPi3 Power CT1"
      state_topic: "emon/EmonPi3/P1"
      unit_of_measurement: "W"
      device_class: power
      state_class: measurement
    - name: "emonPi3 Energy CT1"
      state_topic: "emon/EmonPi3/E1"
      unit_of_measurement: "Wh"
      device_class: energy
      state_class: total_increasing
```

Adjust the topics to match the input names shown on your system.

## Emoncms integration

Home Assistant has a built-in [Emoncms integration](https://www.home-assistant.io/integrations/emoncms/) that reads feeds from any EmonCMS server, either a local emonPi/emonBase or [emoncms.org](https://emoncms.org).

1. In Home Assistant, go to `Settings > Devices & services > Add Integration` and select **Emoncms**.
2. Enter the server URL, e.g. `http://emonpi.local` or `https://emoncms.org`.
3. Enter the **read-only API key**, found in EmonCMS under `My Account`.

Feeds are polled every 60 seconds and appear as sensors. Note that this integration reads *feeds*, not inputs, so the inputs need to be logged to feeds in EmonCMS first.

To send data the other way, from Home Assistant into EmonCMS, use the [Emoncms History integration](https://www.home-assistant.io/integrations/emoncms_history/).
