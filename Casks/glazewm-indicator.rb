cask "glazewm-indicator" do
  version "0.1.7"
  sha256 "29c93cfc813110de9650499df0e9719c96f5b2a2a83aaccb61388d0932ae071c"

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
