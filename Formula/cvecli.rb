class Cvecli < Formula
  desc "Search CVEs using public APIs"
  homepage "https://github.com/DebaA17/CVE-scanner-cli"
  license "MIT"

  if OS.mac?
    url "https://github.com/DebaA17/CVE-scanner-cli/releases/download/v1.4.0/cvecli-1.4.0-macos.zip"
    sha256 "sha256:b8cb19cb7b12b9098186579043316fadf4855bae3af3187a836d1c752c71f9da"
  else
    url "https://github.com/DebaA17/CVE-scanner-cli/releases/download/v1.4.0/cvecli-1.4.0-linux.zip"
    sha256 "sha256:738088a6c4cbc4c255debaae9195608eca2ed6b3231908ce50d3299c922571d2"
  end

  def install
    libexec.install "cvecli"
    (bin/"cvecli").write_env_script libexec/"cvecli", CVECLI_VERSION: version.to_s
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cvecli --version")
  end
end
