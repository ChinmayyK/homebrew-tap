cask "link-all" do
  version "2.0.2"
  sha256 "f7aa63351e99aea013b972603a26b2b0753da0ee6ce8f0bc87437216c68db074"

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

  # Link All isn't notarized yet, so clear the quarantine flag to skip the Gatekeeper prompt.
  postflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "/Applications/Link All.app"],
        must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/linkall",
    "~/Library/Preferences/app.linkall.mac.plist",
  ]
end
