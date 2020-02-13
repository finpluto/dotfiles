""""""""""""""""""""""""""
" vim-plug configuration "
""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'icymind/NeoSolarized'
Plug 'easymotion/vim-easymotion'
Plug 'justinmk/vim-sneak'
Plug 'itchyny/lightline.vim'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'zchee/deoplete-jedi'
call plug#end()

""""""""""""""""""""""""
" Finp's configuration "
""""""""""""""""""""""""

syntax enable
set nu                          "显示行号 
set shiftwidth=4                "默认缩进4个空格 
set softtabstop=4               "使用tab时 tab空格数 
set tabstop=4                   "tab 代表4个空格 
set scrolloff=10                "距离顶部和底部5行
set expandtab                   "使用空格替换tab
set autoindent                  "自动缩进
set encoding=utf-8              "文件编码
set showcmd
set timeoutlen=1000 
set ttimeoutlen=0

" Solarized
set termguicolors
set background=dark
colorscheme NeoSolarized

" lightline
set laststatus=2
set noshowmode

" deoplete
let g:deoplete#enable_at_startup=1

" keybingdings
nnoremap <leader><c-v> "+p      " 粘贴

