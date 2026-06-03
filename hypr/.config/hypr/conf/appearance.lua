-- ╔══════════════════════════════════════════════════════════════════════════════╗
-- ║       A P P E A R A N C E   —   Borders, Gaps, Shadows, Blur, Animations   ║
-- ║                                                                              ║
-- ║  Colours come from conf.mocha; layout engine is set in conf.layouts.        ║
-- ║                                                                              ║
-- ║  Docs: https://wiki.hypr.land/Configuring/Basics/Variables/                 ║
-- ╚══════════════════════════════════════════════════════════════════════════════╝

local c = require("conf.mocha")


-- ╭──────────────────────────────────────────────────────────────────────────╮
-- │  GENERAL                                                                 │
-- ╰──────────────────────────────────────────────────────────────────────────╯

hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 10,

        border_size = 2,

        -- Active window border: mauve → blue, 45° gradient
        col = {
            active_border = {
                colors = {
                    "rgba(" .. c.hex.mauve   .. "ee)",
                    "rgba(" .. c.hex.blue    .. "ee)",
                },
                angle = 45,
            },
            -- Inactive border: subtle surface tone
            inactive_border = "rgba(" .. c.hex.surface1 .. "aa)",
        },

        -- Drag borders/gaps to resize windows
        resize_on_border = false,

        -- ⚠ Read the tearing docs before enabling:
        -- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/
        allow_tearing = false,

        -- Layout engine: scrolling | dwindle | master
        -- (also set in layouts.lua for context; keep them in sync)
        layout = "scrolling",
    },
})


-- ╭──────────────────────────────────────────────────────────────────────────╮
-- │  DECORATION                                                              │
-- ╰──────────────────────────────────────────────────────────────────────────╯

hl.config({
    decoration = {
        rounding       = 0,    -- px corner radius (0 = square)
        rounding_power = 2,    -- squircle exponent; 2 = circular, higher = squarer

        -- Per-window opacity (1.0 = fully opaque)
        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        -- ── Drop shadow ──────────────────────────────────────────────────────
        shadow = {
            enabled      = false,   -- toggle shadow globally
            range        = 4,
            render_power = 3,
            color        = "rgba(" .. c.hex.crust .. "ee)",
        },

        -- ── Background blur ──────────────────────────────────────────────────
        blur = {
            enabled  = false,   -- toggle blur globally
            size     = 3,
            passes   = 1,
            vibrancy = 0.1696,  -- colour boost inside blurred region
        },
    },
})


-- ╭──────────────────────────────────────────────────────────────────────────╮
-- │  ANIMATIONS                                                              │
-- │  Docs: https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/ │
-- ╰──────────────────────────────────────────────────────────────────────────╯

hl.config({
    animations = { enabled = true },
})

-- ── Bezier curves ──────────────────────────────────────────────────────────────
--  Name           P1 (x,y)          P2 (x,y)
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0,    0},    {1,    1}    } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5,  0.5},  {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1,  1}    } })

-- ── Spring curves ──────────────────────────────────────────────────────────────
hl.curve("easy", {
    type      = "spring",
    mass      = 1,
    stiffness = 71.2633,
    dampening = 15.8273644,
})

-- ── Animation tree ─────────────────────────────────────────────────────────────
--  leaf              on?    speed   curve             style
hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default"      })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy"         })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick"        })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick"        })
