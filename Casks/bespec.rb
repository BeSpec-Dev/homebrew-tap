cask "bespec" do
  arch arm: "silicon", intel: "intel"

  # The exact string of your release tag (without the 'v')
  version "1.7.0"
  
  # PASTE YOUR LINUX HASHES HERE
  if Hardware::CPU.intel?
    sha256 "a3ed60f3f1274c83fa15ab88cc4e4f06ef255d646fdc22a4677ce4dc835e267e"
  else
    sha256 "6e5b074c80d803d5752c4a257fc9e8f2d4cd55c10dc06c46003555540ec8c98c"
  end

  # This URL builder assumes your GitHub release artifacts follow the pattern:
  # bespec-v1.7.0-macos-silicon.dmg
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
