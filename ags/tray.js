import { focus, getIconFromClass } from "./utils.js";

const hyprland = await Service.import("hyprland");
const dispatch = (address) => {
  hyprland.messageAsync(`dispatch focuswindow address:${address}`).catch(print);
};

export const Tray = () => {
  let globalWidgets = [];
  const clients = hyprland.bind("clients").as((clients) => {
    const currentClientIds = clients.map((client) => client.pid);
    globalWidgets = globalWidgets.filter((widget) => {
      if (widget.attribute) {
        return currentClientIds.includes(widget?.attribute.pid);
      } else {
        return false;
      }
    });

    clients.forEach((client) => {
      globalWidgets.push(
        Widget.Button({
          child: getIconFromClass(client.class),
          class_name: "tray-btn",
          hpack: "end",
          vpack: "center",
          cursor: "pointer",
          visible: false,
          on_clicked: () => {
            dispatch(client.address);
          },
        })
      );
    });

    return globalWidgets;
  });

  return Widget.Box({
    class_name: "tray",
    children: clients,
    spacing: 4,
  });
};
