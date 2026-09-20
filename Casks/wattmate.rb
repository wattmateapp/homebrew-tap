cask "wattmate" do
  version "1.3.1"
  sha256 "1709daeebd282687a652e15126dac81459c76892b5a3b135b35351eccede8360"

  url "https://wattmateapp.com/download/WattMate-#{version}.dmg",
      verified: "wattmateapp.com/download/"
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
  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "WattMate.app"

  zap trash: [
    "~/Library/Application Support/WattMate",
    "~/Library/Caches/com.wattmate.app",
    "~/Library/HTTPStorages/com.wattmate.app",
    "~/Library/Preferences/com.wattmate.app.plist",
  ]
end
