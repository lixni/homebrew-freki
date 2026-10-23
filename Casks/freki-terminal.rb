cask "freki-terminal" do
  version "0.0.6"

  on_arm do
    url "https://github.com/lixni/freki-releases/releases/download/freki-terminal-v0.0.6/freki-terminal-macos-arm64.app.zip"
    sha256 "1f23bcbf0856c40180475c314491cd2a548a0c520176ad11e6d3103eec3dd49b"
  end
  on_intel do
    url "https://github.com/lixni/freki-releases/releases/download/freki-terminal-v0.0.6/freki-terminal-macos-x86_64.app.zip"
    sha256 "367190de1e7fa7ae18f344fb0b16eb9a9a0cdbb27a87e9b1e9801fad469b3e06"
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
end
