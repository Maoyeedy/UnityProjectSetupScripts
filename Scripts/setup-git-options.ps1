if (-not (Get-Command -Name 'Get-UnityVersion' -ErrorAction SilentlyContinue)) {
    . "$PSScriptRoot\functions.ps1"
}

Write-Host "`nConfiguring Git Options..." -ForegroundColor Yellow
try {
    git config core.autocrlf true
    Write-Host "core.autocrlf set to true" -ForegroundColor DarkGray
    git config core.safecrlf false
    Write-Host "core.safecrlf set to false" -ForegroundColor DarkGray
    git config core.longpaths true
    Write-Host "core.longpaths set to true" -ForegroundColor DarkGray
    git config pull.rebase true
    Write-Host "pull.rebase set to true" -ForegroundColor DarkGray

    Write-Host "Configured Successfully." -ForegroundColor Green
}
catch {
    Write-Error "Failed to set Git configurations: $_"
    exit 1
}
