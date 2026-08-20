class FrekiHall < Formula
  desc "Local web dashboard for Freki: chat sessions, kanban board, autonomous orchestrator"
  homepage "https://github.com/lixni/Freki.Hall"
  version "0.0.3"
  url "https://github.com/lixni/freki-releases/releases/download/freki-hall-v0.0.3/freki-hall-osx-arm64.tar.gz"
  sha256 "62222d4da7ebe9d7f5b8fe7cf413ff6a143e7c9561d4343b5396dd9cc59b4db3"

  depends_on "lixni/freki/freki"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"Freki.Hall" => "freki-hall"
  end

  test do
    assert_predicate bin/"freki-hall", :exist?
  end
end
