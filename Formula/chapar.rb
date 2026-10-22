class Chapar < Formula
  desc "Kernel-level split-tunneling utility for macOS to route domestic traffic outside VPN tunnels"
  homepage "https://github.com/sinnaa/chapar"
  version "0.1.0"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/sinnaa/chapar/releases/download/v0.1.0/chapar-v0.1.0-aarch64-apple-darwin.tar.gz"
    sha256 "c8e3f189fc43f0de862f5ad90f52f28a786c8a2adaca2539c5b66612989b0d92"
  else
    url "https://github.com/sinnaa/chapar/releases/download/v0.1.0/chapar-v0.1.0-x86_64-apple-darwin.tar.gz"
    sha256 "255462a58aa2b26907927eddde2074837f9344f634c567a9b77410c7dc85193d"
  end

  def install
    bin.install "chapar"
  end

  def caveats
    <<~EOS
      Chapar requires administrator privileges to modify the macOS routing table:
        sudo chapar start
        sudo chapar stop
    EOS
  end

  test do
    assert_match "chapar 0.1.0", shell_output("#{bin}/chapar --version")
  end
end
