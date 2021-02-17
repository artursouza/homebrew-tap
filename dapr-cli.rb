# ------------------------------------------------------------
# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.
# ------------------------------------------------------------

class DaprCli < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.0.0'
  url "https://github.com/dapr/cli/archive/v1.0.0.tar.gz"
  sha256 "9d641ef939f45fbd1bc0529a8190a2ad8a193d851821b9e763aaa8748887ea49"

  depends_on "go" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.0.0"
    cellar :any_skip_relocation
    sha256 "139f58d6addb8601ab6558fb614be1eecd21a96cd8670528ea9696dcae3f65c2" => :catalina
  end

  def install
    system "go", "build", "-ldflags", "-X main.version=#{version} -X main.apiVersion=1.0", "-o", "./cli"
    bin.install "cli" => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

