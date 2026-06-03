-- ╔══════════════════════════════════════════════════════════════════════════════╗
-- ║             M O N I T O R S   —   Layout, Resolution, Scale                 ║
-- ║                                                                              ║
-- ║  Add one hl.monitor() block per display. For a purely dynamic setup,        ║
-- ║  use output = "" with mode = "preferred" and position = "auto".             ║
-- ║                                                                              ║
-- ║  Docs: https://wiki.hypr.land/Configuring/Basics/Monitors/                  ║
-- ╚══════════════════════════════════════════════════════════════════════════════╝

-- ── Primary: built-in laptop panel ────────────────────────────────────────────
hl.monitor({
  output   = "eDP-1",
  mode     = "1920x1080@60",
  position = "0x0",
  scale    = 1,
})

-- ── External monitors (uncomment / duplicate as needed) ───────────────────────

-- Right of the laptop panel, native 1080p
-- hl.monitor({
--     output   = "HDMI-A-1",
--     mode     = "1920x1080@60",
--     position = "1536x0",   -- 1920 / 1.25 = 1536 (logical width of eDP-1)
--     scale    = 1,
-- })

-- Fallback: auto-configure any plugged-in display
-- hl.monitor({
--     output   = "",
--     mode     = "preferred",
--     position = "auto",
--     scale    = "auto",
-- })
