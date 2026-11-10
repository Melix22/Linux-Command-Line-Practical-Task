# Kali Linux Command Line Practical

## Objective
Complete the supplied Linux Command Line Practical Task as the newly created user `student01` on Kali Linux.

This repository contains an execution guide, helper scripts, evidence folders, and a GitHub Actions validation workflow. The scripts assist with the requested tasks; they do not replace the required manual `nano` editing step or the learner's screenshots/evidence.

## Requirements covered
- Create `student01`, set a password, and add the account to `sudo` if required.
- Create `project/docs`, `project/scripts`, and `project/bin`.
- Create and edit `report.txt`; create the hidden `.secret.txt`.
- Copy and move/rename files as specified.
- Create `install.sh` with the required content.
- Apply the requested permissions.
- Delete `admin_notes.txt`.
- Create `backup` and copy the contents of `docs` and `scripts` into it.
- Verify with `tree project` and `ls -la`.
- Optional: save command history to `commands_used.txt`.

## Repository layout
```text
.
├── .github/workflows/validate.yml
├── commands/step-by-step-commands.md
├── scripts/01-create-user.sh
├── scripts/02-complete-project.sh
├── scripts/03-final-checks.sh
├── evidence/README.md
├── screenshots/README.md
└── README.md
```

## Before you begin
1. Use a Kali Linux VM or installation where you are authorized to administer local users.
2. Keep your existing administrator account available for the account-creation step.
3. Do not commit passwords, private keys, or other secrets to GitHub.
4. The `evidence/` and `screenshots/` directories are placeholders. Add your own genuine terminal output and screenshots after completing the lab.

## Step 1 — Create the user (existing administrator account)
Open a terminal using your existing account and run:

```bash
chmod +x scripts/01-create-user.sh
sudo ./scripts/01-create-user.sh
```

The script creates `student01`, adds it to the `sudo` group when that group exists, and prompts you to set the password interactively. If the user already exists, it will not recreate it.

Switch to the new account:

```bash
su - student01
whoami
```

Expected `whoami` output: `student01`.

## Step 2–5 — Complete the practical as student01
From the repository directory (or copy the scripts folder to your Kali machine), run:

```bash
chmod +x scripts/02-complete-project.sh scripts/03-final-checks.sh
./scripts/02-complete-project.sh
```

The project script:
- creates the required directory and file structure;
- creates the initial report and hidden file;
- pauses so you can open `nano` and append the required second line;
- copies/moves/renames files;
- creates `install.sh`;
- applies the requested permissions;
- creates and then deletes `admin_notes.txt`;
- creates `backup` and copies the contents of `docs` and `scripts` into it.

When prompted, open the report in nano using the command shown, append the exact second line, save with `Ctrl+O`, press `Enter`, and exit with `Ctrl+X`. The script then continues.

**Run the project script from your normal working directory.** It creates `~/project` and does not require root privileges.

## Step 6 — Final checks
Still as `student01`, run:

```bash
./scripts/03-final-checks.sh
```

If `tree` is not installed, the script will tell you. Install it from an administrator account using:

```bash
sudo apt update
sudo apt install tree
```

Then rerun the final-check script. Check that:
- `install.sh` has executable permission for user, group, and others;
- `classified.txt` has no read permission for others;
- `admin_notes.txt` is absent;
- backup contains copies of the docs and scripts contents.

The requested `admin_notes.txt` mode is `600` (owner read/write only). The requested `classified.txt` change removes only the `others` read bit; other existing permission bits are retained.

## Optional bonus — save command history
As `student01`, run:

```bash
history > ~/commands_used.txt
```

This captures the current shell's history available at that point. It is optional.

## GitHub upload using Git Bash (Windows)
The ZIP is a starter project for your lab. After extracting it on Windows:

```bash
cd /c/Users/YOUR-WINDOWS-USERNAME/Downloads/kali-linux-command-line-practical
git init
git add .
git commit -m "Add Kali Linux command line practical workflow"
git branch -M main
git remote add origin https://github.com/YOUR-GITHUB-USERNAME/kali-linux-command-line-practical.git
git push -u origin main
```

Replace the example Windows path and GitHub username/repository URL with your own. Create an empty repository on GitHub first. If the remote is already configured, use `git remote -v` and do not add it again.

## Evidence to submit
Add authentic screenshots and/or terminal output to `screenshots/` and `evidence/`. Suggested evidence:
1. `whoami` showing `student01`.
2. `ls -la ~/project/docs` showing the report and hidden-file state before the move, if captured during the task.
3. `nano` report showing the two required lines (or `cat ~/project/docs/report.txt` after saving).
4. `ls -l` for `install.sh` and `classified.txt`.
5. `tree ~/project` and `ls -la` final checks.
6. `cat ~/commands_used.txt` if completing the bonus.

Do not fabricate evidence. The GitHub Actions workflow checks repository structure and shell-script syntax only; it does not prove that the Kali lab was executed.
