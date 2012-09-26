#!/usr/bin/env bash
# Base16 Tomorrow - Gnome Terminal color scheme install script
# Chris Kempson (http://chriskempson.com)

[[ -z "$PROFILE_NAME" ]] && PROFILE_NAME="Base 16 Tomorrow"
[[ -z "$PROFILE_SLUG" ]] && PROFILE_SLUG="base-16-tomorrow"
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
gset string palette "#11dd11ff2211:#228822aa22ee:#337733bb4411:#996699889966:#bb44bb77bb44:#cc55cc88cc66:#ee00ee00ee00:#ffffffffffff:#cccc66666666:#ddee993355ff:#ff00cc667744:#bb55bbdd6688:#88aabbeebb77:#8811aa22bbee:#bb229944bbbb:#aa33668855aa"
gset string background_color "#11dd11ff2211"
gset string foreground_color "#cc55cc88cc66"
gset string bold_color "#cc55cc88cc66"
gset bool   bold_color_same_as_fg "true"
gset bool   use_theme_colors "false"
gset bool   use_theme_background "false"