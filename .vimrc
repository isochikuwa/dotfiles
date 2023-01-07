" 最初の方に書くこと
filetype off

set runtimepath^=~/oasobi/denops/dps_helloworld
" denops configration
let g:denops#debug = 1


set cursorline
set termguicolors
set number
set relativenumber
set encoding=utf-8
scriptencoding utf-8

set fileencoding=utf-8
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
set fileformats=unix,dos,mac
set ambiwidth=single

set formatoptions-=ro

" tab, indent
set expandtab
set tabstop=2
set softtabstop=2
set autoindent
set smartindent
set shiftwidth=2

" Character search
set ignorecase
set hlsearch

" add termdebug
packadd termdebug

" key mapping
let mapleader = "\<Space>"
nnoremap <silent> <C-n> :<C-u>cnext<CR>
nnoremap <silent> <C-p> :<C-u>cprev<CR>

" for wsl2
if system('uname -a | grep microsoft') != ''
  let g:clipboard = {
        \   'name': 'myClipboard',
        \   'copy': {
        \      '+': 'win32yank.exe -i --crlf',
        \      '*': 'win32yank.exe -i --crlf',
        \    },
        \   'paste': {
        \      '+': 'win32yank.exe -o --lf',
        \      '*': 'win32yank.exe -o --lf',
        \   },
        \   'cache_enabled': 1,
        \ }
endif

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


" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

Plug 'Shougo/vimproc.vim', {'do' : 'make'}

Plug 'sainnhe/gruvbox-material'
Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
Plug 'cohama/lexima.vim'
let lexima_ctrlh_as_backspace = 1
Plug 'itchyny/lightline.vim'
let g:lightline = {
  \ 'colorscheme' : 'wombat',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'cocstatus', 'gitbranch', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'fugitive#head',
  \   'cocstatus': 'coc#status'
  \ }
\ }
Plug 'thinca/vim-quickrun'
let g:quickrun_config = {
    \ '_' : {
        \ 'runner' : 'vimproc',
        \ 'runner/vimproc/updatetime' : 40,
        \ 'outputter' : 'error',
        \ 'outputter/error/success' : 'buffer',
        \ 'outputter/error/error' : 'quickfix',
        \ 'outputter/buffer/opener' : 'botright ' . &lines / 10 . 'new',
        \ }
    \}
"let g:quickrun_config = {
    "\ '_' : {
        "\ 'runner' : 'vimproc',
        "\ 'runner/vimproc/updatetime' : 40,
        "\ 'outputter' : 'error',
        "\ 'outputter/error/success' : 'buffer',
        "\ 'outputter/error/error' : 'quickfix',
        "\ 'outputter/buffer/opener' : 'botright 8new',
        "\ }
    "\}
nmap <silent> <Leader>r <Plug>(quickrun)
Plug 'kannokanno/previm'
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
nnoremap [coc] <Nop>
nmap <space>o [coc]
nmap <silent> [coc]f <Plug>(coc-format)
nmap <silent> [coc]<space> :<C-u>CocList<cr>
nmap <silent> [coc]rn <Plug>(coc-rename)
nmap <silent> [coc]h :<C-u>call CocAction('doHover')<cr>
nmap <silent> [coc]d <Plug>(coc-definition)
nmap <silent> [coc]rf <Plug>(coc-references)
nmap <silent> [coc]o :<C-u>CocList outline<cr>
inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"
let g:coc_global_extensions = [
  \ 'coc-rust-analyzer',
  \ 'coc-go',
  \ 'coc-json',
  \ 'coc-solargraph',
  \ 'coc-tsserver',
  \ 'coc-vetur',
  \ 'coc-yaml',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-vimlsp',
  \ 'coc-pyright',
  \ 'coc-eslint',
  \ 'coc-phpls',
  \ 'coc-clangd',
\ ]
"Plug 'justinmk/vim-dirvish'
"Plug 'kristijanhusak/vim-dirvish-git'
"Plug 'roginfarrer/vim-dirvish-dovish', {'branch': 'main'}
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
nnoremap [fzf] <Nop>
nmap <space>f [fzf]
nmap <silent> [fzf]b :<C-u>Buffers<cr>
nmap <silent> [fzf]h :<C-u>History<cr>
nmap <silent> [fzf]g :<C-u>GFiles<cr>
Plug 'jpalardy/vim-slime'
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.2"}
let g:slime_dont_ask_default = 1
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'rbtnn/vim-ambiwidth'
Plug 'scrooloose/nerdcommenter'
Plug 'isochikuwa/lexima-coc-mapping-resolution'
Plug 'tpope/vim-rails'
Plug 'preservim/nerdtree'
"nnoremap <leader>n :NERDTreeToggle<CR>
Plug 'tyru/open-browser.vim'
Plug 'vim-denops/denops.vim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
nnoremap <silent> <leader>n :NvimTreeToggle<CR>

call plug#end()

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" colorscheme
set background=dark
colorscheme gruvbox-material

" previm setting
let g:previm_enable_realtime = 1

set switchbuf=useopen

" filetype毎にインデントを変える
augroup fileTypeIndent
  autocmd!
  autocmd Filetype python setlocal tabstop=4 softtabstop=4 shiftwidth=4
  autocmd Filetype ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  autocmd Filetype eruby setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd Filetype sql setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  autocmd Filetype eruby.yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  autocmd Filetype javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  autocmd Filetype vue syntax sync fromstart
  autocmd Filetype go setlocal tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
augroup END

" auto comment off
augroup autoCommentOff
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=ro
augroup END

" float window
set pumblend=30
set winblend=30

" ripgrepを使う設定
if executable('rg')
  let &grepprg = 'rg --vimgrep --hidden'
  set grepformat=%f:%l:%c:%m
endif
augroup AutoQuickFix
  autocmd!
  autocmd QuickFixCmdPost *grep* cwindow
augroup end

lua << EOF
-- examples for your init.lua

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({

  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },

      },
    },
  },
  renderer = {

    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
EOF

" diff option
set diffopt=internal,filler,algorithm:histogram,indent-heuristic,iwhite
" 最後あたりに書くこと
filetype plugin indent on
