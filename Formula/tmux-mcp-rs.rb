class TmuxMcpRs < Formula
  desc "Tmux MCP server in Rust"
  homepage "https://github.com/bnomei/tmux-mcp"
  version "0.1.1"
  license "MIT"

  checksums = {
    aarch64_apple_darwin: "dac9754562db6da60c79c84ccfea344676672dfa08146b9cca309484f69e7d78",
    x86_64_apple_darwin: "66e6fedddb955ef7b063a5fa3e3ca4044f2d6dfc4289ede55155db0bc4b8959a",
    aarch64_unknown_linux_musl: "97f773fad35bb479cf8914aa288c94cd125f4e45428b54e5c61a5b75c8347f41",
    x86_64_unknown_linux_musl: "0723f8d57221d60b5024eaa754601ea40ac1413f4f4ffb983969a6690fe268e2",
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
