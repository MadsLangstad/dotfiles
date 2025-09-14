# ~/.bashrc - Bash configuration (converted from Zsh settings)

# History Settings (Bash equivalent of Zsh's setopt options)
HISTSIZE=10000                     # number of commands to remember in history
HISTFILESIZE=10000                 # maximum lines contained in history file (similar to Zsh SAVEHIST)
HISTCONTROL=ignoreboth:erasedups   # ignore duplicate entries and lines starting with space:contentReference[oaicite:0]{index=0}
shopt -s histappend                # append to history file, don't overwrite it on shell exit:contentReference[oaicite:1]{index=1}
PROMPT_COMMAND="history -a${PROMPT_COMMAND:+; $PROMPT_COMMAND}"  
# ^ Immediately append new commands to the history file after each command (mimics Zsh INC_APPEND_HISTORY and SHARE_HISTORY):contentReference[oaicite:2]{index=2}

# Prompt Settings (use PS1 in Bash instead of Zsh's PROMPT)
# This prompt shows "user@host cwd $", with colors similar to the Zsh prompt definition.
# (\u = username, \h = hostname, \w = current working directory, \[\e[Xm\] = color codes)
PS1="\[\e[32m\] \[\e[34m\]\w\[\e[0m\]\$ "
# (Converted Zsh prompt '%~' to Bash '\w', and applied equivalent color codes):contentReference[oaicite:3]{index=3}

# Alias definitions (Zsh and Bash use the same alias syntax)
alias ll='ls -alF'          # example alias (list with details)
alias gs='git status'       # example alias for Git status
# (Add any other aliases from your original file here; no changes needed for Bash)

# Environment variables (no Zsh-specific syntax needed for exports)
export PATH="$HOME/bin:$PATH"
export SDKMAN_DIR="$HOME/.sdkman"   # SDKMAN environment variable

# iTerm2 Shell Integration (use Bash-specific script instead of Zsh script)
if [ -e "$HOME/.iterm2_shell_integration.bash" ]; then
    source "$HOME/.iterm2_shell_integration.bash"
fi
# (Changed from .iterm2_shell_integration.zsh to .bash for Bash compatibility)

# SDKMAN Initialization (works in Bash as well as Zsh)
if [ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]; then
    source "$HOME/.sdkman/bin/sdkman-init.sh"
fi
