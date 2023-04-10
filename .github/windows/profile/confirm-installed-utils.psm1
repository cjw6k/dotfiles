function Confirm-InstalledUtils {
  $utils = Get-Content "~/.config/dotfiles/utils.json" | ConvertFrom-Json

  $commands = @()
  $modules = @()
  foreach ($util in $utils) {
    if ($util.installer -eq "psmodule") {
      $modules += $util.provides
      continue
    }

    if ($util.provides -eq $null) {
      $commands += $util.name
      continue
    }

    $commands += $util.provides
  }

  $allConfirmed = $true
  Write-Host "Commands"
  foreach ($command in $commands) {
    ($hasShim = shovel which $command) *>$null
    
    $allConfirmed = $allConfirmed -and $hasShim

    if ($hasShim) {
      Write-Host -NoNewLine "✔️ "
    } else {
      Write-Host -NoNewLine "❌ "
    }

    Write-Host $command
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

  if ($allConfirmed -eq $false) {
    throw "Required utilities are not present."
  }
}

Export-ModuleMember -Function Confirm-InstalledUtils
