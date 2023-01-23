# Setup

This docs describes the steps to replicate my usual environment configuration, applications and programs.

- Intell Homebrew need for everything else: https://brew.sh

For terminal:

- iTerm (`brew install --cask item2`) 
- Oh My Zsh (https://ohmyz.sh)
- Powerlevel10k (https://github.com/romkatv/powerlevel10k) Remember to update `.zshrc` file and set the new oh-my-zsh theme.
- zsh-autosuggestions (https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh)
- zsh-syntax-highligthing (https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh)

For NodeJS:
- nvm (https://github.com/nvm-sh/nvm)
- git (`brew install git`)

Editors:
- emacs (`brew cask install emacs`)
- doomemacs (https://github.com/doomemacs/doomemacs)
- vscode (https://code.visualstudio.com/)

Other:
- ripgrep command line tool (`brew install ripgrep`)
- to install fonts with Homebrew just install `brew tap homebrew/cask-fonts`. Now you can search for fonst with `brew search font- | grep cascadia` and install with `brew install font-cascadia-code --cask`


## Brew install script

```
brew tap homebrew/cask-fonts
brew install "git"
brew install "ripgrep"
brew install cask "iterm2"
brew install cask "emacs"
brew install cask "slack"
brew install cask "spotify"
brew install cask "whatsapp"
```

