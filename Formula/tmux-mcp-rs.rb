class TmuxMcpRs < Formula
  desc "Tmux MCP server in Rust"
  homepage "https://github.com/bnomei/tmux-mcp"
  version "0.3.0"
  license "MIT"

  checksums = {
    aarch64_apple_darwin: "1accbd6e6a662b75e921ec95d84c411daaeef4e199286e5298180abaa8b09079",
    x86_64_apple_darwin: "45305374833c3841e88123026d8b34cf12d0dbb4b30c52d154da05f096de1dbf",
    aarch64_unknown_linux_musl: "5f9965efb22b7a14b2a936c4b63deff180c1d65c4f9f091cfd20c79f311b7418",
    x86_64_unknown_linux_musl: "a7d84d3084d5c6cea52337ed74c8ada0632fde21d06bf949aac9f12fffc2b363",
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
