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
Plugin 'altercation/vim-colors-solarized'
" c++语法高亮增强
Plugin 'octol/vim-cpp-enhanced-highlight'
" python语法检查后端
Plugin 'nvie/vim-flake8'

call vundle#end()            " required
filetype plugin indent on    " required
" ale设置
let g:ale_completion_enabled = 1
let g:ale_set_quickfix = 1
let g:ale_open_list = 1

" let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '-'
let g:ale_fix_on_save = 1
let g:ale_echo_msg_format = '[#%linter%#] %s [%severity%]'
let g:ale_statusline_format = ['E•%d', 'W•%d', 'OK']

"let g:ale_set_loclist = 0
let g:ale_linters = {
\   'cpp': ['clang'],
\   'python': ['flake8']
\}
" 缩进指示线
let g:indentLine_char='┆'
let g:indentLine_enabled = 1
" solarized
let g:solarized_termcolors=256
set background=dark "设置背景色
colorscheme solarized

""""""""""""""""""""""""
" Finp's configuration "
""""""""""""""""""""""""
syntax on
set nu "显示行号 
set shiftwidth=4 "默认缩进4个空格 
set softtabstop=4 "使用tab时 tab空格数 
set tabstop=4 "tab 代表4个空格 
set scrolloff=10 "距离顶部和底部5行
set expandtab "使用空格替换tab
set autoindent "自动缩进
set hlsearch "高亮搜索项
set encoding=utf-8 "文件编码
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
