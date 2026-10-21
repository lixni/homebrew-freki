class FrekiTerminal < Formula
  desc "Desktop workspace for code and coding agents: split panes, tabs, files, git, terminals"
  homepage "https://github.com/lixni/freki.terminal"
  version "0.0.1"

  on_macos do
    on_arm do
      url "https://github.com/lixni/freki-releases/releases/download/freki-terminal-v0.0.1/freki-terminal-macos-arm64.tar.gz"
      sha256 "780e6ac59bd86749db4ac89495cb952f96deef9f9199c30ed414b6bb04d3fa59"
    end
    on_intel do
      url "https://github.com/lixni/freki-releases/releases/download/freki-terminal-v0.0.1/freki-terminal-macos-x86_64.tar.gz"
      sha256 "64ebaf4c86d809e24f8184fc27406ed76d30fdb59e1462ac782328b992751dc5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lixni/freki-releases/releases/download/freki-terminal-v0.0.1/freki-terminal-linux-x86_64.tar.gz"
      sha256 "a9cbae97f122666c8d8ceb89b64607baf24f4039c3904a872757e8c0870ac031"
    end
  end

  def install
    bin.install "freki-terminal"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/freki-terminal --version")
  end
end
