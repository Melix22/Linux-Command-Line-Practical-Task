#!/usr/bin/env bash
set -euo pipefail

if [[ "$(id -un)" != "student01" ]]; then
  echo "ERROR: Run this script as student01 (use: su - student01)."
  exit 1
fi

PROJECT="$HOME/project"
DOCS="$PROJECT/docs"
SCRIPTS="$PROJECT/scripts"
BIN="$PROJECT/bin"
BACKUP="$PROJECT/backup"

mkdir -p "$DOCS" "$SCRIPTS" "$BIN"

cd "$DOCS"
echo "This is the initial report by student01." > report.txt
ls -la
echo "Top Secret" > .secret.txt

echo
echo "MANUAL REQUIRED: Open the report in nano and append the required second line."
echo "Run: nano \"$DOCS/report.txt\""
echo "Append exactly: Appended line using nano."
echo "Save with Ctrl+O, Enter, then exit with Ctrl+X."
read -r -p "Press Enter after you have saved and exited nano..." _

cp "$DOCS/report.txt" "$SCRIPTS/report.txt"
mv "$DOCS/.secret.txt" "$BIN/classified.txt"

cat > "$SCRIPTS/install.sh" <<'EOF'
#!/bin/bash
echo "Installing project dependencies..."
EOF

chmod a+x "$SCRIPTS/install.sh"
chmod o-r "$BIN/classified.txt"

touch "$DOCS/admin_notes.txt"
chmod 600 "$DOCS/admin_notes.txt"
rm "$DOCS/admin_notes.txt"

mkdir -p "$BACKUP"
cp -a "$DOCS/." "$BACKUP/"
cp -a "$SCRIPTS/." "$BACKUP/"

echo
echo "Project tasks completed. Run scripts/03-final-checks.sh for verification."
