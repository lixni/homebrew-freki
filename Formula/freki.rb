class Freki < Formula
  desc "Interactive coding-CLI agent with its own agent loop, tools, and swappable model provider"
  homepage "https://github.com/lixni/Freki"
  version "0.0.7"
  url "https://github.com/lixni/freki-releases/releases/download/freki-v0.0.7/freki-osx-arm64.tar.gz"
  sha256 "b96c6d675982cca9e9010b2d8a0d3ff9002e789c277934946c3dabc12980dcb2"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"freki"
  end

  test do
    assert_predicate bin/"freki", :exist?
  end
end
