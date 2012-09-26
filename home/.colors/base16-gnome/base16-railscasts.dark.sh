#!/usr/bin/env bash
# Base16 Railscasts - Gnome Terminal color scheme install script
# Ryan Bates (http://railscasts.com)

[[ -z "$PROFILE_NAME" ]] && PROFILE_NAME="Base 16 Railscasts"
[[ -z "$PROFILE_SLUG" ]] && PROFILE_SLUG="base-16-railscasts"
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
gset string palette "#22bb22bb22bb:#227722993355:#33aa44005555:#55aa664477ee:#dd44ccffcc99:#ee66ee11ddcc:#ff44ff11eedd:#ff99ff77ff33:#ddaa44993399:#cccc77883333:#ffffcc6666dd:#aa55cc226611:#551199ff5500:#66dd99ccbbee:#bb66bb33eebb:#bbcc99445588"
gset string background_color "#22bb22bb22bb"
gset string foreground_color "#ee66ee11ddcc"
gset string bold_color "#ee66ee11ddcc"
gset bool   bold_color_same_as_fg "true"
gset bool   use_theme_colors "false"
gset bool   use_theme_background "false"