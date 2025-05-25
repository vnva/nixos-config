#!/usr/bin/env bash
set -euo pipefail

readonly ENABLED=''
readonly DISABLED=''
dbus-monitor path='/fr/emersion/Mako',interface='fr.emersion.Mako',member='SetModes' --profile |
  while read -r _; do
    if makoctl mode | grep -q "do-not-disturb"; then
      CLASS="disabled"
      TEXT="$DISABLED"
    else
      CLASS="enabled"
      TEXT="$ENABLED"
    fi
    printf '{"text": "%s", "class": "%s"}\n' "$TEXT" "$CLASS"
  done