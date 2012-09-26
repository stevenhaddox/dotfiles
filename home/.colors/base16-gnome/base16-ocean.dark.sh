#!/usr/bin/env bash
# Base16 Ocean - Gnome Terminal color scheme install script
# Chris Kempson (http://chriskempson.com)

[[ -z "$PROFILE_NAME" ]] && PROFILE_NAME="Base 16 Ocean"
[[ -z "$PROFILE_SLUG" ]] && PROFILE_SLUG="base-16-ocean"
[[ -z "$GCONFTOOL" ]] && GCONFTOOL=gconftool
[[ -z "$BASE_KEY" ]] && BASE_KEY=/apps/gnome-terminal/profiles

PROFILE_KEY="$BASE_KEY/$PROFILE_SLUG"

gset() {
  local type="$1"; shift
  local key="$1"; shift
  local val="$1"; shift

  "$GCONFTOOL" --set --type "$type" "$PROFILE_KEY/$key" -- "$val"
}

# Because gconftool doesn't have "append"
glist_append() {
  local type="$1"; shift
  local key="$1"; shift
  local val="$1"; shift

  local entries="$(
    {
      "$GCONFTOOL" --get "$key" | tr -d '[]' | tr , "\n" | fgrep -v "$val"
      echo "$val"
    } | head -c-1 | tr "\n" ,
  )"

  "$GCONFTOOL" --set --type list --list-type $type "$key" "[$entries]"
}

# Append the Base16 profile to the profile list
glist_append string /apps/gnome-terminal/global/profile_list "$PROFILE_SLUG"

gset string visible_name "$PROFILE_NAME"
gset string palette "#22BB330033BB:#334433DD4466:#44FF55BB6666:#6655773377EE:#AA77AADDBBAA:#CC00CC55CCEE:#DDFFEE11EE88:#EEFFFF11FF55:#CCBB771166EE:#DD0088777700:#EEBBCCBB88BB:#AA33BBEE88CC:#9966BB55BB44:#88FFAA11BB33:#BB4488EEAADD:#AABB77996677"
gset string background_color "#22BB330033BB"
gset string foreground_color "#CC00CC55CCEE"
gset string bold_color "#CC00CC55CCEE"
gset bool   bold_color_same_as_fg "true"
gset bool   use_theme_colors "false"
gset bool   use_theme_background "false"