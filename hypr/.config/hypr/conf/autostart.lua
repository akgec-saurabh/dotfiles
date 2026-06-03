-- ╔══════════════════════════════════════════════════════════════════════════════╗
-- ║          A U T O S T A R T   —   Daemons & Apps on Login                    ║
-- ║                                                                              ║
-- ║  All commands here run exactly once when Hyprland starts.                   ║
-- ║  Order matters: polkit → idle → wallpaper → bar → apps                      ║
-- ║                                                                              ║
-- ║  Docs: https://wiki.hypr.land/Configuring/Basics/Autostart/                 ║
-- ╚══════════════════════════════════════════════════════════════════════════════╝

hl.on("hyprland.start", function()

    -- ── System daemons ────────────────────────────────────────────────────────

    -- Polkit authentication agent (needed for GUI sudo prompts)
    hl.exec_cmd("systemctl --user start hyprpolkitagent")

    -- Automount removable media
    hl.exec_cmd("udiskie")

    -- ── Idle & locking ───────────────────────────────────────────────────────

    -- Idle daemon: dims/locks screen after inactivity (configure in ~/.config/hypr/hypridle.conf)
    hl.exec_cmd("hypridle")

    -- ── Wallpaper ─────────────────────────────────────────────────────────────

    -- Wallpaper daemon (configure in ~/.config/hypr/hyprpaper.conf)
    hl.exec_cmd("hyprpaper")

    -- ── Status bar ────────────────────────────────────────────────────────────
    hl.exec_cmd("waybar")

    -- ── Applications ─────────────────────────────────────────────────────────

    hl.exec_cmd("firefox")

    -- Notification daemon
    -- hl.exec_cmd("dunst")
    -- hl.exec_cmd("swaync")

    -- Clipboard manager
    -- hl.exec_cmd("wl-paste --type text --watch cliphist store")
    -- hl.exec_cmd("wl-paste --type image --watch cliphist store")

end)
