class Freki < Formula
  desc "Interactive coding-CLI agent with its own agent loop, tools, and swappable model provider"
  homepage "https://github.com/lixni/Freki"
  version "0.0.8"
  url "https://github.com/lixni/freki-releases/releases/download/freki-v0.0.8/freki-osx-arm64.tar.gz"
  sha256 "c1e26555986fed9750423caf810cce807d0d6f1a360424a17e15b1d6323be0b9"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"freki"
  end

  test do
    assert_predicate bin/"freki", :exist?
  end
end
