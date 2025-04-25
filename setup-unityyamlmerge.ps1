Write-Host "`nConfiguring UnityYAMLMerge..." -ForegroundColor Yellow
try {
    $yamlMergePath = Get-UnityYAMLMergePath
    if (-not $yamlMergePath) {
        throw "Could not find UnityYAMLMerge.exe"
    }

    $cmd = "& '$yamlMergePath' merge -p `"`$BASE`" `"`$REMOTE`" `"`$LOCAL`" `"`$MERGED`""
    Write-Host "$cmd" -ForegroundColor DarkGray
    git config mergetool.unityyamlmerge.cmd $cmd
    git config mergetool.unityyamlmerge.trustExitCode false

    Write-Host "Configured Successfully." -ForegroundColor Green
}
catch {
    Write-Error "Failed to configure UnityYAMLMerge: $_"
    exit 1
}
