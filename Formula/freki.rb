class Freki < Formula
  desc "Interactive coding-CLI agent with its own agent loop, tools, and swappable model provider"
  homepage "https://github.com/lixni/Freki"
  version "0.0.4"
  url "https://github.com/lixni/freki-releases/releases/download/freki-v0.0.4/freki-osx-arm64.tar.gz"
  sha256 "455101cf248c0023f85f770e0477fc8226b7899c34ee4e7ea6911c3e6f51bb7b"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"freki"
  end

  test do
    assert_predicate bin/"freki", :exist?
  end
end
