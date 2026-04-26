# PAI-Kernel Homebrew Tap

Official Homebrew tap for [PAI-Kernel](https://github.com/PAI-Kernel/pai-kernel) —
constitutional governance runtime for AI systems implementing the PAI-CD framework.

## Status

🟡 **Pre-release (v2.2.1) · early-preview distribution.**

The PAI-Kernel SDK is currently at **v2.2.1** (April 2026 · first public release).
This is a source-build distribution — Homebrew compiles the binary from source
via Cargo on install. Pre-compiled platform binaries ship in **v2.2.2**
(estimated mid-May 2026 · ~3 weeks from v2.2.1).

If you need a faster install path before v2.2.2 ships, use the
[install script](#alternative-installation-paths) below.

## Installation (current · v2.2.1 · source build)

Requires Rust toolchain (Homebrew auto-installs as build dependency).
Build time: typically 5–10 minutes on modern hardware.

```bash
brew tap PAI-Kernel/tap
brew install pai-kernel
```

Or directly:

```bash
brew install PAI-Kernel/tap/pai-kernel
```

## What gets installed

- `pai_governance_daemon` binary — HTTP governance API server
  (axum-based · default bind `127.0.0.1:9100`)
- Default configuration template (`pai-kernel.toml`)
- Constitutional policies (Rego files)
- Documentation (`INSTALL.md`, `KNOWN_LIMITATIONS.md`, license files)

## After install

```bash
# Initialize working directory
cd /path/to/work
pai_governance_daemon init

# Or run with shipped default config
pai_governance_daemon --config $(brew --prefix)/share/pai-kernel/pai-kernel.toml
```

Default bind: `127.0.0.1:9100`.
HTTP API surface documented in
[pai-kernel/docs/INSTALL.md](https://github.com/PAI-Kernel/pai-kernel/blob/main/docs/INSTALL.md).

## Alternative installation paths

### Install script (no Homebrew · no Rust required)

```bash
curl -fsSL https://paikernel.org/install.sh | sh
```

Operational since v2.2.1 launch · downloads release artifact directly.
Fastest path until v2.2.2 ships pre-compiled platform binaries through
this tap.

### crates.io (Rust toolchain required)

```bash
cargo install pai_kernel
```

### Docker (no Rust required)

```bash
docker pull ghcr.io/pai-kernel/pai-kernel:v2.2.1
docker run -p 9100:9100 ghcr.io/pai-kernel/pai-kernel:v2.2.1
```

## Updating

```bash
brew update
brew upgrade pai-kernel
```

## What changes in v2.2.2

- Pre-compiled platform binaries (Intel/Apple Silicon macOS · Linux x86_64/arm64)
- `brew install` becomes binary download (no Rust dependency · ~10 second install)
- Documentation site at [paikernel.org/corpus/latest/](https://paikernel.org/corpus/latest/) (mdBook)
- 5 transitive-dependency CVE patches included
- Cross-workspace consistency fixes

ETA: mid-May 2026 (~3 weeks from v2.2.1 · April 26, 2026 launch).

## Reporting issues

For tap issues (formula bugs · install failures): file at
[github.com/PAI-Kernel/homebrew-tap/issues](https://github.com/PAI-Kernel/homebrew-tap/issues).

For PAI-Kernel framework or SDK issues: file at
[github.com/PAI-Kernel/pai-kernel/issues](https://github.com/PAI-Kernel/pai-kernel/issues).

## License

Tap formulas: MIT License (see [LICENSE](./LICENSE)).

PAI-Kernel project itself:

- Code: MIT OR Apache-2.0 (dual license per Rust convention)
- Documentation: CC BY 4.0

See [main repository](https://github.com/PAI-Kernel/pai-kernel) for full license terms.

## Links

- **Main project:** <https://github.com/PAI-Kernel/pai-kernel>
- **Install script:** <https://paikernel.org/install.sh>
- **Citation (SSRN):** <https://doi.org/10.2139/ssrn.6512218>
- **Citation (Zenodo · concept):** <https://doi.org/10.5281/zenodo.19151899>

## Maintainer

Mikhail Anatolievich Sergeev · Independent Researcher / PAI-Kernel Initiative
ORCID: [0009-0001-6443-855X](https://orcid.org/0009-0001-6443-855X)
Contact: <contact@paikernel.org>
