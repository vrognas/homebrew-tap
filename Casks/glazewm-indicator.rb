cask "glazewm-indicator" do
  version "0.1.4"
  sha256 "bf2fc9292ccc4e362896d6b4e2eaa14df890d7f8464ccc2a5abe88192f65f1f6"

  url "https://github.com/vrognas/glazewm-indicator/releases/download/v#{version}/glazewm-indicator-#{version}.zip"
  name "GlazeWM Indicator"
  desc "Native macOS menu bar indicator for GlazeWM workspaces"
  homepage "https://github.com/vrognas/glazewm-indicator"

  depends_on macos: ">= :ventura"

  app "GlazeWM Indicator.app"
  binary "#{appdir}/GlazeWM Indicator.app/Contents/MacOS/GlazeWMIndicator", target: "glazewm-indicator"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/GlazeWM Indicator.app"]
  end

  zap trash: [
    "~/Library/Preferences/com.vrognas.glazewm-indicator.plist",
  ]
end
