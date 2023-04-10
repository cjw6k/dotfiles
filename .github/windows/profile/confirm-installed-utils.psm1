function Confirm-InstalledUtils {
  $utils = Get-Content "~/.config/dotfiles/utils.json" | ConvertFrom-Json

  $commands = @()
  foreach ($util in $utils) {
    if ($util.provides -eq $null) {
      $commands += $util.name
      continue
    }

    $commands += $util.provides
  }

  $allConfirmed = $true
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

  if ($allConfirmed -eq $false) {
    throw "Required utilities are not present."
  }
}

Export-ModuleMember -Function Confirm-InstalledUtils
