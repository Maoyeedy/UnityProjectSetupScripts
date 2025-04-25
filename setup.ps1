try {
    . "$PSScriptRoot\functions.ps1"
}
catch {
    Write-Error "Failed to import $PSScriptRoot\functions.ps1."
    exit 1
}

Write-Host "`nStarting Unity project setup..." -ForegroundColor Cyan

& "$PSScriptRoot\setup-git-lfs.ps1"

& "$PSScriptRoot\setup-git-options.ps1"

& "$PSScriptRoot\setup-unityyamlmerge.ps1"

& "$PSScriptRoot\setup-submodules.ps1"

Write-Host "`nUnity project setup completed!" -ForegroundColor Cyan
