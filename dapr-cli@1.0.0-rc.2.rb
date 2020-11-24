# ------------------------------------------------------------
# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.
# ------------------------------------------------------------

class DaprCliAT100Rc2 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.0.0-rc.2'
  url "https://github.com/dapr/cli/archive/v1.0.0-rc.2.tar.gz"
  sha256 "d0936abcd283ab0cf145efbfe7d5cf523c0d5f334748a0c120b82918015058d2"

  depends_on "go" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.0.0-rc.2"
    cellar :any_skip_relocation
    sha256 "eaf28ad90613ec081618b188bd5b96813cd65580541f7489ac54604379c33086" => :catalina
  end

  def install
    system "go", "build", "-ldflags", "-X main.version=#{version} -X main.apiVersion=1.0", "-o", "./cli"
    bin.install "cli" => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

