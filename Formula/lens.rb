class Lens < Formula
  desc "Token-usage and cache-health tracker for Claude Code"
  homepage "https://github.com/humanstandardsystems/lens"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/humanstandardsystems/lens/releases/download/v0.3.0/lens-darwin-arm64.tar.gz"
      sha256 "ddb953121769e6aa19438560c8a04d083cf7958b9710a445aa85bbe9302a2c27"
    end
    on_intel do
      url "https://github.com/humanstandardsystems/lens/releases/download/v0.3.0/lens-darwin-amd64.tar.gz"
      sha256 "3f826848f3cd38930a36399dce4d23d545164dd0989f9cb3f9fcf2fc9d7a6cf9"
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
