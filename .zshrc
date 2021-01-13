export ZSH=$HOME/.oh-my-zsh

export LANG=ja_JP.UTF-8

ZSH_THEME="af-magic"
plugins=(
  git
  poetry
  npm
) 
source $ZSH/oh-my-zsh.sh

setopt nonomatch
# env
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)";

export RBENV_ROOT="$HOME/.rbenv"
export PATH="$RBENV_ROOT/bin:$PATH"
eval "$(rbenv init -)";
export PATH="/home/takezawa/.gem/ruby/2.7.0:$PATH"

export PATH="/usr/local/opt/gettext/bin:$PATH"

source /usr/share/nvm/init-nvm.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

export GIT_SSH_COMMAND="ssh -i ~/.ssh/id_ed25519 -F /dev/null"
export EDITOR=/usr/bin/nvim

alias t='tmux'
