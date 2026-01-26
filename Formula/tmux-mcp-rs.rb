class TmuxMcpRs < Formula
  desc "Tmux MCP server in Rust"
  homepage "https://github.com/bnomei/tmux-mcp"
  version "0.1.2"
  license "MIT"

  checksums = {
    aarch64_apple_darwin: "107cfa43d740f231b3973a8cb24629a6de277dcb6c93363b7eddb950287ac0a3",
    x86_64_apple_darwin: "89975e41b9c0c199e6b0a375ab05b8494cf29c1b0db39b72202e9d0b2c08f2d9",
    aarch64_unknown_linux_musl: "ec9145b9e2690da7c208c7a12cab98aa5767b04ddfd1903387b5a0ba2e4caab6",
    x86_64_unknown_linux_musl: "8d1c9e0e6b99490776ab7bfbcb9a54d4ec0cc8462697e0ed8bed2cc2e0ffe4f4",
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
