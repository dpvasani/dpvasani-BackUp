# GitHub Backup Script

A PowerShell script to automatically backup all your GitHub repositories locally.

## Description

This script automates the process of cloning and updating all repositories from a GitHub user account. It keeps your local backup synchronized with your remote GitHub repositories.

## Features

- ✅ Automatically authenticates with GitHub CLI
- ✅ Clones all repositories from a specified GitHub account
- ✅ Updates existing repositories with latest changes
- ✅ Handles up to 1000 repositories
- ✅ Creates organized backup structure

## Prerequisites

Before running this script, you need:

1. **PowerShell** (Windows PowerShell 5.1 or PowerShell 7+)
2. **GitHub CLI (gh)** - [Download here](https://cli.github.com/)
3. **Git** - [Download here](https://git-scm.com/downloads)

### Installing GitHub CLI

**Windows:**
```powershell
winget install --id GitHub.cli
```

Or download from: https://cli.github.com/

**Verify Installation:**
```powershell
gh --version
git --version
```

## Setup

1. **Clone or Download this repository:**
   ```powershell
   git clone https://github.com/dpvasani/dpvasani-BackUp.git
   cd dpvasani-BackUp
   ```

2. **Configure the script (Optional):**
   
   Open `dpvasani-github-backup.ps1` and modify these variables if needed:
   ```powershell
   $username = "dpvasani"      # Change to your GitHub username
   $backupFolder = "dpvasani"  # Change backup folder name if desired
   ```

## Usage


## Quick Start

▶ **Run again:**

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\dpvasani-github-backup.ps1
```

## How it works

- Asks for GitHub login only if needed
- Clones all repos into the `dpvasani` folder
- Pulls updates for all repos on subsequent runs
- Works forever—just rerun the script to keep your backup up to date!

---

### First Time Run

On first execution:
- The script will check if you're logged into GitHub CLI
- If not logged in, it will prompt you to authenticate
- Follow the on-screen instructions to complete GitHub authentication
- Choose your preferred authentication method (browser or token)

### Subsequent Runs

- The script will update all existing repositories
- Clone any new repositories that were created since last run
- Display progress for each repository

## Execution Policy

If you encounter an execution policy error, run this command:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

## Output Structure

The script creates the following structure:

```
Current Directory/
├── dpvasani-github-backup.ps1
├── Readme.md
└── dpvasani/                    # Backup folder
    ├── repository-1/
    ├── repository-2/
    ├── repository-3/
    └── ...
```

## Script Workflow

1. **Authentication Check**: Verifies GitHub CLI authentication
2. **Login Prompt**: Initiates login if not authenticated
3. **Folder Creation**: Creates backup folder if it doesn't exist
4. **Repository List**: Fetches all repositories from GitHub account
5. **Clone/Update**:
   - Clones new repositories
   - Pulls latest changes for existing repositories
6. **Completion**: Displays completion message

## Troubleshooting

### Error: "gh: command not found"
- Install GitHub CLI: `winget install --id GitHub.cli`
- Restart PowerShell after installation

### Error: "git: command not found"
- Install Git from: https://git-scm.com/downloads
- Restart PowerShell after installation

### Error: "Execution Policy"
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Authentication Issues
```powershell
gh auth logout
gh auth login
```

### Permission Denied
- Run PowerShell as Administrator
- Check folder permissions

## Scheduling Automatic Backups

You can schedule this script to run automatically using Windows Task Scheduler:

1. Open Task Scheduler
2. Create Basic Task
3. Set trigger (daily, weekly, etc.)
4. Action: Start a program
5. Program: `powershell.exe`
6. Arguments: `-File "C:\path\to\dpvasani-github-backup.ps1"`

## Author

**dpvasani**
- GitHub: [@dpvasani](https://github.com/dpvasani)

## License

This project is open source and available under the MIT License.

## Contributing

Contributions, issues, and feature requests are welcome!

## Notes

- The script handles up to 1000 repositories by default
- Existing repositories are updated with `git pull`
- New repositories are cloned automatically
- Failed operations will display error messages but continue with remaining repos

## Version History

- **v1.0** - Initial release with basic backup functionality

---

**Last Updated:** December 28, 2025