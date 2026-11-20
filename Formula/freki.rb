class Freki < Formula
  desc "Interactive coding-CLI agent with its own agent loop, tools, and swappable model provider"
  homepage "https://github.com/lixni/Freki"
  version "0.0.9"
  url "https://github.com/lixni/freki-releases/releases/download/freki-v0.0.9/freki-osx-arm64.tar.gz"
  sha256 "45b73d1266d1e99d93a8340061cb309a10ea94ac92a610675a8eb00c24c34b9a"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"freki"
  end

  test do
    assert_predicate bin/"freki", :exist?
  end
end
