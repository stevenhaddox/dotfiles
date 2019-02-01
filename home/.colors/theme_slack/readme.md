# Customized Slack Themes

Started as wanting a dark theme for Slack for Mojave OS X dark mode and quickly
become a conglomerate of several repose pieced together. These files are an
attempt to cause local read-only access from CSS files instead of remote raw
gists that can be compromised.

The original theme didn't work fully and seemed to be based on [widget's slack-black-theme](https://github.com/widget-/slack-black-theme).

The fork that works is from [caiceA's
slack-black-theme](https://github.com/caiceA/slack-black-theme).

You'll find the base CSS from caiceA's theme in:
`~/.colors/theme_slack/black/base.caiceA.css` which is symlinked to:
`~/.colors/theme_slack/black/base.css`

I've copied the `customCustomCSS` settings into: `caiseA.custom.css`

Then I've created a personalized CSS for overrides in: `overrides.custom.css`

I modified his script changes to source these files from my local theme
directory so it's easier to re-link them upon upgrades of the `Slack.app`.
