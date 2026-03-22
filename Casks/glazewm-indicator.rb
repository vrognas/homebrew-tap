cask "glazewm-indicator" do
  version "0.1.2"
  sha256 "8a59ce3f15ddb1b572b54653faa56414f1c133e15a48f66b1bd0a2db2530613e"

  url "https://github.com/vrognas/glazewm-indicator/releases/download/v#{version}/glazewm-indicator-#{version}.zip"
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
