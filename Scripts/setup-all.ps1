if (Test-Path -Path ".\Setup.bat") {
    # Ensure following scripts execute at project root
    Set-Location (Split-Path -Parent $PSScriptRoot)
}

. "$PSScriptRoot\functions.ps1"

Write-Host "`nStarting Project setup for:" -ForegroundColor Cyan
Write-Host $PWD

& "$PSScriptRoot\setup-git-lfs.ps1"

& "$PSScriptRoot\setup-git-options.ps1"

& "$PSScriptRoot\setup-submodules.ps1"

& "$PSScriptRoot\setup-unityyamlmerge.ps1"

& "$PSScriptRoot\setup-merge-rules.ps1"

Write-Host "`nProject setup completed!" -ForegroundColor Cyan
