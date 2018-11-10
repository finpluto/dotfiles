""""""""""""""""""""""""
" Vundle Configuration "
""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" 语法检查 
Plugin 'w0rp/ale'
" vim-airline状态栏
Plugin 'https://github.com/bling/vim-airline'
" 显示缩进线
Plugin 'Yggdroot/indentLine'
" 自动闭合括号引号 
Plugin 'jiangmiao/auto-pairs'
" Solarized Theme
" Plugin 'altercation/vim-colors-solarized'
Plugin 'icymind/NeoSolarized'
" c++语法高亮增强
Plugin 'octol/vim-cpp-enhanced-highlight'
" python语法检查后端
Plugin 'nvie/vim-flake8'
" YouCompleteMe
Plugin 'Valloric/YouCompleteMe'
" NerdTree
" Plugin 'https://github.com/scrooloose/nerdtree.git'
Plugin 'scrooloose/nerdtree'
" NerdTree git plugin
Plugin 'Xuyuanp/nerdtree-git-plugin'
" UndoTree
Plugin 'mbbill/undotree'
" Fugitve
Plugin 'tpope/vim-fugitive'
" Ctrlp
Plugin 'kien/ctrlp.vim'

call vundle#end()            " required
filetype plugin indent on    " required

" ale设置
let g:ale_completion_enabled = 1
let g:ale_set_quickfix = 1
let g:ale_set_loclist = 0
let g:ale_open_list = 0
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '-'
let g:ale_fix_on_save = 1
let g:ale_echo_msg_format = '[#%linter%#] %s [%severity%]'
let g:ale_statusline_format = ['E•%d', 'W•%d', 'OK']
let g:ale_linters = {
\   'cpp': ['clang'],
\   'python': ['flake8']
\}

" airline
" let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" 缩进指示线
let g:indentLine_char='▏'
let g:indentLine_enabled = 1

" NeoSolarized
set background=dark "设置背景色
colorscheme NeoSolarized

" YouCompleteMe
" C语言族补全设置
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
" Python Semantic Completion
let g:ycm_python_binary_path = '/usr/bin/python3'
" let g:ycm_key_invoke_completion = '<c-z>'
" 自动开启语义补全菜单
let g:ycm_semantic_triggers =  {
\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
\ 'cs,lua,javascript': ['re!\w{2}']
\ }
" 在注释输入中也能补全
let g:ycm_complete_in_comments = 1
" 在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
" 注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1
" 停止提示是否载入本地ycm_extra_conf文件
let g:ycm_confirm_extra_conf = 0
" 屏蔽ycm自带的检查（我用ale
let g:ycm_show_diagnostics_ui = 0

" NerdTree
" 打开新缓冲区自动成为焦点
autocmd VimEnter * wincmd p
" close vim if the only window left open is a NERDTree?
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" open NERDTree automatically when vim starts up on opening a directory
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd BufEnter * if 0 == len(filter(range(1, winnr('$')), 'empty(getbufvar(winbufnr(v:val), "&bt"))')) | qa! | endif

" Ctrlp
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = ''

" UndoTree
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif

""""""""""""""""""""""""
" Finp's configuration "
"                      "
""""""""""""""""""""""""

syntax on
set termguicolors "设置真彩色
set nu "显示行号 
set shiftwidth=4 "默认缩进4个空格 
set softtabstop=4 "使用tab时 tab空格数 
set tabstop=4 "tab 代表4个空格 
set scrolloff=10 "距离顶部和底部5行
set expandtab "使用空格替换tab
set autoindent "自动缩进
set hlsearch "高亮搜索项
set encoding=utf-8 "文件编码
set showcmd
set timeoutlen=1000 ttimeoutlen=0

" OmniComplete
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" f5编译运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'python'
        exec "!time ipython %"
    endif
endfunc

" 快捷键映射
let mapleader="\<space>" 
" 窗口移动
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-n> :vnew<cr>

nnoremap <leader>sf :w<cr>    " 保存文件
nnoremap <leader>q  :q<cr>    " 关闭窗口
nnoremap <leader>dt :NERDTreeToggle<cr>    " 打开NerdTree
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>    " 跳转定义
nnoremap <leader>ud :UndotreeToggle<cr>    " 打开undotree
nnoremap <leader><c-v> "+p    " 复制
nnoremap <leader>p  :CtrlP<cr>    " 打开ctrlp
nnoremap <leader>b  :CtrlPBuffer<cr>    " 打开ctrlpb
nnoremap <leader>ch :nohl<cr>    " 取消搜索高亮
