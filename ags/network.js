import { Icon } from "./icon.js";

const network = await Service.import("network");

export function Network() {
  return Widget.Box({
    children: [
      Icon({ icon: network.wifi.bind("icon_name") }),
      Widget.Label({
        label: network.wifi.bind("ssid").as((ssid) => ssid || "Unknown"),
      }),
    ],
  });
}
