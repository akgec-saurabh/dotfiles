export const Icon = ({ icon, size = "18px", ...props }) =>
  Widget.Icon({
    icon: icon,
    class_name: "icon",
    css: `font-size: ${size};`,
    hpack: "center",
    vpack: "center",
    ...props,
  });
