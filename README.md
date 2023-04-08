# dotfiles

cjw6k's dotfiles, managed with [chezmoi](https://github.com/twpayne/chezmoi).

## !! WIP !!
I have published dotfiles in a few iterations over many years. I'm making a fresh start. These are not yet in use, not ready for use, and are incomplete. I'm using a public repo at this early stage to greatly simplify the build out. These dotfiles will remain public.

## Background
* I have been at this computerin' thing for more than 25 years.
* I do admin, ops, networks, hardware, and software.
* I do not do ai, crypto, or mobile.
* I am working on cloud in my free time.
* I use Windows: 10 as my main workstation and 11 on a laptop. 
* I use Linux: alpine, gentoo, debian, ubuntu and centos. In Docker, WSL2, VM, VPS, and on bare metal. 
* I use BSD.
* I do not use MacOS. I will someday.

I need these dotfiles to work everywhere. They will cover a lot.

## Bootstrapping
Get [`chezmoi`](https://chezmoi.io/install/) and install these dotfiles with `chezmoi init cjw6k`.

### Windows
> While building out these dotfiles I'm focused on the windows deployment and run everything in a Windows virtual machine. If the reader would like to try out these dotfiles in Windows without messing around creating test users and without mixing up the home folder, [try a windows VM](https://developer.microsoft.com/en-us/windows/downloads/virtual-machines/)!

1. Get [Powershell 7](https://aka.ms/PSWindows).
1. Get [Scoop](https://github.com/ScoopInstaller/Install#scoop-uninstaller).
1. Replace Scoop w/ [Shovel](https://github.com/Ash258/Scoop-Core#Installation).
   * the docs aren't clear on this, but do fix any warnings shown after running `scoop checkup`. 
1. Get chezmoi w/ `shovel install chezmoi`.
