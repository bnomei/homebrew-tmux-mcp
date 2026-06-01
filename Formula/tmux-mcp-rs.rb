class TmuxMcpRs < Formula
  desc "Tmux MCP server in Rust"
  homepage "https://github.com/bnomei/tmux-mcp"
  version "0.4.0"
  license "MIT"

  checksums = {
    aarch64_apple_darwin: "016dcfecf1439b0e0e38039ff9e8bbd76beadcc62d1f7967f77fb82658f09f53",
    x86_64_apple_darwin: "bae07920b1a3baa5053687cdc88729985d0a767aabb839ca1a69e565c310e892",
    aarch64_unknown_linux_musl: "a5d2e0334469000f5dbb5e9a6215f76212fcc813fa818024e01de9f84e2a2b5e",
    x86_64_unknown_linux_musl: "748e1b84663df891921070641c969b5c5abed08b25e17bc44b697f2f60c08188",
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
