# ------------------------------------------------------------
# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.
# ------------------------------------------------------------

class DaprCli < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '0.9.0'
  url "https://github.com/dapr/cli/archive/v0.9.0.tar.gz"
  sha256 "91955867387f2004374027d9302a75746d67334f59cbc5f17c87ee52d71f27fe"

  depends_on "go" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v0.9.0"
    cellar :any_skip_relocation
    sha256 "53ad2edfa9aa3dc0cd5f130fa077c4803cae70556f99a7e79673276bd28b1506" => :catalina
  end

  def install
    system "go", "build", "-ldflags", "-X main.version=#{version} -X main.apiVersion=1.0", "-o", "./cli"
    bin.install "cli" => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

