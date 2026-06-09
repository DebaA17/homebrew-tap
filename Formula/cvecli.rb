class Cvecli < Formula
  desc "Command-line tool to search CVEs using public APIs"
  homepage "https://github.com/DebaA17/CVE-scanner-cli"
  version "1.2.0"
  license "MIT"

  on_macos do
    url "https://github.com/DebaA17/CVE-scanner-cli/releases/download/v1.2.0/cvecli-1.2.0-macos.zip"
    sha256 "9a002a98922799fe67a3df1dcd2a06722e4bdf5dd4cb6fa879ce3e25a92b7c90"
  end

  on_linux do
    url "https://github.com/DebaA17/CVE-scanner-cli/releases/download/v1.2.0/cvecli-1.2.0-linux.zip"
    sha256 "297d860eb153b738ee2bad1bb4d5fffee684341a6cfb8f313971326127498729"
  end

  def install
    libexec.install "cvecli"
    (bin/"cvecli").write_env_script libexec/"cvecli", CVECLI_VERSION: version.to_s
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cvecli --version").strip
  end
end

