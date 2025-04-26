if (-not (Get-Command -Name 'Get-UnityVersion' -ErrorAction SilentlyContinue)) {
    . "$PSScriptRoot\functions.ps1"
}

Write-Host "`nConfiguring Git submodules..." -ForegroundColor Yellow
try{
    git config submodule.recurse true
    git config fetch.recurseSubmodules true
    git config pull.recurseSubmodules true
    Write-Host "Fetching remote submodules..." -ForegroundColor DarkGray
    git submodule update --init --recursive --remote

    Write-Host "Configured Successfully." -ForegroundColor Green
}
catch {
    Write-Error "Failed to set Git submodule configurations: $_"
    exit 1
}
