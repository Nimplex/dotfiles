# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
EDITOR=helix
setopt hist_ignore_dups share_history

# Ctrl+R history search
bindkey '^R' history-incremental-search-backward

# Ctrl + left / right
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Delete key
bindkey "^[[3~" delete-char

# Completion
autoload -Uz compinit
compinit

# Syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Git indicator
git_info() {
  git rev-parse --is-inside-work-tree &>/dev/null || return
  local branch=$(git symbolic-ref --short HEAD 2>/dev/null || git describe --tags --always)
  echo "%F{blue}·${branch}%f"
}

# Inline prompt: path + git branch + $
PROMPT='%F{cyan}%~%f$(git_info) %F{white}$%f '

setopt PROMPT_SUBST AUTO_CD

# Aliases
alias ls='ls --color=auto'
alias la='ls -A --color=auto'
alias ll='ls -ilh --color=auto'
alias hx='helix'
alias nvim='helix' # yeah lol, I keep forgeting

# Git shortcuts
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --graph --decorate --pretty=format:"%C(auto)(%cd) %C(yellow)%h%Creset "%s"%C(auto)%d -- %C(green)%an%Creset" --date=short'
