# dotfiles

## :information_source: About

Dotfiles repository managed by [**yadm**](https://yadm.io/) (Yet Another Dotfiles Manager).

## :floppy_disk: Install Instructions

### 1. Install [Homebrew](https://brew.sh)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

#### Install Fonts

```bash
brew tap homebrew/cask-fonts
```

```bash
brew install --cask font-sauce-code-pro-nerd-font
```

### 2. Install [yadm](https://yadm.io/)

```bash
brew install yadm
```

### 3. Clone Dotfiles Repository

Clone the dotfiles repository using `yadm`.

```bash
yadm clone git@github.com:matthewmessmer/dotfiles.git
yadm decrypt
yadm perms
```

#### Force Overwrite of Local Dotfiles

The `clone` and `pull` command may result in warnings because of pre-existing dotfiles. Overwrite the existing files with commands below.

```bash
$ yadm fetch --all
$ yadm reset --hard origin/master
```

### 4. Set up [System Defaults](https://github.com/matthewmessmer/dotfiles/tree/master/System)

### 5. Set up [Zsh](https://github.com/matthewmessmer/dotfiles/tree/master/Zsh)

### 6. Set up [Git](https://github.com/matthewmessmer/dotfiles/tree/master/Git)

### 7. Set up [Vim](https://github.com/matthewmessmer/dotfiles/tree/master/Vim)

### 8. Other apps

Now go through other sections relevant to you, and set them up one by one.

<br />