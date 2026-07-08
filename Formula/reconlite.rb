class Reconlite < Formula
  include Language::Python::Virtualenv

  desc "DNS and domain reconnaissance tool"
  homepage "https://github.com/DebaA17/reconlite"
  url "https://github.com/DebaA17/reconlite/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "3b205b0a7c9b962b32e323cd3e0b4e510b40fb68913473c562527f1924f63625"
  license "MIT"

  depends_on "python@3.13"

  depends_on "pkg-config" => :build
  depends_on "libxml2"
  depends_on "libxslt"
  depends_on "rust" => :build

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/25/ee/6caf7a40c36a1220410afe15a1cc64993a1f864871f698c0f93acb72842a/certifi-2026.4.22.tar.gz"
    sha256 "8d455352a37b71bf76a79caa83a3d6c25afee4a385d632127b6afb3963f1c580"
  end

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/e7/a1/67fe25fac3c7642725500a3f6cfe5821ad557c3abb11c9d20d12c7008d3e/charset_normalizer-3.4.7.tar.gz"
    sha256 "ae89db9e5f98a11a4bf50407d4363e7b09b31e55bc117b4f7d80aab97ba009e5"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/bb/63/f9e1ea081ce35720d8b92acde70daaedace594dc93b693c869e0d5910718/click-8.3.3.tar.gz"
    sha256 "398329ad4837b2ff7cbe1dd166a4c0f8900c3ca3a218de04466f38f6497f18a2"
  end

  resource "defusedxml" do
    url "https://files.pythonhosted.org/packages/0f/d5/c66da9b79e5bdb124974bfe172b4daf3c984ebd9c2a06e2b8a4dc7331c72/defusedxml-0.7.1.tar.gz"
    sha256 "1bb3032db185915b62d7c6209c5a8792be6a32ab2fedacc84e01b52c51aa3e69"
  end

  resource "dnspython" do
    url "https://files.pythonhosted.org/packages/8c/8b/57666417c0f90f08bcafa776861060426765fdb422eb10212086fb811d26/dnspython-2.8.0.tar.gz"
    sha256 "181d3c6996452cb1189c4046c61599b84a5a86e099562ffde77d26984ff26d0f"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/82/77/7b3966d0b9d1d31a36ddf1746926a11dface89a83409bf1483f0237aa758/idna-3.15.tar.gz"
    sha256 "ca962446ea538f7092a95e057da437618e886f4d349216d2b1e294abfdb65fdc"
  end

  resource "ipwhois" do
    url "https://files.pythonhosted.org/packages/ed/e9/f1dd533366b5809494d0ee0d39db2e0806388c52c25b1dcff2e0794a51d8/ipwhois-1.3.0.tar.gz"
    sha256 "11d59784b6350210c33e12301cc50cd1ebfbb0b12a7b0f97916e11d6661c4d5d"
  end

  resource "lxml" do
    url "https://files.pythonhosted.org/packages/28/30/9abc9e34c657c33834eaf6cd02124c61bdf5944d802aa48e69be8da3585d/lxml-6.1.0.tar.gz"
    sha256 "bfd57d8008c4965709a919c3e9a98f76c2c7cb319086b3d26858250620023b13"
  end

  resource "python-dateutil" do
    url "https://files.pythonhosted.org/packages/66/c0/0c8b6ad9f17a802ee498c46e004a0eb49bc148f2fd230864601a86dcf6db/python-dateutil-2.9.0.post0.tar.gz"
    sha256 "37dd54208da7e1cd875388217d5e00ebd4179249f90fb72437e91a35459a0ad3"
  end

  resource "python-whois" do
    url "https://files.pythonhosted.org/packages/f1/0c/537914eca91ee5ff281309a5ca71da23c0c975cd6658668a44d3fdcf1cc4/python_whois-0.9.6.tar.gz"
    sha256 "2e6de7b6d70e305a85f4859cd17781ee3f0da3a02a8e94f23cb4cdcd2e400bfa"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/43/b8/7a707d60fea4c49094e40262cc0e2ca6c768cca21587e34d3f705afec47e/requests-2.34.0.tar.gz"
    sha256 "7d62fe92f50eb82c529b0916bb445afa1531a566fc8f35ffdc64446e771b856a"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/94/e7/b2c673351809dca68a0e064b6af791aa332cf192da575fd474ed7d6f16a2/six-1.17.0.tar.gz"
    sha256 "ff70335d468e7eb6ec65b95b99d3a2836546063f63acc5171de367e834932a81"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/e4/e8/6ff5e6bc22095cfc59b6ea711b687e2b7ed4bdb373f7eeec370a97d7392f/urllib3-1.26.20.tar.gz"
    sha256 "40c2dc0c681e47eb8f90e7e27bf6ff7df2e677421fd46756da1161c39ca70d32"
  end

  def install
    venv = virtualenv_create(libexec, "python3.13")
    # Install maturin first so primp can build
    venv.pip_install "maturin>=1.5,<2.0"
    venv.pip_install resources

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
