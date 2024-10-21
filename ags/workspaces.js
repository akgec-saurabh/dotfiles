const hyprland = await Service.import("hyprland");

const dispatch = (ws) => hyprland.messageAsync(`dispatch workspace ${ws}`);
const activeId = hyprland.active.workspace.bind("id");

export const Workspaces = () =>
  Widget.EventBox({
    onScrollUp: () => dispatch("+1"),
    onScrollDown: () => dispatch("-1"),
    child: Widget.Box({
      spacing: 4,
      children: Array.from({ length: 10 }, (_, i) => i + 1).map((i) =>
        Widget.Button({
          attribute: i,
          label: `${i}`,
          class_name: activeId.as(
            (k) => `${k === i ? "focused ws-btn" : "ws-btn"}`
          ),
          onClicked: () => dispatch(i),
        })
      ),

      setup: (self) => {
        self.hook(hyprland, () =>
          self.children.forEach((btn) => {
            btn.visible =
              btn.attribute <= 4 ||
              hyprland.workspaces.some((ws) => ws.id === btn.attribute);
          })
        );
        self.hook(
          hyprland,
          (v, add) => {
            hyprland.messageAsync(`dispatch focuswindow address:${add}`);
            // console.log(add);
          },
          "urgent-window"
        );
        self.on("event", (v) => {
          v.children;
          // console.log(v.class_name:"n");
        });
      },
    }),
  });
