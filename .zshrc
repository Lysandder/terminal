# alias get_schedule='open /users/abdulaziz/desktop/schedule.png'
alias get_schedule='qlmanage -p /users/abdulaziz/desktop/schedule.png'
alias get_typechart='qlmanage -p /users/abdulaziz/downloads/typechart.png'

neofetch

# ps1='%f{cyan}%~%f %f{green}☭%f '
#
# natural_scroll() {
#     current_setting=$(defaults read nsglobaldomain com.apple.swipescrolldirection)
#     if [ "$current_setting" = "true" ]; then
#         defaults write nsglobaldomain com.apple.swipescrolldirection -bool false
#     else
#         defaults write nsglobaldomain com.apple.swipescrolldirection -bool true
#     fi
# }

setopt hist_ignore_dups

autoload -Uz add-zsh-hook

parse_git_branch() {
  branch=$(git branch --show-current 2>/dev/null)
  if [ -n "$branch" ]; then
    echo " %F{1} $branch%f"
  fi
}

parse_python_venv() {
  if [ -n "$VIRTUAL_ENV" ]; then
    echo " %F{yellow}($(basename $VIRTUAL_ENV))%f"
  fi
}

update_prompt() {
  PS1="%F{cyan}%~%f$(parse_git_branch)$(parse_python_venv) %F{cyan}➜%f "
  # PS1="%F{cyan}%~%f$(parse_git_branch) %F{cyan}☭%f "
  # PS1="%F{cyan}%~%f$(parse_git_branch) %F{cyan}卍%f "
}

add-zsh-hook precmd update_prompt

autoload -Uz compinit && compinit

alias ls="ls -la"
alias activate="source .venv/bin/activate"

bindkey '^J' down-history   # Ctrl + J for moving down in history
bindkey '^K' up-history     # Ctrl + K for moving up in history

export PATH=$HOME/main/tools/flutter/bin:$PATH

export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

export PATH="/usr/local/bin:$PATH"

export ESLINT_CONFIG_PATH=~/.eslintrc.json
