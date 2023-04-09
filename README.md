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
* I use Linux: alpine, gentoo, debian, and ubuntu. In Docker, WSL2, VM, VPS, and on bare metal. 
* I use BSD.
* I do not use MacOS. I will someday.

I need these dotfiles to work everywhere. They will cover a lot.

## Bootstrapping
Get [`chezmoi`](https://chezmoi.io/install/) and install these dotfiles with `chezmoi init cjw6k`.

### Windows
> While building out these dotfiles I'm focused on the windows deployment and run everything in a Windows virtual machine. If the reader would like to try out these dotfiles in Windows without messing around creating test users and without mixing up the home folder, [try a windows VM](https://developer.microsoft.com/en-us/windows/downloads/virtual-machines/)!

1. Get [Powershell 7](https://aka.ms/PSWindows).
   * Run `terminal`.
     * Settings > Startup > Default profile: PowerShell.
     * Settings > Profiles > PowerShell > Command line: add `-NoLogo`
3. Get [Scoop](https://github.com/ScoopInstaller/Install#scoop-uninstaller).
   * _Don't change the execution policy as in the example there!_
     * Too late? We don't know what it may have been before, but restoring the default is: `Set-ExecutionPolicy -ExecutionPolicy Undefined -Scope CurrentUser`
5. Replace Scoop w/ [Shovel](https://github.com/Ash258/Scoop-Core#Installation).
   * the docs aren't clear on this, but do fix any warnings shown after running `scoop checkup`. 
6. Get chezmoi w/ `shovel install chezmoi`.

## Features

### Installed Utilities

> Items marked with * are recent additions and may be removed after eval.

#### Workstation

| Utility | Description | Windows | 
|---------|-------------|---------|
| [1password-cli](https://developer.1password.com/docs/cli/) | Provision secrets across development environments.
| [7zip](https://www.7-zip.org) | A file archiver with a high compression ratio. | :heavy_check_mark:
| [actionlint](https://github.com/rhysd/actionlint) | A linter for GitHub Actions workflow files.
| [ag](https://geoff.greer.fm/ag/) | A code-searching tool similar to ack, but faster.
| [alacritty*](https://github.com/alacritty/alacritty) | Cross-platform, GPU-accelerated terminal emulator.
| ah | Artifact Hub command line tool
| [chezmoi](https://chezmoi.io) | Manage your dotfiles across multiple diverse machines, securely. | :heavy_check_mark:
| [cmake](https://cmake.org/cmake/help/latest/manual/cmake.1.html) | Cross-platform build automation system.
| [composer](https://getcomposer.org/) | A package-based dependency manager for PHP projects.
| cousine-nf | Nerd Fonts patched 'Cousine' Font family.
| cousine-nf-mono | Nerd Fonts patched 'Cousine' Font family. Monospaced version.
| csview* | CSV viewer with cjk/emoji support.
| [delta](https://dandavison.github.io/delta/) | A viewer for git and diff output
| [dive](https://github.com/wagoodman/dive) | A tool for exploring a Docker image, layer contents, and discovering ways to shrink it.
| doctl | CLI for the DigitalOcean API.
| [dua*](https://github.com/Byron/dua-cli) | Disk Usage Analyzer
| [dust*](https://github.com/bootandy/dust) | Overview of which directories are using disk space.
| [ffmpeg](https://ffmpeg.org) | Audio/Video conversion tool.
| [gh](https://cli.github.com/) | Work seamlessly with GitHub from the command line.
| [git](https://git-scm.com/) | Distributed version control system. | :heavy_check_mark:
| [go](https://golang.org) | Tool for managing go source code.
| [gource](https://gource.io) | Renders an animated tree diagram of Git, SVN, Mercurial and Bazaar repositories.
| [grep](https://www.gnu.org/software/grep/manual/grep.html) | Find patterns in files using regular expressions.
| [grex*](https://github.com/pemistahl/grex) | Simple command-line tool to generate regular expressions.
| [hadolint](https://github.com/hadolint/hadolint) | Dockerfile linter.
| [helm](https://helm.sh/) | A package manager for Kubernetes.
| [hexyl](https://github.com/sharkdp/hexyl) | Hex viewer for the terminal.
| [hyperfine](https://github.com/sharkdp/hyperfine/) | A command-line benchmarking tool.
| [jq](https://stedolan.github.io/jq/) | A command-line JSON processor that uses a domain-specific language.
| [kate*](https://kate-editor.org/) | KDE's advanced text editor.
| [kind](https://github.com/kubernetes-sigs/kind) | Tool for running local Kubernetes clusters using Docker container "nodes".
| [kompose*](https://github.com/kubernetes/kompose) | A tool to convert docker-compose applications to Kubernetes.
| [kubectl](https://kubernetes.io/docs/reference/kubectl/) | Command-line interface for running commands against Kubernetes clusters.
| [kubescape*](https://github.com/kubescape/kubescape) | A tool for testing Kubernetes security posture.
| [kubeseal](https://github.com/bitnami-labs/sealed-secrets) | Asymmetric crypto to encrypt secrets for kubernetes.
| llvm
| [lsd*](https://github.com/Peltoche/lsd) | List directory contents.
| [lua](https://www.lua.org) | A powerful, light-weight embeddable programming language.
| luarocks
| lychee
| [make](https://www.gnu.org/software/make/manual/make.html) | Task runner for targets described in Makefile.
| [micro](https://micro-editor.github.io) | A modern and intuitive terminal-based text editor.
| [nano](https://nano-editor.org) | Command-line text editor.
| [neofetch](https://github.com/dylanaraps/neofetch) | display information about your operating system, software and hardware.
| nerdctl*
| [nodejs](https://nodejs.org) | Server-side JavaScript platform.
| okteto
| onefetch
| [openssl](https://www.openssl.org) | OpenSSL cryptographic toolkit.
| [php-nts](https://php.net) | PHP command-line interface.
| posh-git
| [procs*](https://github.com/dalance/procs) | Display information about the active processes.
| [python](https://www.python.org) | Python language interpreter.
| [sass](https://sass-lang.com) | Converts SCSS or Sass files to CSS.
| [shellcheck](https://www.shellcheck.net) | Shell script static analysis tool.
| shfmt
| stylua
| [sudo](https://www.sudo.ws/) | Executes a single command as the superuser or another user.
| task
| tealdeer
| [terraform](https://www.terraform.io/) | Create and deploy infrastructure as code to cloud providers.
| [tokei*](https://github.com/XAMPPRocky/tokei) | Print out statistics about code.
| [touch](https://manned.org/man/freebsd-13.1/touch) | Create files and set access/modification times.
| [yarn](https://yarnpkg.com) | JavaScript and Node.js package manager alternative.

Cygwin

w64devkit
