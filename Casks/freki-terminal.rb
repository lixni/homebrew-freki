cask "freki-terminal" do
  version "0.0.4"

  on_arm do
    url "https://github.com/lixni/freki-releases/releases/download/freki-terminal-v0.0.4/freki-terminal-macos-arm64.app.zip"
    sha256 "1499833fa2d29e526daf395e193d5ac130f171fb28e252aa4e1ad9e753d7e72b"
  end
  on_intel do
    url "https://github.com/lixni/freki-releases/releases/download/freki-terminal-v0.0.4/freki-terminal-macos-x86_64.app.zip"
    sha256 "5c34adf6322a206e4d49a6f27e341ff324b457b557003d4627536b935acb667a"
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
