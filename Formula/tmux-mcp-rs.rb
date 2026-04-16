class TmuxMcpRs < Formula
  desc "Tmux MCP server in Rust"
  homepage "https://github.com/bnomei/tmux-mcp"
  version "0.2.1"
  license "MIT"

  checksums = {
    aarch64_apple_darwin: "97b9440c1f68add11d0b679c7bd7f9d1c470dd4ca6e49ab2044b8cd29d32d39f",
    x86_64_apple_darwin: "d8a7694ab1a9bf2d03abfbd1ce2f061c374637195a8d11762a5c92057fce467a",
    aarch64_unknown_linux_musl: "dfc60d450956a4bb010bff578b412fd325b7b753ffbc2e9ec2f812465c8ec36c",
    x86_64_unknown_linux_musl: "90fb85d6a6f66d0068aee65129c254e522df40df90c5772816332cdd3597bbc9",
  }

  on_macos do
    on_arm do
      url "https://github.com/bnomei/tmux-mcp/releases/download/v#{version}/tmux-mcp-rs-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 checksums[:aarch64_apple_darwin]
    end
    on_intel do
      url "https://github.com/bnomei/tmux-mcp/releases/download/v#{version}/tmux-mcp-rs-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 checksums[:x86_64_apple_darwin]
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bnomei/tmux-mcp/releases/download/v#{version}/tmux-mcp-rs-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 checksums[:aarch64_unknown_linux_musl]
    end
    on_intel do
      url "https://github.com/bnomei/tmux-mcp/releases/download/v#{version}/tmux-mcp-rs-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 checksums[:x86_64_unknown_linux_musl]
    end
  end

  def install
    bin.install "tmux-mcp-rs"
  end

  test do
    assert_match "tmux-mcp-rs", shell_output("#{bin}/tmux-mcp-rs --help")
  end
end
