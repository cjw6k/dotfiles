function Confirm-InstalledUtils {
  $utils = Get-Content "~/.config/dotfiles/utils.json" | ConvertFrom-Json

  $commands = @()
  foreach ($util in $utils) {
    if ($util.personal) {
      continue
    }

    if ($null -eq $util.provides) {
      $commands += $util.name
      continue
    }

    if ($null -ne $util.provides.common) {
      $commands += $util.provides.common
    }

    if ($null -ne $util.provides.windows) {
      $commands += $util.provides.windows
    }
  }

  $allConfirmed = $true
  Write-Host "Commands"
  foreach ($command in $commands) {
    $hasShim = scoop which $command 6>$null

    $allConfirmed = $allConfirmed -and $hasShim

    if ($hasShim) {
      Write-Host -NoNewLine "✔️ "
    } else {
      Write-Host -NoNewLine "❌ "
    }

    Write-Host "$command is $hasShim"
  }

  if ($allConfirmed -ne $true) {
    throw "Required utilities are not present."
  }

  # dumb hack
  cmd /c exit 0
}

Export-ModuleMember -Function Confirm-InstalledUtils
