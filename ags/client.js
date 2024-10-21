import { getIconFromClass } from "./utils.js";
import { Icon } from "./icon.js";

const hyprland = await Service.import("hyprland");

export const Client = () => {
  const cls = hyprland.active.client.bind("address").as((add) => {
    if (add !== "0x") {
      return ["client"];
    } else {
      return ["client", "empty"];
    }
  });

  const focusedTitle = Widget.Box({
    children: hyprland.active.bind("client").as((client) => {
      return [getIconFromClass(client.class), Widget.Label(client.title)];
    }),
    class_names: cls,
  });

  return focusedTitle;
};
