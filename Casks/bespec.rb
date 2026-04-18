cask "bespec" do
  arch arm: "silicon", intel: "intel"

  # The exact string of your release tag (without the 'v')
  version "1.8.0"
  
  # PASTE YOUR MAC HASHES HERE
  if Hardware::CPU.intel?
    sha256 "9ceae250da0d6fdf5fe773343bd415e06dd26dec8b685d9aa54a209ba5ff02b2"
  else
    sha256 "29fe0d289c9acbafe72a1e958ef893cdc50e826c054cb3e1b99222f5559c9f2e"
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
