class Cvecli < Formula
  desc "Search CVEs using public APIs"
  homepage "https://github.com/DebaA17/CVE-scanner-cli"
  license "MIT"

  if OS.mac?
    url "https://github.com/DebaA17/CVE-scanner-cli/releases/download/v1.3.0/cvecli-1.3.0-linux.zip"
    sha256 "sha256:7d877adc355d324706d61ec57d06a5b5f7a9be5f1cd6bfc12f45874a2748dd98"
  else
    url "https://github.com/DebaA17/CVE-scanner-cli/releases/download/v1.3.0/cvecli-1.3.0-macos.zip"
    sha256 "sha256:ec322ae4882806b1c6903de0a85aaaa601f809fb33a64f90a59cdefb754daa1b"
  end

  def install
    libexec.install "cvecli"
    (bin/"cvecli").write_env_script libexec/"cvecli", CVECLI_VERSION: version.to_s
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cvecli --version")
  end
end
