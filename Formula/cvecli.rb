class Cvecli < Formula
  desc "Command-line tool to search CVEs using public APIs"
  homepage "https://github.com/DebaA17/CVE-scanner-cli"
  version "1.1.1"
  license "MIT"

  on_macos do
    url "https://github.com/DebaA17/CVE-scanner-cli/releases/download/v1.1.1/cvecli-1.1.1-macos.zip"
    sha256 "d4dd0e2661eb0de7372dabc3adc8161902e20be47766860a1fa22084fc112c39"
  end

  on_linux do
    url "https://github.com/DebaA17/CVE-scanner-cli/releases/download/v1.1.1/cvecli-1.1.1-linux.zip"
    sha256 "afef0ebd5b0c2002ca9c0dc818f6c7689e0d6177a3f537eaaf08097a14d7a3c0"
  end

  def install
    libexec.install "cvecli"
    (bin/"cvecli").write_env_script libexec/"cvecli", CVECLI_VERSION: version.to_s
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cvecli --version").strip
  end
end
