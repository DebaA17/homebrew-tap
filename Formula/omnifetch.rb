class Omnifetch < Formula
  desc "CLI downloader for public files, articles, and media"
  homepage "https://github.com/DebaA17/omnifetch"
  url "https://github.com/DebaA17/omnifetch/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "999e19860002de37206d848532dd852e6954a3e269589620d8f4d5c9555a0c8d"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X omnifetch/internal/version.Current=v#{version}"
    system "go", "build", "-trimpath", "-ldflags", ldflags, "-o", bin/"omnifetch", "./cmd/omnifetch"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/omnifetch -v").strip
  end
end