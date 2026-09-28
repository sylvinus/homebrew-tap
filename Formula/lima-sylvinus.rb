class LimaSylvinus < Formula
  desc "Linux virtual machines, with sshfs.readonlyNames and host deletion relay"
  homepage "https://github.com/sylvinus/lima"
  url "https://github.com/sylvinus/lima/archive/refs/tags/v2.3.0-sylvinus.1.tar.gz"
  sha256 "2309cecca1fff38ca7d8cf7401bbdcc304012462dcb0c34773e85fc2afc0bf29"
  license "Apache-2.0"
  version "2.3.0-sylvinus.1"

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
