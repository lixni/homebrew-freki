class FrekiHall < Formula
  desc "Local dashboard for Freki sessions, kanban, and orchestration"
  homepage "https://github.com/lixni/Freki.Hall"
  url "https://github.com/lixni/freki-releases/releases/download/freki-hall-v0.0.3/freki-hall-osx-arm64.tar.gz"
  version "0.0.3"
  sha256 "62222d4da7ebe9d7f5b8fe7cf413ff6a143e7c9561d4343b5396dd9cc59b4db3"

  depends_on "lixni/freki/freki"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"Freki.Hall" => "freki-hall"
  end

  service do
    run [opt_bin/"freki-hall"]
    environment_variables PATH: std_service_path_env
    keep_alive true
    log_path var/"log/freki-hall.log"
    error_log_path var/"log/freki-hall.log"
    working_dir var
  end

  test do
    assert_path_exists bin/"freki-hall"
  end
end
