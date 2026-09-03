class Freki < Formula
  desc "Interactive coding-CLI agent with its own agent loop, tools, and swappable model provider"
  homepage "https://github.com/lixni/Freki"
  version "0.0.5"
  url "https://github.com/lixni/freki-releases/releases/download/freki-v0.0.5/freki-osx-arm64.tar.gz"
  sha256 "4a2275c533eb1437b4c8ee4995618778215322ae5ce91870fe3d5979899cfe4b"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"freki"
  end

  test do
    assert_predicate bin/"freki", :exist?
  end
end
