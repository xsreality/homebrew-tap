class ClaudeDejaVu < Formula
  desc "Search and browse your Claude Code conversation history"
  homepage "https://github.com/xsreality/claude-deja-vu"
  url "https://github.com/xsreality/claude-deja-vu/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "678100aa204e1465c34862fa4f1df8791fc2420baf2e31c748bb52800d40ce0d"
  license "MIT"

  depends_on macos: :sonoma

  def install
    system "./Scripts/make-app.sh"
    prefix.install "build/DejaVu.app"
    (bin/"dejavu").write <<~SH
      #!/bin/bash
      exec open -a "#{prefix}/DejaVu.app"
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
