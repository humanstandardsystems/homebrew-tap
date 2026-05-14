class Lens < Formula
  desc "Token-usage and cache-health tracker for Claude Code"
  homepage "https://github.com/humanstandardsystems/lens"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/humanstandardsystems/lens/releases/download/v0.3.1/lens-darwin-arm64.tar.gz"
      sha256 "547a812e3e469579983ae6b32ae86ed37dbaf64c76e25df66020cc18afc11654"
    end
    on_intel do
      url "https://github.com/humanstandardsystems/lens/releases/download/v0.3.1/lens-darwin-amd64.tar.gz"
      sha256 "2f5f464f140310901246289d0bdeb601a8263d116e467b985023e1844f0f3820"
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
