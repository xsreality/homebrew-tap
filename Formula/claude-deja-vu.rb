class ClaudeDejaVu < Formula
  desc "Search and browse your Claude Code conversation history"
  homepage "https://github.com/xsreality/claude-deja-vu"
  url "https://github.com/xsreality/claude-deja-vu/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "0f9dee22359a773fb65a2250b219553c7fd377f7204c0479f453a8275fffa92c"
  license "MIT"

  depends_on macos: :sonoma

  def install
    system "./Scripts/make-app.sh"
    prefix.install "build/DejaVu.app"
    (bin/"dejavu").write <<~SH
      #!/bin/bash
      exec open -a "#{opt_prefix}/DejaVu.app"
    SH
  end

  def caveats
    <<~EOS
      Run `dejavu` to open the app. To keep it in Launchpad:
        ln -s "#{opt_prefix}/DejaVu.app" ~/Applications/
    EOS
  end

  test do
    assert_predicate prefix/"DejaVu.app/Contents/MacOS/DejaVu", :executable?
  end
end
