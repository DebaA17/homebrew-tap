class Cvecli < Formula
  desc "Command-line tool to search CVEs using public APIs"
  homepage "https://github.com/DebaA17/CVE-scanner-cli"
  version "1.1.0"
  license "MIT"

  on_macos do
    url "https://github.com/DebaA17/CVE-scanner-cli/releases/download/v1.1.0/cvecli-1.1.0-macos.zip"
    sha256 "eb550cfbc4c7e075de604ff76b86abe9f6aa867051b6a22fd4c1473c072df368"
  end

  on_linux do
    url "https://github.com/DebaA17/CVE-scanner-cli/releases/download/v1.1.0/cvecli-1.1.0-linux.zip"
    sha256 "25d954e9c5726866ece802f8cebd655c2f3093625fb848408463d373bc461dbc"
  end

  def install
    bin.install "cvecli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cvecli --version").strip
  end
end
