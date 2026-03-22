cask "glazewm-indicator" do
  version "0.1.3"
  sha256 "50b2978ab156525ed1d4113f84fb2205d59d9048710fafc269dcba6ab4e492a6"

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
    "~/Library/Preferences/com.vrognas.glazewm-indicator.plist",
  ]
end
