import { Icon } from "./icon.js";

const audio = await Service.import("audio");

function getIconWithLabel(binding, icons) {
  const volume = binding.as((vol) => `${(vol * 100).toFixed()}%`);

  const vol = binding.as((vol) => {
    if (vol === 0) {
      return "custom-speaker-disable";
    } else {
      return "custom-speaker";
    }
  });

  const icon = Icon({ icon: vol });

  const label = Widget.Label({
    label: volume,
  });

  return [icon, label];
}

export function Audio() {
  const speaker = getIconWithLabel(audio.speaker.bind("volume"));

  const microphone = getIconWithLabel(audio.microphone.bind("volume"));

  const button = Widget.Button({
    class_name: "btn",
    child: Widget.Box({
      children: [...speaker, ...microphone],
    }),
  });

  return button;
}
