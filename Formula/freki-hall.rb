class FrekiHall < Formula
  desc "Local web dashboard for Freki: chat sessions, kanban board, autonomous orchestrator"
  homepage "https://github.com/lixni/Freki.Hall"
  version "0.0.2"
  url "https://github.com/lixni/freki-releases/releases/download/freki-hall-v0.0.2/freki-hall-osx-arm64.tar.gz"
  sha256 "1c3752e6ace32af0e927edf4d1b051e59ffa0e342e71deab9b128fc0824d6b77"

  depends_on "lixni/freki/freki"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"Freki.Hall" => "freki-hall"
  end

  test do
    assert_predicate bin/"freki-hall", :exist?
  end
end
