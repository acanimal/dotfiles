#!/bin/bash

# Install oh-my-zsh
echo "Installing Oh My Zsh..."
if [ -d "$HOME/.oh-my-zsh" ]; then
  echo "Oh My Zsh is already installed. Skipping installation."
else
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  echo "Oh My Zsh installed successfully."
fi

# Install zsh-autosuggestions
echo "Installing the zsh-autosuggestions plugin..."
if [ -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
  echo "zsh-autosuggestions is already installed. Skipping installation."
else
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  echo "zsh-autosuggestions installed successfully."
fi

# Install zsh-syntax-highlighting
echo "Installing the zsh-syntax-highlighting plugin..."
if [ -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
  echo "zsh-syntax-highlighting is already installed. Skipping installation."
else
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  echo "zsh-syntax-highlighting installed successfully."
fi

# Install zsh-autocomplete
echo "Installing the zsh-autocomplete plugin..."
if [ -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autocomplete" ]; then
  echo "zsh-autocomplete is already installed. Skipping installation."
else
  git clone https://github.com/marlonrichert/zsh-autocomplete.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autocomplete
  echo "zsh-autocomplete installed successfully."
fi
