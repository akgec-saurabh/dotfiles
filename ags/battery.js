import { Icon } from "./icon.js";

const battery = await Service.import("battery");

const batteryProgress = Widget.Label({
  label: battery.bind("percent").as((p) => `${p.toFixed()}%`),

  visible: battery.bind("available"),
  class_name: battery.bind("charging").as((ch) => (ch ? "charging" : "")),
});

export function Battery() {
  return Widget.Box({
    children: [
      Icon({ icon: battery.bind("icon_name") }),
      Widget.Label({
        label: battery.bind("percent").as((p) => `${p.toFixed()}%`),
      }),
    ],
  });
}
