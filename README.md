# MyNix Darwin

A minimal yet functional **nix-darwin** configuration with essential settings to get started.  
Safe to deploy on a fresh macOS system.

---

## ❓ Why nix-darwin?

**nix-darwin** brings the power of the Nix package manager to macOS, allowing you to:

- **Declaratively manage** your macOS system settings and packages
- **Reproduce** your setup on any Mac with a single command
- **Version control** your entire system configuration
- Combine **Nix** and **Homebrew** for maximum package availability

If you like the idea of treating your macOS setup like code, nix-darwin is for you.

---

## 🚀 Getting Started

### 1. Install Nix
Choose one of the following installation methods:

- **Official Installer** → [Nix Installation Guide](https://nixos.org/download.html#nix-install-macos)  
- **Determinate Systems Installer** → [DeterminateSystems/nix-installer](https://github.com/DeterminateSystems/nix-installer)

---

### 2. Review the Configuration
Read all files to understand their purpose.  
If you’re new to Nix and flakes, check out:  
📖 [ryan4yin/nixos-and-flakes-book](https://github.com/ryan4yin/nixos-and-flakes-book)

---

### 3. Install Homebrew
Homebrew is required for:

- Most GUI apps
- App Store apps
- CLI tools not available in `nixpkgs`

Install from → [brew.sh](https://brew.sh/)

---

### 4. Complete the TODOs
Search for `TODO` in the files and folders and update them as needed.

---

### 5. Deploy Your Configuration
Run the following in the root of your nix configuration (replace `hostname` with your actual hostname):

```bash
nix build .#darwinConfigurations.hostname.system \
  --extra-experimental-features 'nix-command flakes'

sudo -E ./result/sw/bin/darwin-rebuild switch --flake .#hostname
```

---

## 💡 Optional: Simplify with a Makefile
Create a `Makefile` in the root of your nix configuration:

```makefile
# Change 'hostname' to your actual hostname
deploy:
	nix build .#darwinConfigurations.hostname.system \
	   --extra-experimental-features 'nix-command flakes'

	sudo -E ./result/sw/bin/darwin-rebuild switch --flake .#hostname
```

Now you can deploy with:

```bash
make deploy
```

---

## 📂 Configuration Structure

Your nix-darwin setup should look like this:

```bash
.
├── flake.lock        # Auto-generated lock file (can be ignored for now)
├── flake.nix         # Entry point for your nix configuration (add hostname here)
├── modules           # All nix-darwin configuration files
│   ├── apps.nix        # Homebrew & Nix apps (GUI & CLI)
│   ├── host-users.nix  # Hostname & system users
│   ├── nix-core.nix    # Core Nix settings
│   └── system.nix      # macOS system settings (Dock, trackpad, keyboard, Finder, etc.)
└── README.md
```

## 📚 Resources

- [NixOS Official Documentation](https://nixos.org/learn.html)
- [nix-darwin GitHub Repository](https://github.com/LnL7/nix-darwin)
- [ryan4yin/nixos-and-flakes-book](https://github.com/ryan4yin/nixos-and-flakes-book) — Great guide for learning Nix and flakes
- - [MyNixOS](https://mynixos.com) — Search and explore Nix packages and options
- [Homebrew Documentation](https://docs.brew.sh/)

---

## 🙏 Acknowledgements

Special thanks to [ryan4yin](https://github.com/ryan4yin) for the  
[nix-darwin-kickstarter minimal configuration](https://github.com/ryan4yin/nix-darwin-kickstarter/tree/main/minimal),  
which served as the foundation for this setup.

---

✅ **Tip:** Commit your configuration to Git so you can easily roll back changes.