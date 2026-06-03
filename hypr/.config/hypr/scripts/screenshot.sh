#!/usr/bin/env bash
# ──────────────────────────────────────────────
#  screenshot.sh — Hyprland Screenshot Helper
#  Deps: grim, slurp, wl-copy (wl-clipboard)
#
#  Usage:
#    screenshot.sh region  → select area
#    screenshot.sh full    → full screen
# ──────────────────────────────────────────────

MODE="${1:-region}"

# ── Output folders ─────────────────────────────
BASE="$HOME/Pictures/Screenshots"
REGION_DIR="$BASE/Region"
FULL_DIR="$BASE/Fullscreen"

mkdir -p "$REGION_DIR" "$FULL_DIR"

# ── Filename: e.g. 2026-03-09_14-32-05 ─────────
TIMESTAMP="$(date '+%Y-%m-%d_%H-%M-%S')"

notify() {
  # --icon with the file path shows the screenshot as thumbnail in the notification
  notify-send --urgency=low --icon="$1" "Screenshot Saved" "$2" 2>/dev/null
}

case "$MODE" in
  region)
    FILE="$REGION_DIR/region_${TIMESTAMP}.png"
    GEOM=$(slurp) || exit 1
    grim -g "$GEOM" "$FILE"
    wl-copy < "$FILE"
    notify "$FILE" "Screenshots/Region/region_${TIMESTAMP}.png"
    ;;
  full)
    FILE="$FULL_DIR/fullscreen_${TIMESTAMP}.png"
    grim "$FILE"
    wl-copy < "$FILE"
    notify "$FILE" "Screenshots/Fullscreen/fullscreen_${TIMESTAMP}.png"
    ;;
  *)
    echo "Usage: $0 {region|full}"
    exit 1
    ;;
esac

echo "Saved → $FILE"
