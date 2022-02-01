Param (
    [Parameter()] $distro,
    [Parameter()] $opAccount
)

if (!$distro) {
    $distro = "gentoo"
}

$env:HOST_IP4=(Get-NetIPAddress -AddressFamily IPV4 -InterfaceAlias 'vEthernet (WSL)').IPAddress
$env:WSLENV += ":HOST_IP4"

if ($opAccount) {
    try {
        $opSessionVar = (Get-Item -Path "Env:OP_SESSION_$opAccount" -ErrorAction stop).value
        if ($opSessionVar) {
            $env:WSLENV += ":OP_SESSION_$opAccount"
        }
    } catch {
        "op session $opAccount unavailable"
    }
}

$env:WSLENV = ($env:WSLENV.split(':') | Where {$_ -ne $null -and $_ -ne ''} | Sort | Get-Unique) -join ':'

Switch ($distro) {
    "gentoo" {
        wsl ~ -d gentoo
    }

    "debian" {
        wsl ~ -d debian
    }

    "ubuntu" {
        wsl ~ -d ubuntu
    }

    "rocky" {
        wsl ~ -d rocky
    }

    "kali" {
        wsl ~ -d kali-linux
    }

    default {
        "${distro}? that's not a thing"
    }
}
