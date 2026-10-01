cask "screenpunk-cli" do
  version "1.0.0"
  sha256 "a787684791309d0b939df0f9957d18bacf376cb3718ef1361585eba2a18deb60"

  # Publish this exact stapled DMG at this tag before making the cask public.
  url "https://github.com/screenpunk-xyz/homebrew-tap/releases/download/cli-v#{version}/Screenpunk-CLI-#{version}-arm64.dmg"
  name "Screenpunk CLI"
  desc "Offline-first Screenpunk CLI, MCP server, and user service"
  homepage "https://github.com/screenpunk-xyz/screenpunk"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  # Brew owns only the staged distribution and this command. The signed
  # Screenpunk installer owns its per-user runtime and service after review.
  command_wrapper "screenpunk-setup",
                  executable: "#{staged_path}/Install Screenpunk CLI.command"

  caveats <<~EOS
    Homebrew stages the signed distribution and setup command; it does not
    install or manage the selected Screenpunk user runtime or service.

    Run `screenpunk-setup` as the same macOS account that installed this cask,
    without sudo. The staged release is private to that account and its
    ownership is verified. This bootstrap does not provide setup for other
    accounts sharing a Homebrew prefix. Review the installation plan and enter
    its exact Confirmation token. Setup installs the verified CLI into
    ~/.local/bin and registers a per-user service. Add ~/.local/bin to PATH if needed.

    `brew upgrade --cask screenpunk-cli` stages a new release; run
    `screenpunk-setup` again to review and apply it. Before removing the
    per-user runtime, run `~/.local/bin/screenpunk uninstall plan`, then
    `~/.local/bin/screenpunk uninstall apply TOKEN`. `brew uninstall --cask
    screenpunk-cli` removes only Brew's staged image and setup command.
  EOS
end
