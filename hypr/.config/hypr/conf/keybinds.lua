-- ╔══════════════════════════════════════════════════════════════════════════════╗
-- ║          K E Y B I N D S   —   All bind / bindm / bindel / bindl            ║
-- ║                                                                              ║
-- ║  Bind types:                                                                 ║
-- ║    hl.bind()   → regular keybind (fires on key down)                        ║
-- ║    bindm       → mouse drag action  (use { mouse = true })                  ║
-- ║    bindel       → repeatable while held (volume, brightness)                ║
-- ║    bindl        → works on locked screen (media keys)                       ║
-- ║                                                                              ║
-- ║  Docs: https://wiki.hypr.land/Configuring/Basics/Binds/                     ║
-- ╚══════════════════════════════════════════════════════════════════════════════╝

local v     = require("conf.variables")
local MOD   = v.mainMod   -- "SUPER"
local SHIFT = MOD .. " + SHIFT"
local ALT   = MOD .. " + ALT"
local ALTSH = MOD .. " + ALT + SHIFT"
local CTRL  = MOD .. " + CTRL"


-- ╭──────────────────────────────────────────────────────────────────────────╮
-- │  APPS & WM ACTIONS                                                       │
-- ╰──────────────────────────────────────────────────────────────────────────╯

hl.bind(MOD .. " + RETURN", hl.dsp.exec_cmd(v.terminal))    -- open terminal
hl.bind(MOD .. " + E", hl.dsp.exec_cmd(v.fileManager))      -- file manager
hl.bind(MOD .. " + R", hl.dsp.exec_cmd(v.menu))             -- app launcher

-- Camera / screenshot helper (put your script at the path below)
hl.bind(MOD .. " + C", hl.dsp.exec_cmd("~/.config/hypr/scripts/camera.sh"))

-- Window management
hl.bind(MOD .. " + Q", hl.dsp.window.close())                           -- close focused
hl.bind(MOD .. " + V", hl.dsp.window.float({ action = "toggle" }))      -- toggle float
hl.bind(MOD .. " + P", hl.dsp.window.pseudo())                          -- dwindle pseudo
hl.bind(MOD .. " + T", hl.dsp.layout("togglesplit"))                    -- dwindle split dir


-- ╭──────────────────────────────────────────────────────────────────────────╮
-- │  SESSION                                                                 │
-- ╰──────────────────────────────────────────────────────────────────────────╯

-- Power menu script
hl.bind(MOD .. " + M", hl.dsp.exec_cmd("~/.config/hypr/scripts/powermenu.sh"))

-- Hard exit — uses hyprshutdown if installed, falls back to hyprctl
hl.bind(SHIFT .. " + M", hl.dsp.exec_cmd(
  "command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit"
))

-- Screen lock
hl.bind(CTRL .. " + L", hl.dsp.exec_cmd("hyprlock"))


-- ╭──────────────────────────────────────────────────────────────────────────╮
-- │  WAYBAR                                                                  │
-- ╰──────────────────────────────────────────────────────────────────────────╯

hl.bind(MOD .. " + W", hl.dsp.exec_cmd("~/.config/hypr/scripts/waybar.sh"))
hl.bind(SHIFT .. " + W", hl.dsp.exec_cmd("~/.config/hypr/scripts/waybar.sh restart"))


-- ╭──────────────────────────────────────────────────────────────────────────╮
-- │  SCREENSHOTS                                                             │
-- ╰──────────────────────────────────────────────────────────────────────────╯

hl.bind("Print", hl.dsp.exec_cmd("~/.config/hypr/scripts/screenshot.sh region"))
hl.bind(MOD .. " + Print", hl.dsp.exec_cmd("~/.config/hypr/scripts/screenshot.sh full"))


-- ╭──────────────────────────────────────────────────────────────────────────╮
-- │  FOCUS   (vim-style hjkl)                                                │
-- ╰──────────────────────────────────────────────────────────────────────────╯

hl.bind(MOD .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(MOD .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(MOD .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(MOD .. " + j", hl.dsp.focus({ direction = "down" }))

-- Arrow-key alternatives
hl.bind(MOD .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(MOD .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(MOD .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(MOD .. " + down", hl.dsp.focus({ direction = "down" }))


-- ╭──────────────────────────────────────────────────────────────────────────╮
-- │  WORKSPACES   1-10                                                       │
-- ╰──────────────────────────────────────────────────────────────────────────╯

for i = 1, 10 do
  local key = i % 10   -- workspace 10 maps to the "0" key
  -- Jump to workspace
  hl.bind(MOD .. " + " .. key, hl.dsp.focus({ workspace = i }))
  -- Send window to workspace (and stay behind)
  hl.bind(SHIFT .. " + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Relative navigation (vim-style)
hl.bind(ALT .. " + l", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(ALT .. " + h", hl.dsp.focus({ workspace = "e-1" }))

-- Move window to adjacent workspace and follow
hl.bind(ALTSH .. " + l", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind(ALTSH .. " + h", hl.dsp.window.move({ workspace = "e-1" }))

-- Mouse-wheel workspace scroll (hold Super)
hl.bind(MOD .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(MOD .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))


-- ╭──────────────────────────────────────────────────────────────────────────╮
-- │  SCRATCHPAD   (special:magic)                                            │
-- ╰──────────────────────────────────────────────────────────────────────────╯

hl.bind(MOD .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(SHIFT .. " + S", hl.dsp.window.move({ workspace = "special:magic" }))


-- ╭──────────────────────────────────────────────────────────────────────────╮
-- │  MOUSE — MOVE & RESIZE                                                   │
-- ╰──────────────────────────────────────────────────────────────────────────╯

hl.bind(MOD .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })   -- LMB drag = move
hl.bind(MOD .. " + mouse:273", hl.dsp.window.resize(), { mouse = true }) -- RMB drag = resize


-- ╭──────────────────────────────────────────────────────────────────────────╮
-- │  MEDIA KEYS   (repeatable while held — bindel)                           │
-- ╰──────────────────────────────────────────────────────────────────────────╯

-- Volume
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
  { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
  { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
  { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
  { locked = true, repeating = true })

-- Screen brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })


-- ╭──────────────────────────────────────────────────────────────────────────╮
-- │  MEDIA PLAYBACK   (works on lock screen — bindl)                         │
-- ╰──────────────────────────────────────────────────────────────────────────╯

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
