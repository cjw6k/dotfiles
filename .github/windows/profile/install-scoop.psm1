function Install-Scoop {
    Set-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem' -Name 'LongPathsEnabled' -Value

    Invoke-Expression "& {$(Invoke-RestMethod get.scoop.sh)}"

    scoop config 'aria2-warning-enabled' $false
    scoop config 'aria2-enabled' $false

    scoop install aria2 7zip git

    scoop update
    scoop status

    scoop install innounp dark lessmsi
}

Export-ModuleMember -Function Install-Scoop
