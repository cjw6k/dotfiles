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
    
    "ubuntu" {
        wsl ~ -d ubuntu
    }
    
    "rocky" {
        wsl ~ -d rocky
    }
    
    default {
        "that's not a thing"
    }
}
