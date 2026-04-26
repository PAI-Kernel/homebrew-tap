# PAI-Kernel Homebrew Tap

Official Homebrew tap for [PAI-Kernel](https://github.com/PAI-Kernel/pai-kernel) —
constitutional governance runtime for AI systems implementing the PAI-CD framework.

## Status

🟡 **Early preview · invitation-only distribution.**

The PAI-Kernel SDK is currently at **v2.2.1** (April 2026 · first public release).
This tap will track stable releases as they ship.

## Installation

```bash
brew tap PAI-Kernel/tap
brew install pai-kernel
```

Or directly:

```bash
brew install PAI-Kernel/tap/pai-kernel
```

## What gets installed

- `pai_governance_daemon` binary — HTTP governance API server (axum-based · default bind `127.0.0.1:9100`)
- Default configuration template (`pai-kernel.toml`)
- Constitutional policies (Rego files)
- Documentation (`INSTALL.md`, `KNOWN_LIMITATIONS.md`, license files)

## Build details

This tap currently builds from source via Cargo (requires Rust toolchain · auto-installed by Homebrew dependency declaration). Build time: typically 5-10 minutes on modern hardware.

Pre-compiled platform binary distribution (faster install · no Rust required) is planned for the v2.2.2 patch release. The formula will be updated to download pre-built binaries once they ship.

## After install

```bash
# Initialize working directory
cd /path/to/work
pai_governance_daemon init

# Or run with shipped default config
pai_governance_daemon --config $(brew --prefix)/share/pai-kernel/pai-kernel.toml
```

Default bind: `127.0.0.1:9100`. HTTP API surface documented in [pai-kernel/docs/INSTALL.md](https://github.com/PAI-Kernel/pai-kernel/blob/main/docs/INSTALL.md).

## Alternative installation paths

If Homebrew is unavailable or build-from-source is impractical:

```bash
# crates.io (Rust toolchain required)
cargo install pai_kernel

# Docker (no Rust required)
docker pull ghcr.io/pai-kernel/pai-kernel:v2.2.1
docker run -p 9100:9100 ghcr.io/pai-kernel/pai-kernel:v2.2.1
```

## Updating

```bash
brew update
brew upgrade pai-kernel
```

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
- **Documentation:** <https://corpus.paikernel.org>
- **Citation (SSRN):** <https://doi.org/10.2139/ssrn.6512218>
- **Citation (Zenodo · concept):** <https://doi.org/10.5281/zenodo.19151899>

## Maintainer

Mikhail Anatolievich Sergeev · Independent Researcher / PAI-Kernel Initiative
ORCID: [0009-0001-6443-855X](https://orcid.org/0009-0001-6443-855X)
Contact: <contact@paikernel.org>
