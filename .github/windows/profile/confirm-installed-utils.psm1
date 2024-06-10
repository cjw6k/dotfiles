function Confirm-InstalledUtils {
  $pathAdditions = @(
    "$env:USERPROFILE\scoop\shims",
    "$env:USERPROFILE\scoop\apps\python\current\Scripts",
    "$env:USERPROFILE\scoop\apps\yarn\current\global\node_modules\.bin",
    "$env:USERPROFILE\scoop\apps\yarn\current\bin",
    "$env:USERPROFILE\scoop\apps\elixir\current\bin"
  )
  foreach ($pathAddition in $pathAdditions) {
    if ([System.IO.Directory]::Exists($pathAddition)) {
      $env:Path = "$pathAddition;$env:Path"
    }
  }

  $utils = @()
  foreach ($util in Get-Content '~/.config/dotfiles/utils/standard.json' | ConvertFrom-Json) {
    $utils += $util
  }

  foreach ($file in Get-ChildItem '~/.config/dotfiles/utils/dev/*.json') {
    foreach ($util in Get-Content $file | ConvertFrom-Json) {
      $utils += $util
    }
  }

  $commands = @()
  foreach ($util in $utils) {
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
