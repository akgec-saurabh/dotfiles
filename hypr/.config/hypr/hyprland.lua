-- ╔══════════════════════════════════════════════════════════════════════════════╗
-- ║                  H Y P R L A N D   —   M A I N   C O N F I G               ║
-- ║                                                                              ║
-- ║  Entry point. Everything is split into focused modules under conf/.          ║
-- ║  Edit this file only to add/remove modules, not to configure behaviour.      ║
-- ║                                                                              ║
-- ║  Docs: https://wiki.hypr.land/Configuring/Start/                            ║
-- ╚══════════════════════════════════════════════════════════════════════════════╝


-- ── 1. Colours (must come first — other modules reference these vars) ──────────
require("conf.mocha")         -- Catppuccin Mocha palette

-- ── 2. Core / Environment ──────────────────────────────────────────────────────
require("conf.variables")     -- $terminal, $mainMod, env vars
require("conf.monitors")      -- monitor outputs, resolution, scale

-- ── 3. Autostart ──────────────────────────────────────────────────────────────
require("conf.autostart")     -- exec-once daemons & apps

-- ── 4. Look & Feel ────────────────────────────────────────────────────────────
require("conf.appearance")    -- general, decoration, animations
require("conf.layouts")       -- dwindle, master, scrolling, misc, smart-gaps

-- ── 5. Input ──────────────────────────────────────────────────────────────────
require("conf.input")         -- keyboard, mouse, touchpad, gestures, per-device

-- ── 6. Bindings ───────────────────────────────────────────────────────────────
require("conf.keybinds")      -- all bind / bindm / bindel / bindl

-- ── 7. Rules ──────────────────────────────────────────────────────────────────
require("conf.windowrules")   -- windowrule, layer_rule, workspace_rule blocks
