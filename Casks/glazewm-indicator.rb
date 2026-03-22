cask "glazewm-indicator" do
  version "0.1.1"
  sha256 "42a19848d269713f59deb417eee4c1b97ef6192931458a1ebd269c98ee331319"

  url "https://github.com/vrognas/glazewm-indicator/releases/download/v#{version}/GlazeWMIndicator-#{version}.zip"
  name "GlazeWM Indicator"
  desc "Native macOS menu bar indicator for GlazeWM workspaces"
  homepage "https://github.com/vrognas/glazewm-indicator"

  depends_on macos: ">= :ventura"

  app "GlazeWM Indicator.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/GlazeWM Indicator.app"]
  end

  zap trash: [
    "~/Library/Preferences/io.glzr.glazewm-indicator.plist",
  ]
end
