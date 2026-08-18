#!/bin/sh
pkill wshowkeys || wshowkeys -a top -m 40 -b "{{colors.surface_container.default.hex}}EE" -s "{{colors.primary.default.hex}}" -f "{{colors.tertiary_fixed.default.hex}}" -F "52" -l 800
