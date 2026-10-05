# Screenpunk CLI Homebrew tap

Screenpunk CLI **1.0.8** is a Developer ID signed and Apple-notarized Homebrew testing release for Apple-silicon macOS 14+ at /opt/homebrew. Studio upgrade and native device acceptance remain outstanding.

```sh
brew tap screenpunk-xyz/tap
brew update
brew install --cask screenpunk-xyz/tap/screenpunk-cli
screenpunk setup
screenpunk status --json
screenpunk agent config --client codex
```

For an existing installation, let jobs finish and quit Screenpunk GUI consumers, then run `brew upgrade --cask screenpunk-xyz/tap/screenpunk-cli`. Confirm `brew list --cask --versions screenpunk-cli` reports 1.0.8. Use the same installing account without sudo. No Xcode or Screenpunk GUI is required.

The cask links screenpunk and screenpunk-mcp. First service use prepares the authenticated offline authoring kit and starts the owned user LaunchAgent. `screenpunk status --json` reports installed release, service, broker, workspace and cached device observations without starting the service or probing devices.

1.0.8 adds durable preference authoring guidance, a React preference hook and examples in the bundled 1.0.1 kit; local HTML policy diagnostics; fractional brightness decoding; and capacity for the two authenticated offline kits. Dashboard preferences are device-local and private. Same-ID updates and relaunch should preserve them; app deletion, device reset or confirmed Disconnect can erase them. Native persistence still requires Studio/device acceptance.

Homebrew first runs the installed version's uninstall hook. On a guarded refusal, retain the complete error and fresh status for diagnosis. Removal retains workspaces, pairing, Controller data, kits/catalog and Keychain. Supported reinstall rearms interrupted removal. Human chat approval of the exact reviewed deployment plan is relayed through MCP; changed or expired plans require fresh approval.

Independent source reviews, six exact-head CI checks per PR, focused regressions, authenticated kit/catalog and manifest validation, Developer ID signatures, Apple acceptance, stapling and Gatekeeper assessment passed. Final stapled DMG SHA256: `00910e5db4fedea9ddd9a9e7e2d275e3edec166c3d7154dc0671208c89522445`. These artifact checks do not replace Studio upgrade/device testing.
