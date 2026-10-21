cask "freki-terminal" do
  version "0.0.3"

  on_arm do
    url "https://github.com/lixni/freki-releases/releases/download/freki-terminal-v0.0.3/freki-terminal-macos-arm64.app.zip"
    sha256 "3e3e2bc2dce6e1d3288ee5f2ef7ed000138115b212b514be5b1b7f0ca8d64697"
  end
  on_intel do
    url "https://github.com/lixni/freki-releases/releases/download/freki-terminal-v0.0.3/freki-terminal-macos-x86_64.app.zip"
    sha256 "85bdabe86560070a8f4758704532fcefa7237fa2e19da9e017c8daea00b57730"
  end

  name "Freki"
  desc "Desktop workspace for code and coding agents: split panes, tabs, files, git, terminals"
  homepage "https://github.com/lixni/freki.terminal"

  depends_on macos: ">= :big_sur"

  app "Freki.app"
  binary "#{appdir}/Freki.app/Contents/MacOS/freki", target: "freki-terminal"

  # Ad-hoc signed, not notarized: without this Gatekeeper refuses to
  # open an app downloaded by Homebrew.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Freki.app"]
  end
end
