# Screenpunk CLI Homebrew tap

This cask reuses the notarized, stapled Apple-silicon CLI 1.0.0 DMG without
changing its signed payload. Homebrew owns the downloaded image in its Caskroom
and the `screenpunk-setup` command. The Screenpunk installer remains the only
owner of the per-user runtime, launchers, and LaunchAgent. No Homebrew hook
starts or stops the service, deletes user state, or bypasses the install plan.
**This is a Homebrew bootstrap for Screenpunk's own installer, not a fully
Homebrew-managed runtime.** `brew install` alone does not activate the CLI or
service.

The cask is published in `screenpunk-xyz/homebrew-tap`. The matching release asset `Screenpunk-CLI-1.0.0-arm64.dmg` is available under tag
`cli-v1.0.0` in that same repository. The hosted artifact must retain SHA-256
`a787684791309d0b939df0f9957d18bacf376cb3718ef1361585eba2a18deb60`.
The cask uses Homebrew's `command_wrapper` stanza and requires Homebrew 7.0 or
newer. It targets Apple-silicon macOS 14 or newer.

Run these Studio commands from the
same macOS account, without `sudo`:

```sh
brew --version # Homebrew 7.0 or newer is required
brew tap screenpunk-xyz/tap
brew install --cask screenpunk-xyz/tap/screenpunk-cli
screenpunk-setup
~/.local/bin/screenpunk doctor
~/.local/bin/screenpunk service status
```

`screenpunk-setup` runs the signed DMG's installer from Homebrew's staged
folder. It displays the authenticated install plan, then asks for the exact
`Confirmation` token. Run setup as the same macOS account that ran
`brew install`: the staged release directory is private to that account
(mode `0700`), and release verification requires matching ownership. Use
that account for staged upgrades and setup as well. This bootstrap does not
provide setup for other accounts sharing a Homebrew prefix. Xcode is not
required.
Keep `~/.local/bin` on `PATH` if bare `screenpunk` commands are
desired. Setup does not configure third-party agents automatically.

An upgrade stages a new cask version but leaves the selected user runtime
alone. Run `screenpunk-setup` after reviewing a staged upgrade. The Screenpunk
installer retains the prior version for rollback. Avoid `brew upgrade --greedy`
as an assumption that the user service has been upgraded; verify with
`~/.local/bin/screenpunk doctor` and `service status` after setup.

To remove the per-user runtime, run `~/.local/bin/screenpunk uninstall plan`,
review the retained data and GUI consumers, then run
`~/.local/bin/screenpunk uninstall apply TOKEN` with the displayed token.
Afterward, `brew uninstall --cask screenpunk-cli` removes the staged image and
setup command. Reversing that order only removes Brew-owned files; the selected
user runtime remains available for explicit uninstallation. Workspaces,
external projects, machine-local state, and agent configuration are preserved
by the Screenpunk uninstaller unless separately handled by the user.

This is an Apple-silicon macOS 14+ CLI release. It does not install or replace
the separate Mac GUI test app, and it does not supply that app's new
approval/control path.

The notarized image passed release verification, read-only installation
planning, a network-denied fresh build, and an isolated full offline-kit
import on the packaging Mac. A clean Studio installation and Homebrew install
from the hosted release asset have not yet been tested.
