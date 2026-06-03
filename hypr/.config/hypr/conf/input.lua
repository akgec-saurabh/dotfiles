-- ╔══════════════════════════════════════════════════════════════════════════════╗
-- ║        I N P U T   —   Keyboard, Mouse, Touchpad, Gestures, Devices        ║
-- ║                                                                              ║
-- ║  Docs: https://wiki.hypr.land/Configuring/Variables/#input                  ║
-- ╚══════════════════════════════════════════════════════════════════════════════╝


-- ╭──────────────────────────────────────────────────────────────────────────╮
-- │  KEYBOARD & MOUSE                                                        │
-- ╰──────────────────────────────────────────────────────────────────────────╯

hl.config({
    input = {
        -- ── Keyboard layout ──────────────────────────────────────────────────
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",   -- e.g. "caps:escape" to remap Caps Lock
        kb_rules   = "",

        -- ── Focus behaviour ──────────────────────────────────────────────────
        -- 0 = focus follows nothing  |  1 = follows mouse  |  2 = + mouse warp
        follow_mouse = 1,

        -- ── Pointer sensitivity ───────────────────────────────────────────────
        -- Range: -1.0 (slowest) → 1.0 (fastest)  |  0 = no modification
        sensitivity = 0,

        -- ── Touchpad ─────────────────────────────────────────────────────────
        touchpad = {
            natural_scroll   = true,   -- "content moves with finger" direction
            disable_while_typing = true,
            tap_to_click     = true,
        },
    },
})


-- ╭──────────────────────────────────────────────────────────────────────────╮
-- │  GESTURES                                                                │
-- │  Docs: https://wiki.hypr.land/Configuring/Gestures/                     │
-- ╰──────────────────────────────────────────────────────────────────────────╯

-- 3-finger horizontal swipe → switch workspace
hl.gesture({
    fingers   = 3,
    direction = "horizontal",
    action    = "workspace",
})

-- 3-finger vertical swipe → scroll (default behaviour; uncomment to override)
-- hl.gesture({ fingers = 3, direction = "vertical", action = "scroll" })

-- 4-finger horizontal swipe → move active window to adjacent workspace
-- hl.gesture({ fingers = 4, direction = "horizontal", action = "movewindow" })


-- ╭──────────────────────────────────────────────────────────────────────────╮
-- │  PER-DEVICE OVERRIDES                                                    │
-- │  Docs: https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/    │
-- │                                                                          │
-- │  Run `hyprctl devices` to list names.                                    │
-- ╰──────────────────────────────────────────────────────────────────────────╯

-- External mouse — slower than the default pointer speed
hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})

-- Add more devices below as needed, e.g.:
-- hl.device({
--     name        = "my-usb-keyboard",
--     kb_layout   = "gb",
-- })
