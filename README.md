# Screenpunk CLI Homebrew tap

Screenpunk CLI **1.0.5** is a Developer ID signed, Apple-notarized Homebrew testing release for Apple-silicon macOS 14+ at `/opt/homebrew`. Studio native upgrade validation is pending; publication makes the normal Homebrew upgrade available for that live test.

Final stapled DMG SHA256: `af3f36c82f16e2bc01eb6f82ab5149cc72bd3f64d56e9368636baa18e70f1c98`.

Use the same installing account, without sudo. No Xcode or Screenpunk GUI application is required.

```sh
brew tap screenpunk-xyz/tap
brew update
brew install --cask screenpunk-xyz/tap/screenpunk-cli
screenpunk setup
screenpunk doctor
screenpunk service status
screenpunk agent config --client codex
```

The cask directly links `screenpunk` and `screenpunk-mcp`. First service use prepares the authenticated bundled offline authoring kit and starts the owned user LaunchAgent. Agent configuration is emitted for review. Pairing/deployment retain their human approval steps.

## Upgrade an existing 1.0.2 or 1.0.3 installation

Pause clients, allow jobs to finish and quit any Screenpunk GUI. Confirm fresh owned ready service identity/home/PID and idle lifecycle before stopping it. The old installed removal hook executes before 1.0.5 can install, so this one-time supported idle stop is required. Retain catalog history, its paired Keychain checkpoint, installed kits, Controller authority and workspaces.

Run each step separately, retain output and stop on any failure:

```sh
brew update
brew info --cask screenpunk-xyz/tap/screenpunk-cli
brew fetch --cask screenpunk-xyz/tap/screenpunk-cli
screenpunk --json --no-input service status
screenpunk --json --no-input service lifecycle
# Only after fresh identity, idle and GUI-absence checks:
screenpunk --json --no-input service stop
# Confirm the exact owned LaunchAgent has no running PID before continuing.
brew upgrade --cask screenpunk-xyz/tap/screenpunk-cli
brew info --cask screenpunk-xyz/tap/screenpunk-cli
screenpunk --json --no-input service start
screenpunk --json --no-input service status
screenpunk --json --no-input service lifecycle
screenpunk --json --no-input doctor
```

Before upgrading require metadata version 1.0.5, the final checksum above and a successful fetch. Afterwards require installed Brew receipt and signed release manifest version 1.0.5. `screenpunk --version` currently reports the internal string `screenpunk 0.2.0-m1`; it is not the Homebrew release version.

No local tap staging, separate installer, reset, force kill, manual bootout, receipt/link editing or Keychain deletion is part of this upgrade. If the supported stop or old hook fails, preserve state/output for diagnosis.

## Later upgrades and removal

```sh
brew upgrade --cask screenpunk-xyz/tap/screenpunk-cli
brew uninstall --cask screenpunk-xyz/tap/screenpunk-cli
```

The 1.0.5 guard reserves idle admission and refuses active jobs or GUI consumers without cancelling jobs. Let work finish, quit the GUI and retry. Failed native absence proof reopens admission. Normal removal retains workspaces, installed kits, Controller data, catalog history and Keychain entries. Interrupted removal uses supported retry/reinstall; `brew reinstall --cask screenpunk-xyz/tap/screenpunk-cli` rearms the retained package. Never run a historical reset script for this upgrade.

Source review, 98 focused regressions, signing/Ed25519/payload checks, notarization/stapling and the isolated exact signed resource test passed. Studio native upgrade/GUI/busy/retention and device validation remain pending. Shared accounts, nonstandard prefixes, Intel and macOS before 14 are outside this artifact's scope.
