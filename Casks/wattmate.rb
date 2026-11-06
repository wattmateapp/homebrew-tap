cask "wattmate" do
  version "1.7"
  sha256 "22c2a08a693c2f14ed6c45ab61348d9f332c9dc5d75811fc76158268775ce089"

  url "https://wattmateapp.com/download/WattMate-#{version}.dmg"
  name "WattMate"
  desc "Menu bar monitor showing battery use per app and minutes saved by quitting"
  homepage "https://wattmateapp.com/"

  livecheck do
    url "https://wattmateapp.com/appcast.xml"
    # The appcast carries both the build number (sparkle:version) and the version
    # (shortVersionString); without this line livecheck prints "1.7 ==> 1.7,16"
    # and reports the cask as outdated on every run.
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "WattMate.app"

  zap trash: [
    "~/Library/Application Support/WattMate",
    "~/Library/Caches/com.wattmate.app",
    "~/Library/HTTPStorages/com.wattmate.app",
    "~/Library/Preferences/com.wattmate.app.plist",
  ]
end
