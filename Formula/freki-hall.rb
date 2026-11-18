class FrekiHall < Formula
  desc "Local dashboard for Freki sessions, kanban, and orchestration"
  homepage "https://github.com/lixni/Freki.Hall"
  url "https://github.com/lixni/freki-releases/releases/download/freki-hall-v0.0.5/freki-hall-osx-arm64.tar.gz"
  version "0.0.5"
  sha256 "41f172603c3575c7a204100cac67ba54ea905444d048c0e21ac65288c7202470"

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
