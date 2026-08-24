class Freki < Formula
  desc "Interactive coding-CLI agent with its own agent loop, tools, and swappable model provider"
  homepage "https://github.com/lixni/Freki"
  version "0.0.3"
  url "https://github.com/lixni/freki-releases/releases/download/freki-v0.0.3/freki-osx-arm64.tar.gz"
  sha256 "c4d2a58ffcee5e1362a9861f57698473b9e023638b210d26e2af3c649d712be7"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"freki"
  end

  test do
    assert_predicate bin/"freki", :exist?
  end
end
