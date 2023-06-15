Add-Content $PROFILE -Value '$env:STARSHIP_CONFIG = "$env:USERPROFILE\.config\starship\starship.toml"'
Add-Content $PROFILE -Value 'Invoke-Expression (&starship init powershell)'
