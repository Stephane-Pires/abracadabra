#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status.

# ── Profile selection ──────────────────────────────────────────────────────────
echo ""
echo "Select setup profile:"
echo "  1) personal      (full setup: SSH keys, personal repos, all apps)"
echo "  2) professional  (dev environment: no personal SSH keys or repos)"
echo ""
read -rp "Enter choice [1/2] (default: 1): " profile_choice

case "$profile_choice" in
  2) PROFILE="professional" ;;
  *) PROFILE="personal" ;;
esac
echo "Profile selected: $PROFILE"

# ── Homebrew ───────────────────────────────────────────────────────────────────
echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Adding Homebrew to PATH..."
echo >> "$HOME/.zprofile"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zprofile"
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "Sourcing Zsh profile..."
source ~/.zprofile

# ── Brewfile ───────────────────────────────────────────────────────────────────
echo "Downloading Brewfile.${PROFILE}..."
curl -fsSL "https://raw.githubusercontent.com/Stephane-Pires/abracadabra/refs/heads/main/Brewfile.${PROFILE}" -o ~/Brewfile

echo "Installing packages..."
brew bundle install

# ── Vault password (personal only) ────────────────────────────────────────────
VAULT_ARGS=""
if [ "$PROFILE" = "personal" ]; then
  read -rsp "Enter Ansible Vault password: " vault_password
  echo ""
  echo "$vault_password" > ~/.vault_pass.txt
  chmod 600 ~/.vault_pass.txt
  VAULT_ARGS="--vault-password-file ~/.vault_pass.txt"
fi

# ── Run Ansible ────────────────────────────────────────────────────────────────
echo "Running Ansible (profile: $PROFILE)..."
ansible-pull \
  -U https://github.com/Stephane-Pires/abracadabra.git \
  -C main \
  ansible/site.yml \
  $VAULT_ARGS \
  -e "profile=${PROFILE}"
