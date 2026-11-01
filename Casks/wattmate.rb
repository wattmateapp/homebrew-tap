cask "wattmate" do
  version "1.6"
  sha256 "8b8788d7ddb66df84f385b93e9d58fe0637a3e85c0491a9d68ce51d97144e952"

  url "https://wattmateapp.com/download/WattMate-#{version}.dmg"
  name "WattMate"
  desc "Menu bar monitor showing battery use per app and minutes saved by quitting"
  homepage "https://wattmateapp.com/"

  livecheck do
    url "https://wattmateapp.com/appcast.xml"
    # The appcast carries both the build number (sparkle:version) and the version
    # (shortVersionString); without this line livecheck prints "1.6 ==> 1.6,15"
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
