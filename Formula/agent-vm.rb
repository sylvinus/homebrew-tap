class AgentVm < Formula
  desc "Run AI coding agents in a disposable Linux VM per project"
  homepage "https://www.agent-vm.org/"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sylvinus/agent-vm/releases/download/v0.3.0/agent-vm-0.3.0-darwin-arm64.tar.gz"
      sha256 "282b6233dbccd82c8da77fcc442f0e51b66fb89168ed66006f29f196a28b554c"
    end
    on_intel do
      url "https://github.com/sylvinus/agent-vm/releases/download/v0.3.0/agent-vm-0.3.0-darwin-amd64.tar.gz"
      sha256 "ab8bdc7e0c0ebd318b2600727d3e032a783ccb8f6622c9b3466b73afec7fe801"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sylvinus/agent-vm/releases/download/v0.3.0/agent-vm-0.3.0-linux-arm64.tar.gz"
      sha256 "5f09f63011a756d38b9be9ab4d2eb20695e0cb7376bee02a592010e7100f50c9"
    end
    on_intel do
      url "https://github.com/sylvinus/agent-vm/releases/download/v0.3.0/agent-vm-0.3.0-linux-amd64.tar.gz"
      sha256 "938a9173c6389367f9b7b6f4cd071fd1e45a4f2a6aadd68810938105a17b324c"
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
