cask "freki-terminal" do
  version "0.0.7"

  on_arm do
    url "https://github.com/lixni/freki-releases/releases/download/freki-terminal-v0.0.7/freki-terminal-macos-arm64.app.zip"
    sha256 "a2d811d38ea7e4ad8af807c9c1c2bf6880e00d28e593b2a77e472fc2383de890"
  end
  on_intel do
    url "https://github.com/lixni/freki-releases/releases/download/freki-terminal-v0.0.7/freki-terminal-macos-x86_64.app.zip"
    sha256 "a40074f889d9bca34c74b45c17c30562a54a90809e65bcfb5e5ef1f179232559"
  end

  name "Freki"
  desc "Desktop workspace for code and coding agents: split panes, tabs, files, git, terminals"
  homepage "https://github.com/lixni/freki.terminal"

  depends_on macos: :big_sur

  app "Freki.app"
  binary "#{appdir}/Freki.app/Contents/MacOS/freki", target: "freki-terminal"

  # Ad-hoc signed, not notarized: without this Gatekeeper refuses to
  # open an app downloaded by Homebrew.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Freki.app"]
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
