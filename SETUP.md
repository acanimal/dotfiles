# Setup

This doc describes the steps to replicate my usual environment configuration, applications and programs.

---

## About the software

This section describes the software I tend to use the most and that is installed following the steps described in the `Installation` section.

- Homebrew needed for everything else: https://brew.sh

For terminal:
- iTerm (`brew install --cask item2`) 
- Oh My Zsh (https://ohmyz.sh)
- Powerlevel10k (https://github.com/romkatv/powerlevel10k) Remember to update `.zshrc` file and set the new oh-my-zsh theme.
- zsh-autosuggestions (https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh)
- zsh-syntax-highligthing (https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh)

For NodeJS:
- nvm (https://github.com/nvm-sh/nvm) and install your preferred nodejs version.
- git (`brew install git`)

Editors:
- emacs (`brew cask install emacs`)
- doomemacs (https://github.com/doomemacs/doomemacs) I like to test things on this emacs distro.
- chemacs2 (https://github.com/plexus/chemacs2) Emacs version switcher that allows to work with more than one version of emacs.
- vscode (https://code.visualstudio.com/)
- Helix editor
- NeoVim editor 

Other:
- command line tool: ripgrep, coreutils, fd
- to install fonts with Homebrew just install `brew tap homebrew/cask-fonts`. Now you can search for fonst with `brew search font- | grep cascadia` and install with `brew install font-cascadia-code --cask`


## Installation

Run the next commands to install software via `brew`:

```
brew tap homebrew/cask-fonts
brew install "git"
brew install "ripgrep"
brew install "coreutils"
brew install "fd"
brew install "fzf"
brew install cask "iterm2"
brew install cask "emacs"
brew install cask "helix"
brew install cask "neovim"
brew install cask "slack"
brew install cask "spotify"
brew install cask "whatsapp"
```

Open vanilla emacs with `emacs &` and let all package dependencies to be installed. Once pacakges are installed run `M-x nerd-icons-install-fonts` to install fonts needed by doomemacs-modeline package.

Install doomemacs into `.emacs.doom.d` folder (follow the installation instructions).
Then run `> doom install`.
The custom configuration for doomemacs if found at `.doom.d` folder.

### About install NeoVim

Instal vim-plug package manager:
```
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
