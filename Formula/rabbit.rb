# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Rabbit < Formula
  homepage "https://github.com/ilpanda/rabbit"
  url "https://github.com/ilpanda/rabbit/releases/download/1.6.0/rabbit.zip"
  version "1.6.0"
  sha256 "8aad2413345a986d5147d86c79f1122323f01d6a11c1e4d56ead3c1d80c41641"

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
