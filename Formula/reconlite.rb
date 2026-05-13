class Reconlite < Formula
  desc "Advanced DNS & Domain Intelligence Gathering Tool"
  homepage "https://github.com/DebaA17/reconlite"
  version "1.0.0"
  license "MIT"

  url "https://github.com/DebaA17/reconlite/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "35efad1d1aad65bf70163961e98df2128a31b3b1781d0e03c0c0443d180ab0db"

  depends_on "python@3.13"

  def install
    # Install Python dependencies
    system "#{Formula["python@3.13"].opt_bin}/python3.13", "-m", "pip", "install", "-r", "requirements.txt"

    # Install reconlite.py to libexec
    libexec.install "reconlite.py"
    libexec.install "README.md"
    libexec.install "LICENSE"

    # Create bin wrapper script
    (bin/"reconlite").write_env_script libexec/"reconlite.py",
      :PYTHONUNBUFFERED => "1"
  end

  def post_install
    # Verify installation
    system "#{bin}/reconlite", "--version"
  end

  test do
    assert_match "ReconLite 1.0.0", shell_output("#{bin}/reconlite --version").strip
    assert_match "usage:", shell_output("#{bin}/reconlite --help").strip
  end
end
