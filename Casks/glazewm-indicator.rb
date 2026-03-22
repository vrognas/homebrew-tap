cask "glazewm-indicator" do
  version "0.1.5"
  sha256 "d7eece493f831b12173b0fc78c6fdd611b8beae7f788e163314c38ace659aa9f"

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
