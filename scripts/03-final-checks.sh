#!/usr/bin/env bash
set -euo pipefail

if [[ "$(id -un)" != "student01" ]]; then
  echo "ERROR: Run final checks as student01."
  exit 1
fi

cd "$HOME"
if ! command -v tree >/dev/null 2>&1; then
  echo "The 'tree' command is not installed."
  echo "Install it from an account with sudo access: sudo apt update && sudo apt install tree"
  exit 2
fi

echo "===== tree project ====="
tree project

echo
echo "===== docs permissions and contents ====="
ls -la "$HOME/project/docs"

echo
echo "===== scripts permissions and contents ====="
ls -la "$HOME/project/scripts"

echo
echo "===== bin permissions and contents ====="
ls -la "$HOME/project/bin"

echo
echo "===== backup contents ====="
ls -la "$HOME/project/backup"

echo
echo "===== automated checks ====="
test -x "$HOME/project/scripts/install.sh" && echo "PASS: install.sh is executable"
if [[ -e "$HOME/project/docs/admin_notes.txt" ]]; then
  echo "FAIL: admin_notes.txt should have been deleted"
  exit 1
else
  echo "PASS: admin_notes.txt is absent"
fi

if [[ "$(stat -c '%a' "$HOME/project/docs/../docs/../docs" 2>/dev/null || true)" == "600" ]]; then
  echo "Note: directory mode check is not applicable."
fi

others_read="$(stat -c '%A' "$HOME/project/bin/classified.txt" | cut -c 10)"
if [[ "$others_read" == "r" ]]; then
  echo "FAIL: others still have read permission on classified.txt"
  exit 1
else
  echo "PASS: others do not have read permission on classified.txt"
fi

grep -Fxq "This is the initial report by student01." "$HOME/project/docs/report.txt"
grep -Fxq "Appended line using nano." "$HOME/project/docs/report.txt"
echo "PASS: report.txt contains both required lines"
grep -Fxq 'echo "Installing project dependencies..."' "$HOME/project/scripts/install.sh"
echo "PASS: install.sh contains the required command"

echo
echo "Manual check: classified.txt should contain 'Top Secret'."
echo "Manual check: backup should contain copies of docs and scripts contents."
