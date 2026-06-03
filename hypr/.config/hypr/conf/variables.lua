-- ╔══════════════════════════════════════════════════════════════════════════════╗
-- ║          V A R I A B L E S   —   Programs, Modifier, Environment            ║
-- ║                                                                              ║
-- ║  Central place to change your terminal, file manager, launcher, etc.        ║
-- ║  These locals are re-exported so keybinds.lua can import them directly.     ║
-- ║                                                                              ║
-- ║  Docs: https://wiki.hypr.land/Configuring/Keywords/                         ║
-- ╚══════════════════════════════════════════════════════════════════════════════╝

-- ── App launchers ──────────────────────────────────────────────────────────────
local terminal    = "kitty"
local fileManager = "nautilus"
local menu        = "rofi -show drun"
local mainMod     = "SUPER"

-- ── Environment variables ──────────────────────────────────────────────────────
-- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("XCURSOR_SIZE",  "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- Wayland / toolkit hints
hl.env("GDK_BACKEND",    "wayland,x11,*")
hl.env("QT_QPA_PLATFORM","wayland;xcb")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")

-- ── Re-export so keybinds and autostart can import ────────────────────────────
return {
    terminal    = terminal,
    fileManager = fileManager,
    menu        = menu,
    mainMod     = mainMod,
}
