import { Tray } from "./tray.js";
import { Client } from "./client.js";
import { Workspaces } from "./workspaces.js";
import { Battery } from "./battery.js";
import { Clock } from "./time.js";
import { Audio } from "./audio.js";
import { Seprator } from "./utils.js";
import { Network } from "./network.js";

function Left() {
  return Widget.Box({
    class_name: "left",
    hpack: "start",
    spacing: 8,
    children: [Workspaces(), Seprator(), Tray()],
  });
}

const drawingarea = Widget.DrawingArea({
  widthRequest: 50,
  heightRequest: 50,
  drawFn: (self, cr, w, h) => {
    const center = {
      x: w / 2,
      y: h / 2,
    };

    cr.setSourceRGBA(1, 1, 1, 1);
    cr.setLineWidth(10);
    cr.arc(center.x, center.y, 2, 0, Math.PI * 2);
    cr.stroke();
  },
});

function Center() {
  return Widget.Box({
    class_name: "center",
    hpack: "center",
    spacing: 8,
    children: [Client()],
  });
}

function Right() {
  return Widget.Box({
    class_name: "right",
    hpack: "end",
    spacing: 8,
    children: [
      Audio(),
      Seprator(),
      Network(),
      Seprator(),
      Clock(),
      Seprator(),
      Battery(),
    ],
  });
}

const centerBox = Widget.CenterBox({
  spacing: 8,
  vertical: false,
  startWidget: Left(),
  centerWidget: Center(),
  endWidget: Right(),
  class_name: "center-box",
});

/* -------------------------------------------------------------------------- */
/*                                     BAR                                    */
/* -------------------------------------------------------------------------- */

const bar = Widget.Window({
  name: "bar",
  anchor: ["top", "left", "right"],
  exclusivity: "exclusive",
  child: centerBox,
  class_name: "bar",
  margins: [4, 0],
});

/* -------------------------------------------------------------------------- */
/*                                 APP CONFIG                                 */
/* -------------------------------------------------------------------------- */

App.addIcons(`${App.configDir}/assets`);

App.config({
  style: "./style.css",
  iconTheme: "Papirus",
  windows: [bar],
});

export {};
