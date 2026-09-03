class Freki < Formula
  desc "Interactive coding-CLI agent with its own agent loop, tools, and swappable model provider"
  homepage "https://github.com/lixni/Freki"
  version "0.0.6"
  url "https://github.com/lixni/freki-releases/releases/download/freki-v0.0.6/freki-osx-arm64.tar.gz"
  sha256 "c350c8e1e146b6cc706b667cf06a33c5fb4c13d4a80fd6ea4650abcd057c2b9d"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"freki"
  end

  test do
    assert_predicate bin/"freki", :exist?
  end
end
