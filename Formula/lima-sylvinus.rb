class LimaSylvinus < Formula
  desc "Linux virtual machines, with sshfs.readonlyNames and host deletion relay"
  homepage "https://github.com/sylvinus/lima"
  url "https://github.com/sylvinus/lima/archive/refs/tags/v2.3.0-sylvinus.2.tar.gz"
  sha256 "4bfcaeb4087a746687f0a241152a7f318e805ab78e11d2361bb13be7092a0150"
  license "Apache-2.0"
  version "2.3.0-sylvinus.2"

  depends_on "go" => :build

  on_linux do
    depends_on "qemu"
  end

  conflicts_with "lima", because: "both install `limactl`"

  def install
    # The tarball has no git tags, so the version must be passed explicitly.
    system "make", "native", "VERSION=#{version}"

    bin.install Dir["_output/bin/*"]
    libexec.install Dir["_output/libexec/*"]
    share.install Dir["_output/share/*"]

    generate_completions_from_executable(bin/"limactl", shell_parameter_format: :cobra)
  end

  test do
    info = JSON.parse shell_output("#{bin}/limactl info")
    assert_includes info["vmTypes"], "qemu"
    assert_includes info["vmTypes"], "vz" if OS.mac?
    template_names = info["templates"].map { |x| x["name"] }
    assert_includes template_names, "default"
  end
end
