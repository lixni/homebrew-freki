class Freki < Formula
  desc "Interactive coding-CLI agent with its own agent loop, tools, and swappable model provider"
  homepage "https://github.com/lixni/Freki"
  version "0.0.2"
  url "https://github.com/lixni/freki-releases/releases/download/freki-v0.0.2/freki-osx-arm64.tar.gz"
  sha256 "8f613954bdbd8e1dca0cd414cc5a8e5598e6549930bb12c81f67f2dc4b025136"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"freki"
  end

  test do
    assert_predicate bin/"freki", :exist?
  end
end
