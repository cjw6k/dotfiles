Param (
    [Parameter(Mandatory=$False)] $distro
)

if (!$distro) {
    $distro = "gentoo"
}

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
        "that's not a thing"
    }
}
