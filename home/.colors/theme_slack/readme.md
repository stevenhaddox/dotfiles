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

I modified his script changes to source these files from the raw content in
this repo rather than a gist I don't have control over:

```
// Append to the file: /Applications/Slack.app/Contents/Resources/app.asar.unpacked/src/static/ssb-interop.js

// Custom black theme for Slack, src:
// https://github.com/caiceA/slack-black-theme
// Slack Night Mood theme
document.addEventListener("DOMContentLoaded", function() {
    // Then get its webviews
    let webviews = document.querySelectorAll(".TeamView webview");
    // Fetch our CSS in parallel ahead of time
    const cssPath = 'https://raw.githubusercontent.com/stevenhaddox/dotfiles/master/home/.colors/theme_slack/black/base.caiceA.css';
    // const cssPath = '/Users/steven/.colors/theme_slack/black/base.css';
    const themeCustomCssPath = 'https://raw.githubusercontent.com/stevenhaddox/dotfiles/master/home/.colors/theme_slack/black/caiseA.custom.css'

    // Self: GET cssPath and return response.text
    let cssPromise = fetch(cssPath).then(response => response.text());
    let customCustomCSS = fetch(themeCustomCssPath).then(response => response.text());


// $("div").each(function(){

// 	$this.css("color","white");
// });
    // Insert a style tag into the wrapper view
    cssPromise.then(css => {
        let s = document.createElement('style');
        s.type = 'text/css';
        s.innerHTML = css + customCustomCSS;
        document.head.appendChild(s);
    });
    // Wait for each webview to load
    webviews.forEach(webview => {
        webview.addEventListener('ipc-message', message => {
            if (message.channel == 'didFinishLoading')
            // Finally add the CSS into the webview
                cssPromise.then(css => {
                let script = `
let s = document.createElement('style');
s.type = 'text/css';
s.id = 'slack-custom-css';
s.innerHTML = \`${css + customCustomCSS}\`;
document.head.appendChild(s);
`
                webview.executeJavaScript(script);
            })
        });
    });
});
```
