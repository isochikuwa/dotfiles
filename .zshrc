# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

bindkey -e
bindkey '^[[Z' reverse-menu-complete

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

# oh-my-zsh
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit cdclear -q

setopt promptsubst
# zinit plugins
zinit light zsh-users/zsh-completions
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light mollifier/cd-gitroot
zinit light zdharma-continuum/history-search-multi-word
zinit ice depth=1; zinit light romkatv/powerlevel10k
### End of zinit plugins

export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

export PATH="$HOME/bin:$PATH"

#autoload -Uz compinit && compinit -u
autoload -U compinit
zstyle ':completion:*' menu select
setopt menu_complete
compinit

export EDITOR=$(which nvim)

eval $(ssh-agent -s) > /dev/null
if [ "$(ssh-add -l)" = "The agent has no identities." ] ; then
  ssh-add $HOME/.ssh/id_ed25519 > /dev/null 2>&1
fi

#alias ls="ls --color=auto --file-type"
alias ls="ls --color=auto"

alias tmux='tmux -2'
alias t='tmux'
#alias adssh='(){sshpass -f $HOME/.ssh/.pass ssh -o StrictHostKeyChecking=no $1}'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
