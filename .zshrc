export ZSH=$HOME/.oh-my-zsh

export LANG=ja_JP.UTF-8

ZSH_THEME="af-magic"
plugins=(
  git
  poetry
  npm
  zsh-autosuggestions
  zsh-syntax-highlighting
) 
source $ZSH/oh-my-zsh.sh

setopt nonomatch
# env
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

LD_LIBRARY_PATH="$LD_LIBRARY_PATH":/usr/local/cuda-11/lib64
PATH="$PATH":/usr/local/cuda/bin

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

export GIT_SSH_COMMAND="ssh -i ~/.ssh/id_ed25519 -F /dev/null"
export EDITOR=$(which nvim)

alias t='tmux'

export PATH="$HOME/.local/bin:$PATH"

export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/bin:$PATH"
