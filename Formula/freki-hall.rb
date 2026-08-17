class FrekiHall < Formula
  desc "Local web dashboard for Freki: chat sessions, kanban board, autonomous orchestrator"
  homepage "https://github.com/lixni/Freki.Hall"
  version "0.0.1"
  url "https://github.com/lixni/freki-releases/releases/download/freki-hall-v0.0.1/freki-hall-osx-arm64.tar.gz"
  sha256 "f2316634e9fcf70085b2c97ad0b44df03cf69e9b962c2769eef5dc3fba38e2e4"

  depends_on "lixni/freki/freki"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"Freki.Hall" => "freki-hall"
  end

  test do
    assert_predicate bin/"freki-hall", :exist?
  end
end
