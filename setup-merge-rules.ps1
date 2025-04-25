Write-Host "`nConfiguring MergeRules..." -ForegroundColor Yellow

$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
$isAdmin = $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Write-Host "MergeRules setup requires admin privileges." -ForegroundColor Red
    Write-Host "Start-Process powershell.exe -Verb RunAs" -ForegroundColor DarkGray
    exit
}

try {
    $mergeRulesPath = Get-UnityMergeRulesPath

    $localRules = Get-Content "$PSScriptRoot\mergerules.txt" -Raw

    Write-Host $localRules -ForegroundColor DarkGray

    Add-Content -Path $mergeRulesPath -Value "`n$localRules"

    Write-Host "Configured Successfully." -ForegroundColor Green
}
catch {
    Write-Error "Failed to configure MergeRules: $_"
    exit 1
}
