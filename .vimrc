" 最初の方に書くこと
filetype off

set cursorline
set termguicolors
set number
set encoding=utf-8
scriptencoding utf-8

set fileencoding=utf-8
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
set fileformats=unix,dos,mac
set ambiwidth=double

" tab, indent
set expandtab
set tabstop=4
set softtabstop=4
set autoindent
set smartindent
set shiftwidth=4

" Character search
set ignorecase
set hlsearch

" mouse
if has('mouse')
	set mouse=a
    if !has('nvim')
        if has('mouse_sgr')
            set ttymouse=sgr
        elseif v:version > 703 || v:version is 703 && has('patch632')
            set ttymouse=sgr
        else
            set ttymouse=xterm2
        endif
	endif
endif

" set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim
" 
" call dein#begin(expand('~/.vim/dein'))
" 
" call dein#add('Shougo/dein.vim')
" call dein#add('Shougo/unite.vim')
" call dein#add('Shougo/vimproc.vim', {'build': 'make'})

" dein settings {{{
if &compatible
    set nocompatible
endif
" dein.vimのディレクトリ
let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" なければgit clone
if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    " 管理するプラグインを記述したファイル
    let s:toml = '~/.dein.toml'
    let s:lazy_toml = '~/.dein_lazy.toml'
    call dein#load_toml(s:toml, {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})

    call dein#end()
    call dein#save_state()
endif

" その他インストールしていないものはこちらに入れる
if dein#check_install()
  call dein#install()
endif

" colorscheme
" colorscheme molokai
colorscheme iceberg

" airlineの設定
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline_theme = 'molokai'
let g:airline#extensions#tabline#enabled = 1

" previm setting
let g:previm_enable_realtime = 1

set switchbuf=useopen

" filetype毎にインデントを変える
augroup fileTypeIndent
    autocmd!
    autocmd Filetype python setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
    autocmd Filetype ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
    autocmd Filetype eruby setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
augroup END
" 最後あたりに書くこと
filetype plugin indent on

