cask "bespec" do
  arch arm: "silicon", intel: "intel"

  # The exact string of your release tag (without the 'v')
  version "1.6.3"
  
  # PASTE YOUR LINUX HASHES HERE
  if Hardware::CPU.intel?
    sha256 "2b29ef608b1c91659ec54d3ed4143e0e11b5e70042139cb1c214fb5a55f6e9d5"
  else
    sha256 "e3fcd34e2e3b497e5cf5ece0c9e33b0b9e2726608cb58c82f98cb3c191c7ecc9"
  end

  # This URL builder assumes your GitHub release artifacts follow the pattern:
  # bespec-v1.6.3-rc1-macos-silicon.dmg
  url "https://github.com/bespec-dev/bespec/releases/download/v#{version}/bespec-v#{version}-macos-#{arch}.dmg"
  
  name "BeSpec"
  desc "Audio spectrum analyzer"
  homepage "https://github.com/bespec-dev/bespec"

  app "BeSpec.app"

  # Removes config/logs if user uninstalls
  zap trash: [
    "~/Library/Application Support/BeSpec",
    "~/Library/Saved Application State/com.bespec-dev.bespec.savedState",
  ]
end
