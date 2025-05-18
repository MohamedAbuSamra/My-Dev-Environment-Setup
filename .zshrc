# --- PATHS & ALIASES ---
export PATH="/opt/homebrew/opt/node@14/bin:$PATH"
alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:$HOME/flutter/bin"

# --- NVM ---
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# --- FUNCTIONS ---
git_branch() {
  git rev-parse --abbrev-ref HEAD 2>/dev/null
}

node_version() {
  nvm current 2>/dev/null
}

zsh_name() {
  echo "%{%F{blue}%}✅ %BVault-Tec 🎮 ▶ 📁(%F{magenta}%1~%f)%f🔥 %K{white}%B%F{201}</>%b%k%f%b%}"
}

# --- PROMPT ---
precmd() {
  local GIT_BRANCH=$(git_branch)
  local NODE_VER=$(node_version)
  PS1="$(zsh_name)%{%f%} 🌱 %B%{%F{blue}%}🕹️ git%b%{%F{green}%}(${GIT_BRANCH})%{%f%} %{%F{cyan}%}🔻Node(${NODE_VER})%{%f%} 🚀%{%F{201}%} : %{%f%}"
}

# --- CONDA ---
__conda_setup="$('/Users/samra/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
  eval "$__conda_setup"
elif [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
  . "$HOME/miniconda3/etc/profile.d/conda.sh"
else
  export PATH="$HOME/miniconda3/bin:$PATH"
fi
unset __conda_setup

# --- PYENV ---
eval "$(pyenv init -)"
# --- ZSH AUTOCOMPLETE & HELPERS ---
autoload -Uz compinit && compinit  # enables autocomplete system

# --- AUTOSUGGESTIONS ---
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# --- SYNTAX HIGHLIGHTING ---
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
