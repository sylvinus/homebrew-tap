class AgentVm < Formula
  desc "Run AI coding agents in a disposable Linux VM per project"
  homepage "https://www.agent-vm.org/"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sylvinus/agent-vm/releases/download/v0.3.1/agent-vm-0.3.1-darwin-arm64.tar.gz"
      sha256 "f79c408f47d78d7d58a6509cb92e333f3b0b252af84e4ce4c1436b3e0ca350e6"
    end
    on_intel do
      url "https://github.com/sylvinus/agent-vm/releases/download/v0.3.1/agent-vm-0.3.1-darwin-amd64.tar.gz"
      sha256 "1a8310a6c469b3e00f2661fac6d6261b49a8a6238df3199134df6deb81022eaa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sylvinus/agent-vm/releases/download/v0.3.1/agent-vm-0.3.1-linux-arm64.tar.gz"
      sha256 "c032a705941c77055ef01f5eefaf083f89343d31ea5f166919a338f2ddf40c94"
    end
    on_intel do
      url "https://github.com/sylvinus/agent-vm/releases/download/v0.3.1/agent-vm-0.3.1-linux-amd64.tar.gz"
      sha256 "a20e5d7cf5989fd7ad4559159e09fb55ada4a7fab8564b0334ecca4ed9110d3b"
    end
  end

  def install
    bin.install "agent-vm"
  end

  def caveats
    <<~EOS
      Build the base VM once:
        agent-vm setup
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/agent-vm version").strip
  end
end
