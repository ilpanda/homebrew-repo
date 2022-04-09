# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Rabbit < Formula
  homepage "https://github.com/ilpanda/rabbit"
  url "https://github.com/ilpanda/rabbit/releases/download/1.0.0/rabbit.zip"
  version "1.0.0"
  sha256 "7a5afeb8b62b7f05670111abf2497c2c7e34caf367b15aa87a052d6e450a8672"

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
