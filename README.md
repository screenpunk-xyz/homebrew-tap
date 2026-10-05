# Screenpunk CLI Homebrew tap

Screenpunk CLI **1.0.7** is a Developer ID signed and Apple-notarized Homebrew testing release for Apple-silicon macOS 14+ at /opt/homebrew. Studio native upgrade and device validation remain outstanding.

Final stapled DMG SHA256: `910c7f332d96e7d0dbef12afad3315d2977ea2c71e69e78ddfdce0f91baf9e40`.

Use the same installing account without sudo. No Xcode or Screenpunk GUI is required.

```sh
brew tap screenpunk-xyz/tap
brew update
brew install --cask screenpunk-xyz/tap/screenpunk-cli
screenpunk setup
screenpunk status --json
screenpunk agent config --client codex
```

The cask links screenpunk and screenpunk-mcp. First service use prepares the authenticated offline authoring kit and starts the owned user LaunchAgent. `screenpunk status` reports the authenticated installed release, owned running service release/mismatch, broker health/jobs, selected workspace, cached device observations and MCP broker readiness; it does not start the service or probe devices. Current device connections/client registration remain unassessed.

For an existing installation, let jobs finish and quit any Screenpunk GUI, then use `brew upgrade --cask screenpunk-xyz/tap/screenpunk-cli`. Confirm `brew list --cask --versions screenpunk-cli` reports 1.0.7 and inspect `screenpunk status --json`. Internal `screenpunk --version` is not the Homebrew release version.

Homebrew first runs the installed version's uninstall hook. The 1.0.7 guard retries bounded inventory churn during later removal, but cannot repair an older installed hook before upgrade. On refusal, retain the complete verbose error and fresh service status/lifecycle; normal retry preserves owned safety checks. Removal retains workspace, pairing, kits/catalog, Controller data and Keychain. Supported reinstall rearms interrupted removal; no receipt/hook edits or guard bypass are part of recovery.

MCP accepts explicit human chat approval of the exact reviewed deployment plan and authorization context. Changed or expired plans require fresh review and corresponding approval before apply. The pairing-response, conflict-diagnostic and plan-bound not-admitted lookup corrections from 1.0.6 remain included.

Independent source review, six source CI checks, focused regression tests, Developer ID/Ed25519 signatures, Apple acceptance, stapling and Gatekeeper assessment passed. These artifact checks do not replace Studio native upgrade/device testing.
