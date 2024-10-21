import { Icon } from "./icon.js";

export function getIconFromClass(className) {
  if (className === "Google-chrome") {
    return Icon({ icon: "google-chrome" });
  } else if (className === "Code") {
    return Icon({ icon: "code" });
  } else if (className === "Alacritty") {
    return Icon({ icon: "Alacritty" });
  } else if (className === "Postman") {
    return Icon({ icon: "postman" });
  } else if (className === "org.telegram.desktop") {
    return Icon({ icon: "telegram" });
  } else if (className === "thunar") {
    return Icon({ icon: "thunar" });
  } else if (className === "obsidian") {
    return Icon({ icon: "obsidian" });
  } else if (className === "zoom") {
    return Icon({ icon: "Zoom" });
  } else if (className === "vlc") {
    return Icon({ icon: "vlc" });
  } else {
    return Icon({ icon: "", visible: false });
  }
}

export const focus = ({ address }) =>
  Utils.execAsync(`hyprctl dispatch focuswindow address:${address}`).catch(
    print
  );

export function Seprator() {
  return Widget.Box({
    class_name: "seprator",
    children: [],
  });
}
