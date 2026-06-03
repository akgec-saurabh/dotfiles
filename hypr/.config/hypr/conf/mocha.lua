-- ╔══════════════════════════════════════════════════════════════════════════════╗
-- ║            C O L O U R S   —   C a t p p u c c i n   M o c h a             ║
-- ║                                                                              ║
-- ║  Full Mocha palette exposed as module-level locals AND as hl.env() so        ║
-- ║  external tools (waybar, rofi, etc.) can inherit them via $HYPRLAND_ENV.    ║
-- ║                                                                              ║
-- ║  Usage in other modules:                                                     ║
-- ║    local c = require("conf.mocha")                                           ║
-- ║    c.mauve   → "cba6f7"   (bare hex, no prefix)                             ║
-- ║    c.r.mauve → "rgb(cba6f7)"                                                 ║
-- ║    c.a.mauve → "rgba(cba6f7ff)"   (fully opaque)                            ║
-- ╚══════════════════════════════════════════════════════════════════════════════╝

-- ── Raw hex values (no prefix) ─────────────────────────────────────────────────
local hex = {
    -- ── Accents ────────────────────────────────────────────────────────────────
    rosewater = "f5e0dc",
    flamingo  = "f2cdcd",
    pink      = "f5c2e7",
    mauve     = "cba6f7",
    red       = "f38ba8",
    maroon    = "eba0ac",
    peach     = "fab387",
    yellow    = "f9e2af",
    green     = "a6e3a1",
    teal      = "94e2d5",
    sky       = "89dceb",
    sapphire  = "74c7ec",
    blue      = "89b4fa",
    lavender  = "b4befe",

    -- ── Text ───────────────────────────────────────────────────────────────────
    text      = "cdd6f4",
    subtext1  = "bac2de",
    subtext0  = "a6adc8",

    -- ── Overlay ────────────────────────────────────────────────────────────────
    overlay2  = "9399b2",
    overlay1  = "7f849c",
    overlay0  = "6c7086",

    -- ── Surface ────────────────────────────────────────────────────────────────
    surface2  = "585b70",
    surface1  = "45475a",
    surface0  = "313244",

    -- ── Base ───────────────────────────────────────────────────────────────────
    base      = "1e1e2e",
    mantle    = "181825",
    crust     = "11111b",
}

-- ── Helpers: build rgb() / rgba() wrappers ─────────────────────────────────────
local r, a = {}, {}
for name, val in pairs(hex) do
    r[name] = "rgb("  .. val .. ")"
    a[name] = "rgba(" .. val .. "ff)"  -- ff = fully opaque; callers can swap suffix
end

-- ── Export ─────────────────────────────────────────────────────────────────────
return { hex = hex, r = r, a = a }
