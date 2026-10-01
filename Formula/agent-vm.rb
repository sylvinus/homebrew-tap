class AgentVm < Formula
  desc "Run AI coding agents in a disposable Linux VM per project"
  homepage "https://www.agent-vm.org/"
  url "https://github.com/sylvinus/agent-vm/releases/download/v0.2.0/agent-vm-0.2.0.tar.gz"
  sha256 "787077a51c66578c9d963a5b34c20c294551ec9d6ddc7d26f147aec7451a3958"
  license "MIT"

  def install
    libexec.install "agent-vm.sh", "agent-vm.setup.sh", "lib", "runtime.example.sh"
    bin.install_symlink libexec/"agent-vm.sh" => "agent-vm"
  end

  def caveats
    <<~EOS
      Build the base VM once (it offers to install Lima):
        agent-vm setup
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/agent-vm version").strip
  end
end
