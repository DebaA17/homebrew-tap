class Omnifetch < Formula
  desc "Downloader for public files, articles, and media"
  homepage "https://github.com/DebaA17/omnifetch"
  url "https://github.com/DebaA17/omnifetch/archive/refs/tags/v1.0.7.tar.gz"
  sha256 "051029e5bbdc60a9b851b2e1cf2322c1f012e43172e2af4a189fc25b9e774402"
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
