#!/usr/bin/env bash
# Base16 Monokai - Gnome Terminal color scheme install script
# Wimer Hazenberg (http://www.monokai.nl)

[[ -z "$PROFILE_NAME" ]] && PROFILE_NAME="Base 16 Monokai"
[[ -z "$PROFILE_SLUG" ]] && PROFILE_SLUG="base-16-monokai"
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
gset string palette "#227722882222:#338833883300:#4499448833ee:#7755771155ee:#aa5599ff8855:#ff88ff88ff22:#ff55ff44ff11:#ff99ff88ff55:#ff9922667722:#ffdd997711ff:#ff44bbff7755:#aa66ee2222ee:#aa11eeffee44:#6666dd99eeff:#aaee8811ffff:#cccc66663333"
gset string background_color "#227722882222"
gset string foreground_color "#ff88ff88ff22"
gset string bold_color "#ff88ff88ff22"
gset bool   bold_color_same_as_fg "true"
gset bool   use_theme_colors "false"
gset bool   use_theme_background "false"