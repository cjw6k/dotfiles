$env:SCOOP = Join-Path $env:USERPROFILE 'scoop'
[System.Environment]::SetEnvironmentVariable('SCOOP', $env:SCOOP, 'User')

function Install-Shovel {
    iex "& {$(irm get.scoop.sh)} -RunAsAdmin"
    echo "$Env:USERPROFILE\scoop\shims" | Out-File -FilePath $env:GITHUB_PATH -Encoding utf8 -Append

    Add-MpPreference -ExclusionPath "$env:SCOOP"
    Add-MpPreference -ExclusionPath "$env:ProgramData\scoop"

    Get-ChildItem "$env:SCOOP\shims" -Filter 'scoop.*' `
      | Copy-Item -Destination { Join-Path $_.Directory.FullName (($_.BaseName -replace 'scoop', 'shovel') + $_.Extension) }

    shovel config 'aria2-warning-enabled' $false
    shovel config 'aria2-enabled' $false

    shovel install aria2 7zip git

    shovel config 'SCOOP_REPO' 'https://github.com/Ash258/Scoop-Core.git'
    shovel update
    shovel status

    Set-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem' -Name 'LongPathsEnabled' -Value 1
    Add-Content $PROFILE `
      'Import-Module "$env:SCOOP\apps\scoop\current\supporting\completion\Scoop-Completion.psd1" -ErrorAction SilentlyContinue'

    shovel bucket add 'Base'
    shovel update

    shovel install innounp dark lessmsi
}

Export-ModuleMember -Function Install-Shovel
