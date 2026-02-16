cask "bespec" do
  arch arm: "silicon", intel: "intel"

  # The exact string of your release tag (without the 'v')
  version "1.6.3"
  
  # PASTE YOUR LINUX HASHES HERE
  if Hardware::CPU.intel?
    sha256 "d10a49d4deaed59de47fda8d54b3d2e42ec9b029dd71f60251c6db0e2fa13ad4"
  else
    sha256 "6f1ccbc67c0b4f69f50d6687b7f4b12322006b9baf2b503aa69708b3b44ba54e"
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
