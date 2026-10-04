# Screenpunk CLI Homebrew tap

Screenpunk CLI **1.0.6** is a Developer ID signed, Apple-notarized Homebrew testing release for Apple-silicon macOS 14+ at `/opt/homebrew`. The Studio upgrade is the live test; this publication does not claim native qualification.

Final stapled DMG SHA256: `2c62b35a13086727e06714e212e7c2857a4d6380b36f277037834113bd77ed08`.

Use the same installing account without sudo. No Xcode or Screenpunk GUI application is required.

```sh
brew tap screenpunk-xyz/tap
brew update
brew install --cask screenpunk-xyz/tap/screenpunk-cli
screenpunk setup
screenpunk doctor
screenpunk service status
screenpunk agent config --client codex
```

The cask links `screenpunk` and `screenpunk-mcp`. First service use prepares the authenticated bundled offline authoring kit and starts the owned user LaunchAgent. Agent configuration is emitted for review. MCP accepts explicit human chat approval of the exact reviewed deployment plan and authorization context; typing `APPROVE` into Terminal is not required. Changed or expired reviews require fresh review and corresponding human approval.

## Upgrade from 1.0.5

Pause clients, let active jobs finish and quit any Screenpunk GUI. Run the ordinary public Homebrew upgrade, preserving output and stopping on errors:

```sh
brew update
brew info --cask screenpunk-xyz/tap/screenpunk-cli
brew fetch --cask screenpunk-xyz/tap/screenpunk-cli
brew upgrade --cask screenpunk-xyz/tap/screenpunk-cli
screenpunk --json --no-input service start
screenpunk --json --no-input service status
screenpunk --json --no-input service lifecycle
screenpunk --json --no-input doctor
```

Before upgrading require metadata version 1.0.6, the final checksum above and a successful fetch. Afterwards require the installed Brew receipt and authenticated release manifest to report 1.0.6. `screenpunk --version` reports the internal string `screenpunk 0.2.0-m1`; it is not the Homebrew release version.

1.0.6 corrects pairing-response decoding, distinguishes stale source and build-head conflicts, and reports a retained plan with no admitted deployment operation as `not-admitted`. Unknown plans and storage failures remain errors. Before applying a reviewed plan, reconcile any existing operation and use the exact current review, authorization context and stable idempotency key.

## Removal and recovery

The current removal guard reserves idle admission and refuses active jobs or GUI consumers without cancelling jobs. Let work finish, quit the GUI and retry. Failed native absence proof reopens admission. Removal retains workspaces, installed kits, Controller data, catalog history and Keychain entries. Interrupted removal uses supported retry/reinstall; `brew reinstall --cask screenpunk-xyz/tap/screenpunk-cli` rearms the retained package.

No reset, force kill, manual bootout, receipt/link editing or Keychain deletion is part of this upgrade. Shared accounts, nonstandard prefixes, Intel and macOS before 14 are outside this artifact's scope.

Independent source review, six source CI checks, 23 focused regressions, Developer ID signatures, Ed25519 manifest/payload checks, Apple acceptance, stapling and Gatekeeper assessment passed. Studio native upgrade and device validation remain the live test.
