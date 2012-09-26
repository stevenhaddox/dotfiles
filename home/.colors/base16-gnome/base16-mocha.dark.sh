#!/usr/bin/env bash
# Base16 Mocha - Gnome Terminal color scheme install script
# Chris Kempson (http://chriskempson.com)

[[ -z "$PROFILE_NAME" ]] && PROFILE_NAME="Base 16 Mocha"
[[ -z "$PROFILE_SLUG" ]] && PROFILE_SLUG="base-16-mocha"
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
gset string palette "#33BB33222288:#553344663366:#664455224400:#77ee770055aa:#bb88aaffaadd:#dd00cc88cc66:#ee99ee11dddd:#ff55eeeeeebb:#ccbb66007777:#dd2288bb7711:#ff44bbcc8877:#bbeebb5555bb:#77bbbbddaa44:#88aabb33bb55:#aa8899bbbb99:#bbbb99558844"
gset string background_color "#33BB33222288"
gset string foreground_color "#dd00cc88cc66"
gset string bold_color "#dd00cc88cc66"
gset bool   bold_color_same_as_fg "true"
gset bool   use_theme_colors "false"
gset bool   use_theme_background "false"