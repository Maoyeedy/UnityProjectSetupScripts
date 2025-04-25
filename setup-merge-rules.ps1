Assert-AdminPrivileges

Write-Host "`nConfiguring MergeRules..." -ForegroundColor Yellow
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
