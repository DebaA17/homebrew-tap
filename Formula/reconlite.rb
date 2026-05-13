class Reconlite < Formula
  include Language::Python::Virtualenv

  desc "Advanced DNS & domain reconnaissance tool"
  homepage "https://github.com/DebaA17/reconlite"
  url "https://github.com/DebaA17/reconlite/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "35efad1d1aad65bf70163961e98df2128a31b3b1781d0e03c0c0443d180ab0db"
  license "MIT"

  depends_on "python@3.13"

  def install
    venv = virtualenv_create(libexec, "python3.13")
    system libexec/"bin/pip", "install", "-r", "requirements.txt"

    libexec.install "reconlite.py"

    (bin/"reconlite").write <<~EOS
      #!/bin/bash
      exec "#{libexec}/bin/python3" "#{libexec}/reconlite.py" "$@"
    EOS
    chmod 0755, bin/"reconlite"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/reconlite --version")
  end
end
