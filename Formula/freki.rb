class Freki < Formula
  desc "Interactive coding-CLI agent with its own agent loop, tools, and swappable model provider"
  homepage "https://github.com/lixni/Freki"
  version "0.0.1"
  url "https://github.com/lixni/freki-releases/releases/download/freki-v0.0.1/freki-osx-arm64.tar.gz"
  sha256 "e3747b7d2ad88e559707a4f3676dddc6516ec21cbc75d8a1d0e6f1ef950f1942"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"freki"
  end

  test do
    assert_predicate bin/"freki", :exist?
  end
end
