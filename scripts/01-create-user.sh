#!/usr/bin/env bash
set -euo pipefail

USERNAME="student01"

if [[ "${EUID}" -eq 0 ]]; then
  echo "Run this script with sudo from your existing administrator account, not from a root login shell."
fi

if id "$USERNAME" >/dev/null 2>&1; then
  echo "User '$USERNAME' already exists; skipping user creation."
else
  sudo useradd -m -s /bin/bash "$USERNAME"
  echo "Created user '$USERNAME'."
fi

if getent group sudo >/dev/null 2>&1; then
  sudo usermod -aG sudo "$USERNAME"
  echo "Added '$USERNAME' to the sudo group."
else
  echo "The sudo group was not found; no group change was made."
fi

echo "Set or update the password for '$USERNAME' now:"
sudo passwd "$USERNAME"

echo
echo "Next, switch to the new account with: su - $USERNAME"
echo "Then confirm with: whoami"
