cask "wattmate" do
  version "1.5"
  sha256 "7f3b0a2013b2942d59a5b043903854db7e7c097914438c325756d96bc3ef5c29"

  url "https://wattmateapp.com/download/WattMate-#{version}.dmg"
  name "WattMate"
  desc "Menu bar monitor showing battery use per app and minutes saved by quitting"
  homepage "https://wattmateapp.com/"

  livecheck do
    url "https://wattmateapp.com/appcast.xml"
    # Appcast несёт и номер сборки (sparkle:version = 12), и версию
    # (shortVersionString = 1.3.1); без этой строки livecheck печатает
    # «1.3.1 ==> 1.3.1,12» и считает формулу устаревшей на каждом прогоне.
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
