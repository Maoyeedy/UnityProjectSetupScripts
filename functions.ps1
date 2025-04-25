function Get-UnityVersion {
    if (!(Test-Path ProjectSettings/ProjectVersion.txt)) {
        Write-Error "ProjectSettings/ProjectVersion.txt not found"
        return $null
    }
    return (Get-Content ProjectSettings/ProjectVersion.txt | Select-String "m_EditorVersion:").Line -replace '^m_EditorVersion:\s*'
}

function Get-UnityEditorPath {
    $userPathFile = "$env:APPDATA\UnityHub\secondaryInstallPath.json"
    if (-not (Test-Path $userPathFile)) {
        Write-Warning "Unity Hub not installed."
        return $null
    }

    # If using default path, then $userPath will be empty string
    $userPath = (Get-Content $userPathFile -Raw).Trim('"')

    # If userPath directory is set but deleted.
    # Unity Hub will recreate directory upon next Editor installation.
    if ((Test-Path $userPath)) {
        return $userPath
    }

    # Default path for Windows
    $defaultPath = "$env:ProgramFiles\Unity\Hub\Editor"
    if (Test-Path $defaultPath) {
        return $defaultPath
    }

    Write-Error "Could not determine Unity Editor installation path."
    return $null
}

function Get-UnityEditorInstallationPath {
    # e.g. 2022.3.42f1
    $version = Get-UnityVersion
    if (-not $version) {
        Write-Error "Cannot determine Unity version."
        return $null
    }

    # e.g. C:\Program Files\Unity\Hub\Editor
    $editorBasePath = Get-UnityEditorPath
    if (-not $editorBasePath) {
        Write-Error "Cannot determine Unity Editor base path."
        return $null
    }

    # Join two paths for full editor path
    $installPath = Join-Path $editorBasePath $version
    if (Test-Path $installPath) {
        return $installPath
    }

    Write-Error "Unity version $version not found in $editorBasePath"
    return $null
}

function Get-UnityYAMLMergePath {
    $editorPath = Get-UnityEditorInstallationPath
    if (-not $editorPath) {
        return $null
    }

    $yamlMergePath = Join-Path $editorPath "Editor\Data\Tools\UnityYAMLMerge.exe"
    if (Test-Path $yamlMergePath) {
        return $yamlMergePath
    }

    Write-Error "UnityYAMLMerge.exe not found at $yamlMergePath"
    return $null
}

function Get-UnityMergeRulesPath {
    $editorPath = Get-UnityEditorInstallationPath
    if (-not $editorPath) {
        return $null
    }

    $mergeRulesPath = Join-Path $editorPath "Editor\Data\Tools\mergerules.txt"
    if (Test-Path $mergeRulesPath) {
        return $mergeRulesPath
    }

    Write-Error "mergerules.txt not found at $mergeRulesPath"
    return $null
}
