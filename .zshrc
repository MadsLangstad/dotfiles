# Prompt
PROMPT='%F{green}%F{blue}%~%f '

# Set the maximum number of history entries
HISTSIZE=5000
SAVEHIST=5000

# Define the file where history is saved
HISTFILE=~/.zsh_history

# Prevent duplicates and empty commands in history
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY # Share history across sessions

# NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# Set default editor
export EDITOR="code"

# iTerm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# SDKMAN for managing Java versions
export JAVA_HOME="$HOME/.sdkman/candidates/java/current"
export PATH="$JAVA_HOME/bin:$PATH"

# Android SDK
export ANDROID_HOME=~/Library/Android/sdk
export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$PATH"

# Laravel
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# Aliases
# Terminal
alias ll="ls -lG"
alias c="clear"
alias sz="source ~/.zshrc"
alias sb="source ~/.bashrc"
alias vi="nvim"

# Ollama
alias oq="ollama run qwen2.5-coder:latest"
alias og="ollama run granite3.1-moe"
alias od="ollama run deepseek-r1:8b"

# Homebrew
alias brewf="brew update && brew upgrade && brew cleanup && brew doctor"

# Docker
alias d="docker"
alias lwlvl="docker start -ai ubuntu-lowlevel"
alias kali="docker start -ai kali-hacking"

# Easy HTTP server
alias serve="python3 -m http.server"

# Arduino
alias arduino='open -a "Arduino IDE"'

# Functions
# Create directories and navigate into them
function take {
  mkdir -p "$1"
  cd "$1"
}

# Quick notes
function note {
  echo "Date: $(date)" >> "$HOME/drafts.txt"
  echo "$@" >> "$HOME/drafts.txt"
  echo "" >> "$HOME/drafts.txt"
}

# SDKMAN initialization (must be at the end of the file)
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
