cask "freki-terminal" do
  version "0.0.14"

  on_arm do
    url "https://github.com/lixni/freki-releases/releases/download/freki-terminal-v0.0.14/freki-terminal-macos-arm64.app.zip"
    sha256 "51784c40c3ec21b0181bcbf75f6bd3edbcd105df5b57ab510af85b28c8d805ee"
  end
  on_intel do
    url "https://github.com/lixni/freki-releases/releases/download/freki-terminal-v0.0.14/freki-terminal-macos-x86_64.app.zip"
    sha256 "f13c5590794416d2a853edd9327452f7d94cac0b808174fa45942133b2133b6e"
  end

  name "Freki Terminal"
  desc "Desktop workspace for code and coding agents: split panes, tabs, files, git, terminals"
  homepage "https://github.com/lixni/freki.terminal"

  depends_on macos: :big_sur

  app "Freki Terminal.app"
  binary "#{appdir}/Freki Terminal.app/Contents/MacOS/freki-terminal"

  # Ad-hoc signed, not notarized: without this Gatekeeper refuses to
  # open an app downloaded by Homebrew.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Freki Terminal.app"]
  end

  # Launch at login is a LaunchAgent whose file is the setting. It's
  # in zap, not uninstall, because uninstall also runs on upgrade and
  # reinstall, which would turn the setting off.
  zap launchctl: "dev.freki.terminal.login",
      trash:     "~/Library/LaunchAgents/dev.freki.terminal.login.plist"

  caveats <<~EOS
    Launch at login (Settings > General) stays set up after brew uninstall.
    Turn it off in Freki before uninstalling, or uninstall with:
      brew uninstall --zap freki-terminal
  EOS
end
