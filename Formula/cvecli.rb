class Cvecli < Formula
  desc "Search CVEs using public APIs"
  homepage "https://github.com/DebaA17/CVE-scanner-cli"
  url "https://github.com/DebaA17/CVE-scanner-cli/releases/download/v1.2.2/cvecli-1.2.2-macos.zip"
  sha256 "a03b256eae53fb833e835d03e1dab3603ff87da7364839a9aaa83e49012d63b8"
  license "MIT"

  on_linux do
    url "https://github.com/DebaA17/CVE-scanner-cli/releases/download/v1.2.2/cvecli-1.2.2-linux.zip"
    sha256 "c3cf53653ef1b365a095684ad823905325bd2ff0ec2a9039fe1294b77eb7ce85"
  end

  def install
    libexec.install "cvecli"
    (bin/"cvecli").write_env_script libexec/"cvecli", CVECLI_VERSION: version.to_s
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cvecli --version")
  end
end
