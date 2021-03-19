class Seventeenlands < Formula
  include Language::Python::Virtualenv

  desc "Utility to upload MTG Arena data to 17Lands.com"
  homepage "https://www.17lands.com/"
  url "https://files.pythonhosted.org/packages/59/a6/efe5295132c738b8182e89a5d51423e5fb7e68019858ac069379a93e1c93/seventeenlands-0.1.23.tar.gz"
  sha256 "fc51d3c5f5059803be681319d32c97af8fe4f6e7a8368e0b9b88ccbfce94231f"
  license "GPL-3.0"

  depends_on "python@3.9"

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/e6/de/879cf857ae6f890dfa23c3d6239814c5471936b618c8fb0c8732ad5da885/certifi-2020.11.8.tar.gz"
    sha256 "f05def092c44fbf25834a51509ef6e631dc19765ab8a57b4e7ab85531f0a9cf4"
  end

  resource "chardet" do
    url "https://files.pythonhosted.org/packages/fc/bb/a5768c230f9ddb03acc9ef3f0d4a3cf93462473795d18e9535498c8f929d/chardet-3.0.4.tar.gz"
    sha256 "84ab92ed1c4d4f16916e05906b6b75a6c0fb5db821cc65e70cbd64a3e2a5eaae"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/ea/b7/e0e3c1c467636186c39925827be42f16fee389dc404ac29e930e9136be70/idna-2.10.tar.gz"
    sha256 "b307872f855b18632ce0c21c5e45be78c0ea7ae4c15c828c20788b26921eb3f6"
  end

  resource "python-dateutil" do
    url "https://files.pythonhosted.org/packages/be/ed/5bbc91f03fa4c839c4c7360375da77f9659af5f7086b7a7bdda65771c8e0/python-dateutil-2.8.1.tar.gz"
    sha256 "73ebfe9dbf22e832286dafa60473e4cd239f8592f699aa5adaf10050e6e1823c"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/9f/14/4a6542a078773957aa83101336375c9597e6fe5889d20abda9c38f9f3ff2/requests-2.25.0.tar.gz"
    sha256 "7f1a0b932f4a60a1a65caa4263921bb7d9ee911957e0ae4a23a6dd08185ad5f8"
  end

  resource "seventeenlands" do
    url "https://files.pythonhosted.org/packages/59/a6/efe5295132c738b8182e89a5d51423e5fb7e68019858ac069379a93e1c93/seventeenlands-0.1.23.tar.gz"
    sha256 "fc51d3c5f5059803be681319d32c97af8fe4f6e7a8368e0b9b88ccbfce94231f"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/6b/34/415834bfdafca3c5f451532e8a8d9ba89a21c9743a0c59fbd0205c7f9426/six-1.15.0.tar.gz"
    sha256 "30639c035cdb23534cd4aa2dd52c3bf48f06e5f4a941509c8bafd8ce11080259"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/29/e6/d1a1d78c439cad688757b70f26c50a53332167c364edb0134cadd280e234/urllib3-1.26.2.tar.gz"
    sha256 "19188f96923873c92ccb987120ec4acaa12f0461fa9ce5d3d0772bc965a39e08"
  end

  def install
    virtualenv_install_with_resources(:using => "python@3.9")
    bin.install_symlink prefix/"libexec/bin/seventeenlands"
  end

  plist_options manual: "seventeenlands"

  def plist
    <<~EOS
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
      <dict>
        <key>KeepAlive</key>
        <true/>
        <key>Label</key>
        <string>17Lands</string>
        <key>ProgramArguments</key>
        <array>
          <string>/bin/sh</string>
          <string>-c</string>
          <string>#{prefix}/libexec/bin/seventeenlands</string>
        </array>
        <key>RunAtLoad</key>
        <true/>
      </dict>
      </plist>
    EOS
  end

  def startup_script; <<-EOS.undent
    #!/bin/sh
    #{prefix}/libexec/bin/seventeenlands
    EOS
  end

  test do
    system "#{bin}/seventeenlands", "--help"
  end

end
