if (Test-Path -Path ".\setup.bat") {
    Set-Location ..
}

. "$PSScriptRoot\functions.ps1"

Write-Host "`nStarting Project setup for:" -ForegroundColor Cyan
Write-Host $PWD

& "$PSScriptRoot\setup-git-lfs.ps1"

& "$PSScriptRoot\setup-git-options.ps1"

& "$PSScriptRoot\setup-unityyamlmerge.ps1"

& "$PSScriptRoot\setup-merge-rules.ps1"

& "$PSScriptRoot\setup-submodules.ps1"

Write-Host "`nProject setup completed!" -ForegroundColor Cyan
