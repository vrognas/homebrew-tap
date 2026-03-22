cask "glazewm-indicator" do
  version "0.1.6"
  sha256 "51c8879c58926916d30cd7ae4340e811b055783fceab119904da3448853db654"

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
