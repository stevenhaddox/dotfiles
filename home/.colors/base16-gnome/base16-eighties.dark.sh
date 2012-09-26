#!/usr/bin/env bash
# Base16 Eighties - Gnome Terminal color scheme install script
# Chris Kempson (http://chriskempson.com)

[[ -z "$PROFILE_NAME" ]] && PROFILE_NAME="Base 16 Eighties"
[[ -z "$PROFILE_SLUG" ]] && PROFILE_SLUG="base-16-eighties"
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
gset string palette "#22dd22dd22dd:#339933993399:#551155115511:#774477336699:#aa0099ff9933:#dd33dd00cc88:#ee88ee66ddff:#ff22ff00eecc:#ff22777777aa:#ff9999115577:#ffffcccc6666:#9999cccc9999:#6666cccccccc:#66669999cccc:#cccc9999cccc:#dd2277bb5533"
gset string background_color "#22dd22dd22dd"
gset string foreground_color "#dd33dd00cc88"
gset string bold_color "#dd33dd00cc88"
gset bool   bold_color_same_as_fg "true"
gset bool   use_theme_colors "false"
gset bool   use_theme_background "false"