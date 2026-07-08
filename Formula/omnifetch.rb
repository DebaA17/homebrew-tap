class Omnifetch < Formula
  desc "Downloader for public files, articles, and media"
  homepage "https://github.com/DebaA17/omnifetch"
  url "https://github.com/DebaA17/omnifetch/archive/refs/tags/v1.0.3.tar.gz"
  sha256 "6b86ad09434a814fc5363580a516063bf513ad655937a2e86756a2b928c02715"
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
