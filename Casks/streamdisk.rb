cask "streamdisk" do
  version "0.1.0"
  sha256 "39dd9046927f2eeb22d341d68103be38c0b5fc3d946bd93ce8436fd37dee2ec2"

  url "https://github.com/ChinmayyK/streamdisk/releases/download/v#{version}/StreamDisk.dmg"
  name "StreamDisk"
  desc "Google Drive as a disk in Finder, streamed on demand"
  homepage "https://streamdisk.chinmaykudalkar.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "StreamDisk.app"

  # StreamDisk isn't notarized yet, so clear the quarantine flag to skip the Gatekeeper prompt.
  postflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "/Applications/StreamDisk.app"],
        must_succeed: false
  end

  uninstall quit: "app.streamdisk"

  zap trash: "~/Library/Application Support/StreamDisk"
end
