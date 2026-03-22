cask "glazewm-indicator" do
  version "0.1.0"
  sha256 "55da4b4ada5b1e3fd82cd48d2505c4a7cf59b4e35f831616cdd25f80dde484e5"

  url "https://github.com/vrognas/GlazeWMIndicator/releases/download/v#{version}/GlazeWMIndicator-#{version}.zip"
  name "GlazeWM Indicator"
  desc "Native macOS menu bar indicator for GlazeWM workspaces"
  homepage "https://github.com/vrognas/GlazeWMIndicator"

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
