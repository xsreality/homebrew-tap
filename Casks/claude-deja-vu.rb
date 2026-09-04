cask "claude-deja-vu" do
  version "0.1.1"
  sha256 "e0f0365365b072abf554d884effb066a06c48a7d37ff17ebf9f9cccb07ab3a69"

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
