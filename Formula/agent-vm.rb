class AgentVm < Formula
  desc "Run AI coding agents in a disposable Linux VM per project"
  homepage "https://www.agent-vm.org/"
  url "https://github.com/sylvinus/agent-vm/releases/download/v0.2.1/agent-vm-0.2.1.tar.gz"
  sha256 "6d92fd15bfeef9efedc563d67ed7fac335bf799f635c757beffdb765d54fdae9"
  license "MIT"
  version "0.2.1"

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
