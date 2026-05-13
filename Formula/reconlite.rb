class Reconlite < Formula
  include Language::Python::Virtualenv

  desc "Advanced DNS & domain reconnaissance tool"
  homepage "https://github.com/DebaA17/reconlite"
  url "https://github.com/DebaA17/reconlite/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "35efad1d1aad65bf70163961e98df2128a31b3b1781d0e03c0c0443d180ab0db"
  license "MIT"

  depends_on "python@3.13"

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/25/ee/6caf7a40c36a1220410afe15a1cc64993a1f864871f698c0f93acb72842a/certifi-2026.4.22.tar.gz"
    sha256 "8d455352a37b71bf76a79caa83a3d6c25afee4a385d632127b6afb3963f1c580"
  end

  resource "ddgs" do
    url "https://files.pythonhosted.org/packages/e6/31/4b8ad86fd97fba7cff52d9d7c59a002ddf9ef0ba8fa4d70b925190471c33/ddgs-9.14.2.tar.gz"
    sha256 "a9e6ad5bd7357707163d1cf03dbbcc9413a5820738ba5176efe36955b32aab38"
  end

  resource "dnspython" do
    url "https://files.pythonhosted.org/packages/8c/8b/57666417c0f90f08bcafa776861060426765fdb422eb10212086fb811d26/dnspython-2.8.0.tar.gz"
    sha256 "181d3c6996452cb1189c4046c61599b84a5a86e099562ffde77d26984ff26d0f"
  end

  resource "ipwhois" do
    url "https://files.pythonhosted.org/packages/ed/e9/f1dd533366b5809494d0ee0d39db2e0806388c52c25b1dcff2e0794a51d8/ipwhois-1.3.0.tar.gz"
    sha256 "11d59784b6350210c33e12301cc50cd1ebfbb0b12a7b0f97916e11d6661c4d5d"
  end

  resource "python-whois" do
    url "https://files.pythonhosted.org/packages/f1/0c/537914eca91ee5ff281309a5ca71da23c0c975cd6658668a44d3fdcf1cc4/python_whois-0.9.6.tar.gz"
    sha256 "2e6de7b6d70e305a85f4859cd17781ee3f0da3a02a8e94f23cb4cdcd2e400bfa"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/43/b8/7a707d60fea4c49094e40262cc0e2ca6c768cca21587e34d3f705afec47e/requests-2.34.0.tar.gz"
    sha256 "7d62fe92f50eb82c529b0916bb445afa1531a566fc8f35ffdc64446e771b856a"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/e4/e8/6ff5e6bc22095cfc59b6ea711b687e2b7ed4bdb373f7eeec370a97d7392f/urllib3-1.26.20.tar.gz"
    sha256 "40c2dc0c681e47eb8f90e7e27bf6ff7df2e677421fd46756da1161c39ca70d32"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/reconlite --version")
  end
end
