#!/usr/bin/env bash
# Base16 Default - Gnome Terminal color scheme install script
# Chris Kempson (http://chriskempson.com)

[[ -z "$PROFILE_NAME" ]] && PROFILE_NAME="Base 16 Default"
[[ -z "$PROFILE_SLUG" ]] && PROFILE_SLUG="base-16-default"
#[[ -z "$GCONFTOOL" ]] && GCONFTOOL=gconftool
[[ -z "$GCONFTOOL" ]] && GCONFTOOL=/usr/bin/gconftool-2
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
gset string palette "#115511551155:#220022002200:#330033003300:#550055005500:#bb00bb00bb00:#dd00dd00dd00:#ee00ee00ee00:#ff55ff55ff55:#aacc44114422:#dd2288444455:#ff44bbff7755:#9900aa995599:#7755bb55aaaa:#66aa99ffbb55:#aaaa775599ff:#88ff55553366"
gset string background_color "#115511551155"
gset string foreground_color "#dd00dd00dd00"
gset string bold_color "#dd00dd00dd00"
gset bool   bold_color_same_as_fg "true"
gset bool   use_theme_colors "false"
gset bool   use_theme_background "false"
