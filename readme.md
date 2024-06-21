# 最初の操作方法
## Zsh
- Zinit のインストール

## vim-plug

```sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

## tmux plugin

```sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.tmux.conf
```

```sh
# プラグインのインストール(tmux内で)
(prefix) + I
```
