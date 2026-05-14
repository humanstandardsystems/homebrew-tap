class Lens < Formula
  desc "Token-usage and cache-health tracker for Claude Code"
  homepage "https://github.com/humanstandardsystems/lens"
  version "0.3.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/humanstandardsystems/lens/releases/download/v0.3.2/lens-darwin-arm64.tar.gz"
      sha256 "464249d578e6c32503bb5f481b3eeabe87a61b9db83d496b08f01464dd1c1799"
    end
    on_intel do
      url "https://github.com/humanstandardsystems/lens/releases/download/v0.3.2/lens-darwin-amd64.tar.gz"
      sha256 "aba51a04100fb6125948099caaccf3c03f580dee949a92da75b8073a0608d362"
    end
  end

  def install
    bin.install "lens"
  end

  def caveats
    <<~EOS
      Next step:
        lens init

      This prompts for your Anthropic weekly reset day/time, then wires
      the statusline and PostToolUse hook into ~/.claude/settings.json.
      No Claude Code restart needed.

      To uninstall cleanly:
        lens uninstall      # unwires settings.json, asks about ~/.lens/
        brew uninstall lens
    EOS
  end

  test do
    assert_match "lens", shell_output("#{bin}/lens --help")
  end
end
