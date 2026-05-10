# frozen_string_literal: true

# PAI-Kernel Homebrew Formula
#
# Builds pai_governance_daemon binary from source via Cargo (requires Rust).
# v2.2.3 binary distribution path · cargo-source build (Day 0 functional).
# Future versions may switch к pre-compiled binary downloads after release
# pipeline attaches platform binaries.
#
# Maintenance:
#   - On new release: update `url` + `sha256` (compute via:
#     curl -sL <tarball-url> | shasum -a 256)
#   - Increment `version` to match tag

class PaiKernel < Formula
  desc "Constitutional governance runtime for AI systems (PAI-CD framework)"
  homepage "https://github.com/PAI-Kernel/pai-kernel"
  url "https://github.com/PAI-Kernel/pai-kernel/archive/refs/tags/v2.2.3.tar.gz"
  sha256 "e358058d844631e07df3fcf36378a7468874cb06a91b83d54d0a628c63a91b34"
  license any_of: ["MIT", "Apache-2.0"]

  head "https://github.com/PAI-Kernel/pai-kernel.git", branch: "main"

  depends_on "rust" => :build

  def install
    # Build pai_governance_daemon binary from runtime/pai_kernel workspace member
    # (the binary crate that wires governance daemon · policy · storage · api into
    #  a live axum server)
    system "cargo", "install", *std_cargo_args(path: "runtime/pai_kernel")

    # Default config + policies placed in pkgshare for adopter reference
    pkgshare.install "pai-kernel.toml" if (buildpath/"pai-kernel.toml").exist?
    pkgshare.install "policies" if (buildpath/"policies").exist?

    # Documentation
    doc.install "README.md" if (buildpath/"README.md").exist?
    doc.install "docs/INSTALL.md" => "INSTALL.md" if (buildpath/"docs/INSTALL.md").exist?
    if (buildpath/"docs/KNOWN_LIMITATIONS.md").exist?
      doc.install "docs/KNOWN_LIMITATIONS.md" => "KNOWN_LIMITATIONS.md"
    end
    doc.install "LICENSE" if (buildpath/"LICENSE").exist?
    doc.install "LICENSE-MIT" if (buildpath/"LICENSE-MIT").exist?
    doc.install "LICENSE-APACHE" if (buildpath/"LICENSE-APACHE").exist?
  end

  def caveats
    <<~EOS
      PAI-Kernel v#{version} installed.

      Environment setup (REQUIRED · fail-closed default since v2.2.3):
        export PAI_AUTHOR_API_KEY="$(uuidgen)"
        export PAI_AUTHOR_SIGNING_KEY="$(openssl rand -hex 32)"
      See #{doc}/INSTALL.md § Configuration for persistence + key management.

      Quick browser test (NO env setup required):
        pai_governance_daemon --demo
      Forces 127.0.0.1:9100 bind · ephemeral keys · prints WARNINGs.
      Then: curl http://127.0.0.1:9100/api/v1/health

      To initialize a working directory with default config + policies:
        mkdir -p ~/pai-kernel-work && cd ~/pai-kernel-work
        pai_governance_daemon init
      (Replace ~/pai-kernel-work with your preferred path.)

      To run with the shipped default config (after env setup):
        pai_governance_daemon --config #{pkgshare}/pai-kernel.toml

      Default bind address: 127.0.0.1:9100

      PAI-Kernel v#{version} is an early-preview release · invitation-only
      distribution. See #{doc}/KNOWN_LIMITATIONS.md for the scope statement.

      Documentation:
        - Install guide: https://github.com/PAI-Kernel/pai-kernel/blob/main/docs/INSTALL.md
        - Framework: https://corpus.paikernel.org
        - Repository: https://github.com/PAI-Kernel/pai-kernel
        - Citation (SSRN): https://doi.org/10.2139/ssrn.6512218
    EOS
  end

  test do
    # Smoke test · binary should respond к --version
    assert_match "pai_governance_daemon", shell_output("#{bin}/pai_governance_daemon --version 2>&1", 0..1)
  end
end
