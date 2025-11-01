# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Rabbit < Formula
  homepage "https://github.com/ilpanda/rabbit"
  url "https://github.com/ilpanda/rabbit/releases/download/1.23.0/rabbit.zip"
  version "1.23.0"
  sha256 "f6179a6b7f4add4be526a983dcc7ddbd22ea499498fe5f1de712b02e1d0006e8"

  depends_on "openjdk"

  def install
    rm_f Dir["bin/*.bat"]
    libexec.install %w[bin lib]
    (bin/"rabbit").write_env_script libexec/"bin/rabbit",
      :JAVA_HOME => "${JAVA_HOME:-#{Formula["openjdk"].opt_prefix}}"
  end

  test do
    output = shell_output("#{bin}/rabbit--help")
    assert_includes output, "Usage: rabbit"
  end
end
