# ------------------------------------------------------------
# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.
# ------------------------------------------------------------

class DaprCli < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '0.7.0'
  url "https://github.com/dapr/cli/archive/v0.7.0.tar.gz"
  sha256 "96850bf46a35483416bbb2d96b5cc0bc534986071d90ca759fb76aa30f5846d1"

  depends_on "go" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v0.7.0"
    cellar :any_skip_relocation
    sha256 "fac59affdf1a55c7aacc850ba497c001795513a1e9f4be592fe3f2ed02723be7" => :catalina
  end

  def install
    system "go", "build", "-ldflags", "-X main.version=#{version} -X main.apiVersion=1.0", "-o", "./cli"
    bin.install "cli" => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

