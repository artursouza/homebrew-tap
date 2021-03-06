# ------------------------------------------------------------
# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.
# ------------------------------------------------------------

class DaprCliAT130Rc1 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.3.0-rc.1'
  url "https://github.com/dapr/cli/archive/v1.3.0-rc.1.tar.gz"
  sha256 "3c827cf10e0bcc4ca64de1475d96e1157a0170627694e1431c2aaca5adcec8a3"

  depends_on "go" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.3.0-rc.1"
    sha256 cellar :any_skip_relocation, catalina: "d350e382644533d749bb79f414ef75be4c1cde720ba7bde9dc2ccddf083beace"
  end

  def install
    system "go", "build", "-ldflags", "-X main.version=#{version} -X main.apiVersion=1.0", "-o", "./cli"
    bin.install "cli" => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

