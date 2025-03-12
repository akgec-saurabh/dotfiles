#!/bin/bash

if dunstctl is-paused | grep -q "true"; then
    echo '{"text": "", "class": "dnd", "alt": "dnd"}'
elif [ "$(dunstctl count waiting)" -gt 0 ]; then
    echo '{"text": "", "class": "notification", "alt": "notification"}'
else
    echo '{"text": "", "class": "none", "alt": "none"}'
fi