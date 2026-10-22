class Chapar < Formula
  desc "Kernel-level split-tunneling utility for macOS to route domestic traffic outside VPN tunnels"
  homepage "https://github.com/sinnaa/chapar"
  url "https://github.com/sinnaa/chapar.git", branch: "main"
  version "0.1.0"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
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
