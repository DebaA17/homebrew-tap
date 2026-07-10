class Omnifetch < Formula
  desc "Downloader for public files, articles, and media"
  homepage "https://github.com/DebaA17/omnifetch"
  url "https://github.com/DebaA17/omnifetch/archive/refs/tags/v1.0.6.tar.gz"
  sha256 "4a0ddb3a3eccf73b17585c6b3e71d1da2343621c7dee674407164963547126e6"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X omnifetch/internal/version.Current=v#{version}"
    system "go", "build", "-trimpath", "-ldflags", ldflags, "-o", bin/"omnifetch", "./cmd/omnifetch"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/omnifetch -v")
  end
end
