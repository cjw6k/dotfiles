# dotfiles

cjw6k's dotfiles, managed with [chezmoi](https://github.com/twpayne/chezmoi).

## !! WIP !!
I have published dotfiles in a few iterations over many years. I'm making a fresh start. These are not yet in use, not ready for use, and are incomplete. I'm using a public repo at this early stage to greatly simplify the build out. These dotfiles will remain public.

## Professional Background
* Training: electronics engineering technology.
* Daily Work: admin, ops, networks, cloud, and software.
* Pursuit: llm.
* Known Unknowns: crypto and mobile.

## Working Stack
* I use Windows 11 as my main workstation, and on a laptop.
* I use Linux: alpine, gentoo, debian, and ubuntu. In K8s, Docker, WSL2, VM, VPS, and on bare metal.
* I use BSD.
* I do not use macOS. I will someday.

I need these dotfiles to work everywhere. They will cover a lot.

## Bootstrapping
Get [`chezmoi`](https://chezmoi.io/install/) and checkout the [quick start](https://www.chezmoi.io/quick-start/#start-using-chezmoi-on-your-current-machine) docs.

> Don't clobber your home directory by applying these dotfiles unless you are good and ready!

Install and apply my dotfiles with `chezmoi init --apply cjw6k`. Better yet, [fork the dotfiles](https://github.com/cjw6k/dotfiles/fork) and init from _your own dotfiles repo_ where you can make them whatever you want them to be.

### Windows
> While building out these dotfiles I'm focused on the windows deployment and run everything in a Windows virtual machine. If the reader would like to try out these dotfiles in Windows without messing around creating test users and without mixing up the home folder, [try a Windows VM](https://developer.microsoft.com/en-us/windows/downloads/virtual-machines/)!

1. Get [Powershell 7](https://aka.ms/PSWindows).
   * Run `terminal`.
     * Settings > Startup > Default profile: PowerShell.
     * Settings > Profiles > PowerShell > Command line: add `-NoLogo`
2. Get [Scoop](https://github.com/ScoopInstaller/Install#scoop-uninstaller).
   * _Don't change the execution policy as in the example there!_
     * Too late? We don't know what it may have been before, but restoring the default is: `Set-ExecutionPolicy -ExecutionPolicy Undefined -Scope CurrentUser`
4. Get chezmoi w/ `scoop install chezmoi`.

## Features

### Personal Secrets w/ 1password
I use [1password](https://1password.com/), since 2019 or so. It is excellent. I can't recommend it enough.

When you init these dotfiles there is a prompt: "Should this machine have personal secrets?" Choosing yes will prompt you
to log in to 1password from the CLI. If successful, chezmoi will look for specific items by name in a vault named
"dotfiles" in your account.

| Item Name | Item Field          | Produces File                  | Purpose                                                                              |
|-----------|---------------------|--------------------------------|--------------------------------------------------------------------------------------|
| ssh key   | public key          | ~/.ssh/id_ed25519_dotfiles.pub | The public part of your SSH key that you use to access github from the CLI.          |
| ssh key   | openssh private key | ~/.ssh/id_ed25519_dotfiles     | The private part of your SSH key that you use to access github on the CLI.           |
| n/a       | n/a                 | ~/.ssh/config                  | Set the default identity file for all ssh connections to ~/.ssh/id_ed25519_dotfiles. |

#### Notes
##### OpenSSH Private Key
1password's SSH Key item type stores the private key without a passphrase, in PKCS #8 format. At the time of writing most available
openssh installs don't support ED25519 keys stored in PKCS #8 format, so we'll store a passphrase-protected version of the private key in an extra field.
1. After generating the SSH Key in 1password, export it -encrypted with a passphrase- to the clipboard.
2. Make a new text field on the SSH key: "openssh private key" and paste in the content.
3. Be sure that the text ends with a newline character.

Alternatively, if you generate the ssh key yourself on the cli e.g. `ssh-keygen -t ed25519 -a 100` you can copy that
content directly into the "openssh private key" field.

## Installed Utilities

| Utility                       | Description                                                      | Windows            |
|-------------------------------|------------------------------------------------------------------|--------------------|
| 1password-cli                 |                                                                  | :heavy_check_mark: |
| [7zip](https://www.7-zip.org) | A file archiver with a high compression ratio.                   | :heavy_check_mark: |
| [chezmoi](https://chezmoi.io) | Manage your dotfiles across multiple diverse machines, securely. | :heavy_check_mark: |
| [git](https://git-scm.com/)   | Distributed version control system.                              | :heavy_check_mark: |
| jq                            |                                                                  | :heavy_check_mark: |
| nano                          |                                                                  | :heavy_check_mark: |
