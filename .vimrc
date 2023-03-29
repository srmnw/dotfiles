set hlsearch

" set tw=80
let g:netrw_localrmdir='rm -r'

set tabstop=8
set softtabstop=8
set shiftwidth=8
set nu
set clipboard=unnamed
set ignorecase
set smartcase

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" auto complete brackets etc.
" inoremap ( ()<left>
" inoremap [ []<left>
" inoremap { {}<left>
" inoremap (<cr> (<cr>)<up><cr>
" inoremap [<cr> [<cr>]<up><cr>
" inoremap {<cr> {<cr>}<up><cr><cr><up><tab>
" inoremap " ""<left>
" inoremap ' ''<left>
" inoremap ` ``<left>
" inoremap """ """<cr>"""<up><cr>
" inoremap ''' '''<cr>'''<up><cr>
" inoremap ``` ```<cr>```<up><cr>
"inoremap ``` ```<cr>```

" C/C++ multiline string
set formatoptions+=r

" VUNDLE ======================================================================
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Custom plugins
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'preservim/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'dense-analysis/ale'
"Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
" Plugin 'ycm-core/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" VUNDLE END ==================================================================

" YouCompleteMe ===============================================================
let g:ycm_key_list_stop_completion = ['<C-y>', '<CR>']


" PYTHON auto indent
au BufNewFile,BufRead *.py
\ set tabstop=4
\ softtabstop=4
\ shiftwidth=4
"\ textwidth=80
\ expandtab
\ autoindent
\ fileformat=unix
\ encoding=utf-8

" PYTHON virutalenv support
" python3 << EOF
" import os
" import sys
" if 'VIRTUAL_ENV' in os.environ:
"   project_base_dir = os.environ['VIRTUAL_ENV']
"   activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"   exec(open(activate_this, dict(__file__=activate_this)).read())
" EOF
" addituonal config
let python_highlight_all=1
syntax on
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree



" C/C++ =======================================================================
" C/C++ auto indent
au BufNewFile,BufRead *.c,*.h,*.cpp,*.cc
    \ set tabstop=8 |
    \ set softtabstop=8 |
    \ set shiftwidth=8

" NERDTree ====================================================================
nnoremap <leader>n :NERDTreeFocus<CR>
" nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" Start NERDTree and leave the cursor in it.
" autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
			\ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Powerline ====================================================================
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
set laststatus=2

" tmux Ctrl+ArrowLeft removes lines
if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif
