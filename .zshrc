ZSH_THEME="af-magic"
bindkey -e

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
zinit snippet OMZT::gnzh
zinit snippet OMZL::prompt_info_functions.zsh
zinit snippet OMZP::mercurial/mercurial.plugin.zsh
zinit snippet OMZ::themes/af-magic.zsh-theme
# zinit plugins
zinit light zsh-users/zsh-completions
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light mollifier/cd-gitroot
zinit load zdharma-continuum/history-search-multi-word
### End of zinit plugins

export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

export PATH="$HOME/bin:$PATH"
#export PATH="$PATH:/usr/local/go/bin"

#PROMPT='%~ > '
RPROMPT=''

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

#alias ls="ls -GF"
alias ls="ls --color=auto --file-type"

alias tmux='tmux -2'
alias t='tmux'
alias adssh='(){sshpass -f $HOME/.ssh/.pass ssh -o StrictHostKeyChecking=no $1}'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
