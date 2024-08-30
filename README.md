# wfb-ng-openwrt

WFB-NG for OpenWrt uses the special mechanic of "aggregation" from wfb_ng to bring together data streams from many "forwarders" for data multiversity over an extended LAN, using both physical ethernet cables and 2,4ghz as backhaul channel.

## Explanations & descriptions
Forwarder: an instance of wfb_rx running in forwarding mode, it simply forwards the encrypted stream to an aggregator to decrypt and distribute to a reciever.
example code

Aggregator: an instance of wfb_rx running in aggregation mode, which takes one or many udp streams of encrypted data from wfb_rx instances running in forward mode.
example code

## Standard features
USB-tethering to Android devices (Android TV, Android Phones, Android tablets, Meta Quest2/3). Requires sideloading PixelPilot (https://github.com/OpenIPC/PixelPilot)

UDP videostream to port 5600 by default

Set up master (aggregator) and slave (forwarder) nodes, only limited by the bandwidth availailable on your OpenWRT network.

## Non-standard features
You can configure and setup any applications on your OpenWRT devices and change the behaviour of routing and aggregator/forward setup depending on your needs and requirements.
It is possible to augment either a local instance of wfb_ng on your Radxa or other x86 groundstation with forwarded data streams, or act as a forwarded and feed the stream from your groundstation to a joint aggregation network.

## Limitations
At the moment, wfb_ng have some limitations with parsing wifi6/7 packages. Some routers seems to work, others not. May be a WiFi6 implementation bug for certain chipsets.

## Tested devices
(In theory any router with 5GHz network which supports 'monitor mode' should work)

(WiFi4) Wifi Google (https://openwrt.org/toh/google/wifi)

(WiFi4) TP-link CPE510  (https://openwrt.org/toh/tp-link/cpe510)

(WiFi6) ASUS RT-AX53U (https://openwrt.org/toh/asus/rt-ax53u)

## Devices currently being tested / investigated for compatibility
-

## Setup process
① Make sure the router is on the 'tested devices list'
② Make sure the router can be flashed with openwrt [check TOH https://openwrt.org/toh/start]
③ Flash the router to the openwrt system [click from the TOH page to enter the device's Wiki page]
④ Compile and generate router firmware with wfb-ng [Can I install the ipk package directly? ]
⑤ Update the router firmware to the firmware containing wfb-ng [system-Flash Firmware]

## Link list for technical people
https://github.com/svpcom/wfb-ng/wiki/wfb_tx-and-wfb_rx-reference

https://openwrt.org/docs/guide-developer/toolchain/use-buildsystem

https://openwrt.org/docs/guide-developer/toolchain/single.package



## Joakim special distributed LAN configuration
![image](https://github.com/user-attachments/assets/f8e70d06-f2d6-40ee-82a8-cd3969b59b5f)


## Todo
A section on how to build your own wfb_ng packages

A section on how to build your own flashable image

Create a flow chart of instances, ports and setup on typical use case with 2-4 wfb-ngopenwrt devicees and integrate with a groundstation.

Insert some pictures of working use cases (living room Android TV, Groundstation etc)
