cask "claude-deja-vu" do
  version "0.1.2"
  sha256 "2e5e5bdac67bf3978685138f0df3d6f50083f97a44d3cfa7d05c904e4c23d1ea"

  url "https://github.com/xsreality/claude-deja-vu/releases/download/v#{version}/ClaudeDejaVu-#{version}.dmg"
  name "Claude Déjà Vu"
  desc "Search and browse your Claude Code conversation history"
  homepage "https://github.com/xsreality/claude-deja-vu"

  depends_on macos: :sonoma

  app "DejaVu.app"

  caveats <<~EOS
    DejaVu.app is ad-hoc signed rather than notarised, so macOS quarantines it on
    download. The first launch needs:
      System Settings > Privacy & Security > "Open Anyway"
    or, to skip that: xattr -dr com.apple.quarantine "/Applications/DejaVu.app"
  EOS

  zap trash: [
    "~/Library/Application Support/DejaVu",
  ]
end
