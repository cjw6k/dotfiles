function Confirm-InstalledUtils {
  $utils = Get-Content "~/.config/dotfiles/utils.json" | ConvertFrom-Json

  $commands = @()
  $modules = @()
  foreach ($util in $utils) {
    if ($util.type -eq "personal") {
      continue
    }

    if ($util.type -eq "psmodule") {
      $modules += $util.name
      continue
    }

    if ($null -eq $util.provides) {
      $commands += $util.name
      continue
    }

    $commands += $util.provides
  }

  $allConfirmed = $true
  Write-Host "Commands"
  foreach ($command in $commands) {
    $hasShim = shovel which $command 6>$null

    $allConfirmed = $allConfirmed -and $hasShim

    if ($hasShim) {
      Write-Host -NoNewLine "✔️ "
    } else {
      Write-Host -NoNewLine "❌ "
    }

    Write-Host "$command is $hasShim"
  }

  Write-Host "Modules"
  foreach ($module in $modules) {
    ($isFound = Find-Package $module) *>$null

    $allConfirmed = $allConfirmed -and $isFound

    if ($isFound) {
      Write-Host -NoNewLine "✔️ "
    } else {
      Write-Host -NoNewLine "❌ "
    }

    Write-Host $module
  }

  if ($allConfirmed -ne $true) {
    throw "Required utilities are not present."
  }

  # dumb hack
  cmd /c exit 0
}

Export-ModuleMember -Function Confirm-InstalledUtils
