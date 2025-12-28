$username = "dpvasani"
$backupFolder = "dpvasani"

Write-Host "Checking GitHub authentication..."

$auth = gh auth status 2>$null
if ($auth -notmatch "Logged in") {
    Write-Host "GitHub not logged in. Starting login..."
    gh auth login
}

if (!(Test-Path $backupFolder)) {
    New-Item -ItemType Directory -Path $backupFolder | Out-Null
}

Set-Location $backupFolder

Write-Host "Syncing repositories for $username..."

$repos = gh repo list $username --limit 1000 --json nameWithOwner | ConvertFrom-Json

foreach ($repo in $repos) {
    $name = $repo.nameWithOwner.Split("/")[1]

    if (Test-Path $name) {
        Write-Host "Updating $name"
        Set-Location $name
        git pull
        Set-Location ..
    } else {
        Write-Host "Cloning $name"
        gh repo clone $repo.nameWithOwner
    }
}

Write-Host ""
Write-Host "GitHub Backup Completed"
