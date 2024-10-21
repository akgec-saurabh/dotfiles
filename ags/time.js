import { Icon } from "./icon.js";

const time = Variable("", {
  poll: [1000, 'date "+%H:%M":%S'],
});

const date = Variable("", {
  poll: [1000, 'date "+%d-%b"'],
});

export function Clock() {
  return Widget.Box({
    class_name: "clock",
    spacing: 8,
    children: [
      Widget.Label({
        class_name: "time",
        label: time.bind(),
      }),
      Widget.Label({
        class_name: "date",
        label: "/",
      }),
      Widget.Label({
        class_name: "date",
        label: date.bind(),
      }),
    ],
  });
}
