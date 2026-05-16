class Lens < Formula
  desc "Token-usage and cache-health tracker for Claude Code"
  homepage "https://github.com/humanstandardsystems/lens"
  version "0.3.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/humanstandardsystems/lens/releases/download/v0.3.3/lens-darwin-arm64.tar.gz"
      sha256 "cc5438e04eda1ac5270230139eacb5108abf2609b42ac8e64b8a512ac1e79a8d"
    end
    on_intel do
      url "https://github.com/humanstandardsystems/lens/releases/download/v0.3.3/lens-darwin-amd64.tar.gz"
      sha256 "1e147f88a77134018ffa32c01f9dd9613493096d96a1812499b0dcbea0c6d312"
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
