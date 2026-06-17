class Cvecli < Formula
  desc "Command-line tool to search CVEs using public APIs"
  homepage "https://github.com/DebaA17/CVE-scanner-cli"
  version "1.2.1"
  license "MIT"

  on_macos do
    url "https://github.com/DebaA17/CVE-scanner-cli/releases/download/v1.2.1/cvecli-1.2.1-macos.zip"
    sha256 "f616bc4a9a2447c6ebfb07f3362e0ef2153f2e98841d3311ad23fb85d672efdc"
  end

  on_linux do
    url "https://github.com/DebaA17/CVE-scanner-cli/releases/download/v1.2.1/cvecli-1.2.1-linux.zip"
    sha256 "c8d1cbe980b713bb19158bdc1f9ec0ae5b1b980c7d6ac1408a9bd49a046e92d0"
  end

  def install
    libexec.install "cvecli"
    (bin/"cvecli").write_env_script libexec/"cvecli", CVECLI_VERSION: version.to_s
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cvecli --version").strip
  end
end

