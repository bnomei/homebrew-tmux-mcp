class TmuxMcpRs < Formula
  desc "Tmux MCP server in Rust"
  homepage "https://github.com/bnomei/tmux-mcp"
  version "0.5.0"
  license "MIT"

  checksums = {
    aarch64_apple_darwin: "1e70a11f4ddec30b1a586b0c5b40f24524515ebdfa81d304f6cf4638981b8599",
    x86_64_apple_darwin: "0ae4275fab23ce1a5cca805239c99271e67c864005b77b9f624dc772a12318de",
    aarch64_unknown_linux_musl: "7aecc33bbb7c4a37c0a3896d0a248a64a27e59fc142ecd3393a2ec9397c9a3dd",
    x86_64_unknown_linux_musl: "f1f88bafbbcb4fffce84539dd7cc8c4d2a6adc5a46d9892fe9dd3961db746b0f",
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
