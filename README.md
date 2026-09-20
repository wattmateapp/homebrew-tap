# Homebrew tap for WattMate

[WattMate](https://wattmateapp.com/) is a macOS menu bar app that shows which apps are
using your Mac's battery, in watts, and how many minutes you get back by quitting one.
macOS 14 or later, Apple silicon.

```sh
brew install --cask wattmateapp/tap/wattmate
```

The cask downloads the signed and notarized disk image from
[wattmateapp.com/download](https://wattmateapp.com/download/) and verifies its checksum.
Updates come through the app itself (Sparkle); `brew upgrade` follows the same feed.

To remove the app and its data:

```sh
brew uninstall --zap --cask wattmate
```

Source of the cask: `Scripts/homebrew/wattmate.rb` in the WattMate repository; the two
lines that change per release are `version` and `sha256`.
