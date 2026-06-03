-- ╔══════════════════════════════════════════════════════════════════════════════╗
-- ║        W I N D O W   R U L E S   —   Per-app Rules & Workspace Rules        ║
-- ║                                                                              ║
-- ║  All hl.window_rule() calls return a handle so you can toggle them later:   ║
-- ║    local rule = hl.window_rule({ ... })                                     ║
-- ║    rule:set_enabled(false)                                                   ║
-- ║                                                                              ║
-- ║  Docs: https://wiki.hypr.land/Configuring/Basics/Window-Rules/              ║
-- ║        https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/           ║
-- ╚══════════════════════════════════════════════════════════════════════════════╝


-- ╭──────────────────────────────────────────────────────────────────────────╮
-- │  GLOBAL RULES                                                            │
-- ╰──────────────────────────────────────────────────────────────────────────╯

-- Suppress maximize requests from every app.
-- Apps that request maximize will tile instead (Hyprland controls size).
local _suppressMaximize = hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

-- Fix XWayland floating windows losing their drag handle.
-- Blank class+title + xwayland + floating = chromium-style popups; skip focus.
local _fixXWaylandDrag = hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})


-- ╭──────────────────────────────────────────────────────────────────────────╮
-- │  HYPRLAND-RUN POPUP                                                      │
-- ╰──────────────────────────────────────────────────────────────────────────╯

-- Hyprland-run spawns a small floating terminal at the bottom of the screen.
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },
    move  = "20 monitor_h-120",
    float = true,
})


-- ╭──────────────────────────────────────────────────────────────────────────╮
-- │  APP-SPECIFIC RULES                                                      │
-- ╰──────────────────────────────────────────────────────────────────────────╯

-- PulseAudio / PipeWire volume mixer → centred floating window
-- hl.window_rule({
--     name  = "float-pavucontrol",
--     match = { class = "org.pulseaudio.pavucontrol" },
--     float  = true,
--     size   = "800 600",
--     center = true,
-- })

-- Nautilus file-chooser dialogs → float + centre
-- hl.window_rule({
--     name  = "float-nautilus-dialogs",
--     match = { class = "org.gnome.Nautilus", title = ".*Open.*" },
--     float  = true,
--     center = true,
-- })

-- Picture-in-picture browsers → sticky float in corner
-- hl.window_rule({
--     name  = "pip",
--     match = { title = "Picture.in.Picture" },
--     float     = true,
--     pin       = true,
--     keepaspectratio = true,
--     move      = "85% 10%",
--     size      = "350 200",
-- })


-- ╭──────────────────────────────────────────────────────────────────────────╮
-- │  LAYER RULES   (shell overlays — waybar, rofi, etc.)                    │
-- │  Docs: https://wiki.hypr.land/Configuring/Layer-Rules/                  │
-- ╰──────────────────────────────────────────────────────────────────────────╯

-- Disable animations on a specific overlay layer (e.g. custom notification daemon)
-- local _overlayRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
