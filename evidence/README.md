# Evidence

Place genuine evidence for the completed Kali practical in this folder.

Suggested files:
- `whoami.txt` — output showing `student01`.
- `final-tree.txt` — output of `tree ~/project`.
- `permissions.txt` — output of `ls -la` for the required directories.
- `report.txt` — output of `cat ~/project/docs/report.txt`.
- `history.txt` — optional history output.

Example capture commands (run as student01):
```bash
whoami > whoami.txt
tree ~/project > final-tree.txt
{
  ls -la ~/project/docs
  ls -la ~/project/scripts
  ls -la ~/project/bin
  ls -la ~/project/backup
} > permissions.txt
cat ~/project/docs/report.txt > report.txt
```
These commands write files in the current working directory. Copy the resulting evidence into this folder before committing. Do not create evidence by editing outputs to imply a task succeeded.
