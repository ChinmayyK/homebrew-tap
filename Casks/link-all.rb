cask "link-all" do
  version "2.0.1"
  sha256 "141bd9feed877607fc4911dd937ee3ced84605440d440d97414ad45f9eaa58e5"

  url "https://github.com/ChinmayyK/Link-All/releases/download/v#{version}/LinkAll.dmg"
  name "Link All"
  desc "Share clipboard, files and links between your devices"
  homepage "https://github.com/ChinmayyK/Link-All"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Link All.app"

  zap trash: [
    "~/Library/Application Support/linkall",
    "~/Library/Preferences/app.linkall.mac.plist",
  ]
end
