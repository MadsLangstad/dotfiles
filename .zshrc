# Prompt
PROMPT='%F{green}%F{blue}%~%f '

# ──────────────────────────────────────────────────────────
# Historie-innstillinger
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history

setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY # Del historie på tvers av sessioner

# ──────────────────────────────────────────────────────────
# NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # Laster nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

# ──────────────────────────────────────────────────────────
# Standard editor
export EDITOR="code"

# ──────────────────────────────────────────────────────────
# iTerm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# ──────────────────────────────────────────────────────────
# Funksjon for å unngå duplikat i PATH
pathadd() {
  [[ ":$PATH:" != *":$1:"* ]] && export PATH="$1:$PATH"
}

# ──────────────────────────────────────────────────────────
# Android SDK
export ANDROID_HOME="$HOME/Library/Android/sdk"
export ANDROID_SDK_ROOT="$ANDROID_HOME"  # ← Viktig for emulator
pathadd "$ANDROID_HOME/emulator"
pathadd "/Applications/Android Studio.app/Contents/MacOS"
pathadd "$ANDROID_HOME/cmdline-tools/latest/bin"
pathadd "$ANDROID_HOME/platform-tools"

# ──────────────────────────────────────────────────────────
# Grunnleggende PATH
pathadd "/usr/local/bin"
pathadd "/usr/bin"
pathadd "/bin"
pathadd "/usr/sbin"
pathadd "/sbin"
pathadd "$HOME/.local/bin"
pathadd "$HOME/.composer/vendor/bin"
pathadd "/opt/homebrew/bin"

# ──────────────────────────────────────────────────────────
# Herd: PHP 8.4 konfig og bin
export HERD_PHP_84_INI_SCAN_DIR="/Users/mads/Library/Application Support/Herd/config/php/84/"
pathadd "/Users/mads/Library/Application Support/Herd/bin/"

# ──────────────────────────────────────────────────────────
# Aliases

# Terminal / System
alias ls="eza"
alias ll="ls -lG"
alias dlist="diskutil list"
alias c="clear"
alias cat="bat"
alias sz="source ~/.zshrc"
alias sb="source ~/.bashrc"
alias vi="nvim"
alias wcag="pa11y --runner axe --standard WCAG2AAA"
alias wifiadmin="open http://10.0.0.138"

# Ollama
alias oq="ollama run qwen2.5-coder:latest"
alias og="ollama run granite3.1-moe"
alias od="ollama run deepseek-r1:8b"

# Laravel
alias pa="php artisan"

# Expo
alias expo="npx expo"

# Homebrew
alias brewf="brew update && brew upgrade && brew cleanup && brew doctor"

# Docker
alias d="docker"
alias ubuntu-dev="docker exec -it ubuntu-dev-container bash"

# Enkel HTTP-server
alias serve="python3 -m http.server"

# Arduino
alias arduino='open -a "Arduino IDE"'

# IP-hjelp
alias myipv4="curl -4 ifconfig.me"
alias myipv6="curl -6 ifconfig.me"

# ──────────────────────────────────────────────────────────
# Funksjoner

# Opprett og cd inn i ny mappe
function take {
  mkdir -p "$1"
  cd "$1"
}

mkrepo() {
  # mkrepo my-app [-p|--public] [-d "Beskrivelse"] [--here]
  if [ -z "$1" ]; then
    echo "Bruk: mkrepo <navn> [-p|--public] [-d \"Beskrivelse\"] [--here]"
    return 1
  fi

  local NAME="$1"
  shift

  local VISIBILITY="--private"
  local DESC=""
  local HERE=0

  while [ $# -gt 0 ]; do
    case "$1" in
      -p|--public) VISIBILITY="--public"; shift;;
      -d|--description) DESC="$2"; shift 2;;
      --here) HERE=1; shift;;
      *) echo "Ukjent flagg: $1"; return 1;;
    esac
  done

  if [ $HERE -eq 0 ]; then
    mkdir -p "$NAME" && cd "$NAME" || return 1
  fi

  # En liten, nyttig .gitignore (tilpass gjerne)
  if [ ! -f .gitignore ]; then
    cat > .gitignore <<'EOF'
# Node/JS
node_modules/
dist/
.build/
.out/
.next/
*.log
.env*
.DS_Store
EOF
  fi

  # README
  if [ ! -f README.md ]; then
    printf "# %s\n\n%s\n" "$NAME" "${DESC:-Oppstart.}" > README.md
  fi

  # Git init og første commit
  if [ ! -d .git ]; then
    git init
    git add .
    git commit -m "chore: initial commit"
  fi

  # Opprett repo på GitHub, sett remote og push
  if gh repo view "$NAME" >/dev/null 2>&1; then
    echo "Et GitHub-repo med navnet '$NAME' finnes allerede under din bruker/org."
  else
    if [ -n "$DESC" ]; then
      gh repo create "$NAME" $VISIBILITY --description "$DESC" --source=. --remote=origin --push
    else
      gh repo create "$NAME" $VISIBILITY --source=. --remote=origin --push
    fi
  fi

  echo "✅ Ferdig! Repo: $(gh repo view "$NAME" --json url -q .url 2>/dev/null || echo "<ukjent URL>")"
}

# Skrive kjappe notater i drafts.txt
function note {
  echo "Date: $(date)" >> "$HOME/drafts.txt"
  echo "$@" >> "$HOME/drafts.txt"
  echo "" >> "$HOME/drafts.txt"
}

# ──────────────────────────────────────────────────────────
# SDKMAN – må være på slutten
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# ──────────────────────────────────────────────────────────
export PATH=$HOME/.dotnet/tools:$PATH

# Added by Windsurf
export PATH="/Users/mads/.codeium/windsurf/bin:$PATH"

. "$HOME/.local/bin/env"
