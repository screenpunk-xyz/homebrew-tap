# Screenpunk CLI Homebrew tap

CLI 1.0.2 is published with Apple notarization and a validated staple. The public download matches SHA-256 `2a50c732bbff31ab330b1dd589f601b270db9216be8b641ed6e8b039f40c3749`.

Install on Apple silicon with macOS14+
and standard /opt/homebrew, as the normal user without sudo:

```sh
brew tap screenpunk-xyz/tap https://github.com/screenpunk-xyz/homebrew-tap
brew update
brew install --cask screenpunk-cli
screenpunk --version
screenpunk setup
screenpunk doctor
screenpunk service status
screenpunk agent config --client codex
```

The cask directly links screenpunk and screenpunk-mcp. The first setup/workspace
request or MCP invocation prepares the verified bundled offline authoring kit
and starts the owned user LaunchAgent. No screenpunk-setup command, separate
installer, private software copy, or ~/.local/bin PATH edit is required.
Agent configuration is emitted for review; user configuration is not edited.
Pairing and deployment retain their human approval steps.

Use the same macOS account to install and use this release. Shared multi-account
prefixes, nonstandard Homebrew prefixes, Intel Macs, and macOS before14 are not
supported by this artifact. No Xcode or Screenpunk GUI app is required.

```sh
brew upgrade --cask screenpunk-cli
brew uninstall --cask screenpunk-cli
```

Both stop the exact verified service before software removal. Upgrade starts the
new service on next use. Workspace sources, external projects, machine state,
installed kits, and Keychain entries remain. Keep agent configuration only while
the CLI is installed; remove its Screenpunk entry manually if no longer wanted.

If activation fails, inspect `screenpunk service logs` and
`launchctl print gui/$(id -u)/com.screenpunk.workbench`, then retry
`screenpunk service start` after resolving the reported cause. If Brew removal
is interrupted after deactivation, retry the Brew operation; a successful
`brew reinstall --cask screenpunk-cli` rearms that package for first use.
An uncertain or mismatched running broker blocks removal while software remains.

The previous 1.0.0 Studio test left a failed legacy installation. The separately
reviewed reset script applies only to the user-authorized disposable generator
account on that Studio; do not use it as general uninstall instructions.

This is a testing release. Source review, automated tests and isolated Homebrew extraction checks pass. Clean Studio activation, reconnect, upgrade and removal qualification remain pending.

## Retry an existing 1.0.1 Studio installation

Keep state and Keychain intact; do not run the old reset script. Run separately, without sudo:

```sh
brew update
brew upgrade --cask screenpunk-xyz/tap/screenpunk-cli
screenpunk --version
screenpunk service start
screenpunk doctor
screenpunk service status
```

Confirm version 1.0.2 before starting the service. Stop and retain output on any error.
