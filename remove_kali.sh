#!/bin/bash
set -euo pipefail

echo "Starting Kali cleanup and restore to default Debian-only repo setup..."

# 1. Remove Kali repository files
echo "Removing Kali repo files..."
sudo rm -f /etc/apt/sources.list.d/kali.list
sudo rm -f /etc/apt/sources.list.d/kali.list.bak

# 2. Remove Kali keys from keyrings directory
echo "Removing Kali GPG keys..."
sudo rm -f /etc/apt/keyrings/kali-archive-keyring.gpg

# 3. Remove any Kali keys from deprecated apt-key storage (ignore warnings)
KALI_KEY_ID="ED65462EC8D5E4C5"
echo "Removing Kali key from apt-key storage (if present)..."
sudo apt-key del "$KALI_KEY_ID" 2>/dev/null || true

# 4. Remove Kali mirror blocks from /etc/hosts
echo "Cleaning /etc/hosts of Kali mirror blocks..."
sudo sed -i '/mirror1\.sox\.rs/d' /etc/hosts

# 5. (Optional) Restore a clean Debian sources.list if needed
# You can uncomment and modify this block to your Debian mirror preference
# echo "Restoring clean Debian sources.list..."
# sudo tee /etc/apt/sources.list > /dev/null << EOF
# deb http://deb.debian.org/debian bookworm main contrib non-free
# deb http://security.debian.org/debian-security bookworm-security main contrib non-free
# deb http://deb.debian.org/debian bookworm-updates main contrib non-free
# EOF

# 6. Update package lists
echo "Updating package lists..."
sudo apt update

echo "Kali cleanup complete. Your system is now free of Kali repos and keys."
