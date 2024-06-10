[wfb-ng](https://github.com/svpcom/wfb-ng) for OpenWrt
------------------

Package name is wfb-ng, There are five options in OpenWRT's config:
1. wfb-rx: `wfb_rx` binary
2. wfb-tx: `wfb_tx` binary
3. wfb-keygen: `wfb_keygen` binary
4. wfb-key: Default key used by OpenIPC and Android FPVue, linked to `/etc/gs.key`
5. wfb-gs: `OpenWRT wfb groundstation`, Include necessary bins, scripts and configs. The main function is set wireless network card to Monitor mode, receive data from WNIC and sending to decode & dispaly device.

### __Hardware__
* WiFi5 OpenWRT router. Recommend dual-band router with USB port.
* Tested:
  + [Qihoo C301](https://openwrt.org/toh/qihoo/c301): AR9344 + QCA9882
  + [PHICOMM K2](https://openwrt.org/toh/hwdata/phicomm/phicomm_k2): MT7620A + MT7612E
  + [PHICOMM K2P](https://openwrt.org/toh/phicomm/k2p_ke2p): MT7621AT + MT7615D

### __Features__
* Fully compatible with openipc fpv.(Specially designed for this)
* Using the wireless card integrated by router, No need to use an external USB wireless network card.
* 2.4G and 5G band supported when using a dual-band router.
* Support sending video stream and Mavlink data to devices via ethernet cable, wifi, RNDIS, etc.
* Auto switch sending destination between Android phone(USB tethering) and PC(ethernet or wifi) using unicast mode. Sending data to the phone when USB tethering turned on, Otherwise sending  data to the PC(static IP set in config)
* Sending data to Android(RNDIS) and SBC(ethernet) at the same time using multicast mode. QGroundControl does not support multicast in windows?
* Can place the router high or far away to get a better signal, such as on the roof. The working length of ethernet cable is much longer than USB cable.

### __TODO__
* Use multiple routers to receive.
* Receive data from 2.4G and 5G band simultaneously.

### __Configuration Example__
* Set channel to `36`
  1. `uci set wfb-gs.config.channel='36'`
  2. `uci commit`
  3. `reload_config`
* Set destination IP to `192.168.1.100` and set mode to `unicast`
  1. `uci set wfb-gs.config.ip_pc='192.168.1.100'`
  2. `uci set wfb-gs.config.mode='unicast'`
  3. `uci commit`
  4. `reload_config`
* Change settings by edit config file
  1. edit `/etc/config/wfb-gs` and save
  2. `reload_config`

### __Tips__
* Router's default IP is `192.168.1.1`
* Config file is `/etc/config/wfb-gs`
* Default destination IP is `192.168.1.2`
* Default channel is `161`
* Default bandwidth is `20MHz`

### __WARNING__
* Not fully tested yet, Use at your own risk.
