-- ╔══════════════════════════════════════════════════════════════════════════════╗
-- ║            L A Y O U T S   —   Dwindle, Master, Scrolling, Misc            ║
-- ║                                                                              ║
-- ║  Smart-gaps workspace rules are at the bottom of this file.                 ║
-- ║  The active layout is selected in appearance.lua → general.layout.          ║
-- ╚══════════════════════════════════════════════════════════════════════════════╝


-- ╭──────────────────────────────────────────────────────────────────────────╮
-- │  MISC                                                                    │
-- │  Docs: https://wiki.hypr.land/Configuring/Variables/#misc               │
-- ╰──────────────────────────────────────────────────────────────────────────╯

hl.config({
    misc = {
        -- -1 = random anime mascot wallpaper  |  0/1 = disable
        force_default_wallpaper = -1,
        disable_hyprland_logo   = false,
    },
})


-- ╭──────────────────────────────────────────────────────────────────────────╮
-- │  DWINDLE                                                                 │
-- │  Docs: https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/       │
-- ╰──────────────────────────────────────────────────────────────────────────╯

hl.config({
    scrolling = {
    },
})


-- ╭──────────────────────────────────────────────────────────────────────────╮
-- │  MASTER                                                                  │
-- │  Docs: https://wiki.hypr.land/Configuring/Layouts/Master-Layout/        │
-- ╰──────────────────────────────────────────────────────────────────────────╯

hl.config({
    master = {
        new_status = "master",  -- new windows spawn as master, not slave
    },
})


-- ╭──────────────────────────────────────────────────────────────────────────╮
-- │  SCROLLING                                                               │
-- │  Docs: https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/     │
-- ╰──────────────────────────────────────────────────────────────────────────╯

hl.config({
    scrolling = {
        -- Expand single-column view to full screen automatically
        fullscreen_on_one_column = true,
    },
})


-- ╭──────────────────────────────────────────────────────────────────────────╮
-- │  SMART GAPS   ("no gaps when only one window")                           │
-- │  Docs: https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/       │
-- │                                                                          │
-- │  Uncomment all four blocks below to enable.                              │
-- ╰──────────────────────────────────────────────────────────────────────────╯

-- -- Remove gaps on a tiled workspace with exactly one visible window
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })

-- -- Remove gaps on the first floating-only workspace
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })

-- -- Also remove borders so it truly fills the screen
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
