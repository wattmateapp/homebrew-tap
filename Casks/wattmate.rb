cask "wattmate" do
  version "1.4"
  sha256 "1060c1fa004ff83756c56dcdd5a264b0928e92769b6a59adea0c4c61349a3e7f"

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
