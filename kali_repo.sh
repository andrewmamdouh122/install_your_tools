#!/bin/bash
set -e

echo "Removing previous Kali repo files and keys..."
sudo rm -f /etc/apt/sources.list.d/kali.list
sudo rm -f /etc/apt/sources.list.d/kali.list.bak
sudo rm -f /etc/apt/keyrings/kali-archive-keyring.gpg
sudo apt-key del ED65462EC8D5E4C5 2>/dev/null || true

echo "Cleaning hosts file of Kali mirror blocks..."
sudo sed -i '/mirror1\.sox\.rs/d' /etc/hosts

echo "Adding official Kali keyring..."
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://archive.kali.org/archive-key.asc | sudo gpg --dearmor -o /etc/apt/keyrings/kali-archive-keyring.gpg

echo "Adding official Kali repository..."
echo "deb [signed-by=/etc/apt/keyrings/kali-archive-keyring.gpg] http://http.kali.org/kali kali-rolling main contrib non-free" | sudo tee /etc/apt/sources.list.d/kali.list

echo "Updating package lists..."
sudo apt update

echo "Cleanup and restore complete."
