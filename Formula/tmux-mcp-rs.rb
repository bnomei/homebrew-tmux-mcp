class TmuxMcpRs < Formula
  desc "Tmux MCP server in Rust"
  homepage "https://github.com/bnomei/tmux-mcp"
  version "0.6.0"
  license "MIT"

  checksums = {
    aarch64_apple_darwin: "5764c2f1bcf7c4eb3afc7ed23ccb47bbf7283fcf2cda6add801dddb10313a0ed",
    x86_64_apple_darwin: "50313638aac4015258e8c871d70748a2604861aa21f4cca6d5e7ec46c273aedb",
    aarch64_unknown_linux_musl: "7afd734bbec5dc825031c94181ae944bd5511c574967bae5e8f0a694db0607d9",
    x86_64_unknown_linux_musl: "6d2042b74bb1f35ef6e274a15d72a99a621fcd178c26367ed076dfd92dba786d",
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
