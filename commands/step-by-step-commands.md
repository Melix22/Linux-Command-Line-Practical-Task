# Step-by-step command reference

Run account-management commands from your existing administrator account. Run file-management commands as `student01`.

## Step 1 — user setup
```bash
sudo useradd -m -s /bin/bash student01
sudo passwd student01
sudo usermod -aG sudo student01
su - student01
whoami
```
If `student01` already exists, do not run `useradd` again. If the `sudo` group is unavailable or your lab image uses a different policy, follow your instructor's Kali setup guidance.

## Step 2 — directories and files (as student01)
```bash
mkdir -p ~/project/docs ~/project/scripts ~/project/bin
cd ~/project/docs
echo "This is the initial report by student01." > report.txt
ls -la
echo "Top Secret" > .secret.txt
```

## Step 3 — edit, copy, move, and create script
```bash
nano ~/project/docs/report.txt
```
Append this exact line:
```text
Appended line using nano.
```
Save (`Ctrl+O`, Enter) and exit (`Ctrl+X`).

Then:
```bash
cp ~/project/docs/report.txt ~/project/scripts/
mv ~/project/docs/.secret.txt ~/project/bin/classified.txt
cat > ~/project/scripts/install.sh <<'EOF'
#!/bin/bash
echo "Installing project dependencies..."
EOF
```

## Step 4 — permissions
```bash
chmod a+x ~/project/scripts/install.sh
chmod o-r ~/project/bin/classified.txt
touch ~/project/docs/admin_notes.txt
chmod 600 ~/project/docs/admin_notes.txt
```

## Step 5 — cleanup and backup
```bash
rm ~/project/docs/admin_notes.txt
mkdir -p ~/project/backup
cp -a ~/project/docs/. ~/project/backup/
cp -a ~/project/scripts/. ~/project/backup/
```

## Final checks
```bash
cd ~
tree project
ls -la ~/project/docs
ls -la ~/project/scripts
ls -la ~/project/bin
ls -la ~/project/backup
```
If needed, install `tree` from an account with sudo privileges:
```bash
sudo apt update
sudo apt install tree
```

## Bonus
```bash
history > ~/commands_used.txt
```
