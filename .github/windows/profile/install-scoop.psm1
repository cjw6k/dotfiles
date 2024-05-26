function Install-Scoop {
    Set-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem' -Name 'LongPathsEnabled' -Value 1

    Invoke-Expression "& {$(Invoke-RestMethod get.scoop.sh)}"
    Write-Output "$Env:USERPROFILE\scoop\shims" | Out-File -FilePath $env:GITHUB_PATH -Encoding utf8 -Append

    scoop config 'aria2-warning-enabled' $false
    scoop config 'aria2-enabled' $false

    scoop install aria2 7zip git

    scoop update
    scoop status

    scoop install innounp dark lessmsi
}

Export-ModuleMember -Function Install-Scoop
