class FrekiHall < Formula
  desc "Local dashboard for Freki sessions, kanban, and orchestration"
  homepage "https://github.com/lixni/Freki.Hall"
  url "https://github.com/lixni/freki-releases/releases/download/freki-hall-v0.0.4/freki-hall-osx-arm64.tar.gz"
  version "0.0.4"
  sha256 "c00003091a77ce0a743ae5a552dfe59517b4bc55254faec18d8e3a7819013510"

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
