
" My Vim file
"
" Maintainer:
"       Marin Grgurev
"       marin.grgurev@gmail.com
"
" Version:
"       1.4 - March 31, 2015
"
" Sections:
"           General settings
"           Colors and fonts
"           Mappings
"           Console UI and editing behaviour
"           Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" turn on the enhancements and improvements of Vi Improved
set nocompatible

" setting the mapleader to <Space>
let mapleader="\<Space>"
let maplocalleader="\<Space>\<Space>"

" automatic reloading of .vimrc
autocmd! BufWritePost .vimrc source %

" history and undolevels - you never know when you're gonna need it
set history=70
set undolevels=700

" disable backup and swap files
set nobackup
set nowritebackup
set noswapfile

" allow changing buffer without saving it first
set hidden

" exclude some of the plugins to searh for a trailing whitespace
let g:better_whitespace_filetypes_blacklist=['unite', 'vimfiler','qf', 'rbrowser']

" automatically reload files changed outside of Vim
set autoread

" activate plugins and indentation according to 'filetype'
filetype plugin on
filetype indent on

" turn on omni completion
set omnifunc=syntaxcomplete#Complete

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme default     " set colorscheme

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" edit and source .vimrc file
nnoremap <leader>oe :e $MYVIMRC<CR>
nnoremap <leader>pv :source $MYVIMRC<CR>

" easier moving of code blocks
vnoremap <silent>< <gv
vnoremap <silent>> >gv

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" enforce use of the hjkl keys
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

" map keys for easier window navigation
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
nnoremap <leader>v <C-w>v<C-w>l

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Console UI and editing behaviour
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" editing settings
set cmdheight=1     " explicitly set the height of the command line
set showcmd         " show (partial) command in status line
set mousehide       " hide the mouse when typing text
set number          " show line number
set nuw=4           " setting the size of the character for row numbering
set ruler           " set the current position at the bottom of the screen
set scrolloff=5     " keep at least 5 lines above/below
set sidescrolloff=5 " keep at least 5 lines left/right
set shortmess=I     " don't show intro
set vb t_vb=        " remove sounds and flashing on erors
set guioptions-=T   " remove top toolbar
set guifont=Monospace\ 9  " set default font
set backspace=indent,eol,start  " allow the backspace key to erase previously entered characters, autoindent, and newline
set tw=80           " set width of document (used by gd)
set nowrap          " don't automatically wrap on load
set fo-=t           " automatically wrap text when typing
set colorcolumn=80  " set the colorcolumn to 80 column
highlight ColorColumn ctermbg=7     " change the color of the color column
set showmode        " always show what mode we're currently editing in
set tabstop=4       " a tab is four spaces
set softtabstop=4   " when hitting <BS>, pretend like a tab is removed, even if spaces
set shiftwidth=4    " number of spaces to use for autoindenting
set shiftround      " use multiple of shiftwidth when indenting with '<' and '>'
set expandtab       " expand tabs by default (overloadable per file type later)
set autoindent      " always set autoindenting on
set copyindent      " copy the previous indentation on autoindenting
set showmatch       " set show matching parenthesis
set ignorecase      " ignore case when searching
set smartcase       " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab        " insert tabs on the start of a line according to shiftwidth, not tabstop
"set virtualedit=all " allow the cursor to go in to "invalid" places
set hlsearch        " highlight search terms
set incsearch       " show search matches as you type
set gdefault        " search/replace "globally" (on a line) by default

" editor layout
set termencoding=utf-8
set encoding=utf-8
set lazyredraw                  " don't update the display while executing macros
"set laststatus=2                " tell VIM to always put a status line in, even if there is only one window

" folding
set foldmethod=indent   " enables folding and setting method to indent
set foldlevel=99        " enables that all folds are opent when starting vim

" show invisible characters.
set listchars=tab:▸\ ,trail:·
set list


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" loading plugins
call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'rking/ag.vim'         " ag plugin
Plug 'Shougo/vimproc.vim'   " vimproc plugin, needed for Unite
Plug 'Shougo/unite.vim'     " Unite plugin
Plug 'Shougo/neomru.vim'    " mru plugin for Unit
Plug 'Shougo/vimfiler.vim'  " Powerful file explorer implemented by Vim script
Plug 'nvie/vim-flake8'      " a static syntax and style checker for Python source code
"Plug 'davidhalter/jedi-vim' " Python autocompletion with VIM
Plug 'ntpeters/vim-better-whitespace'  " Better whitespace highlighting for Vim 
Plug 'tpope/vim-fugitive'   " a Git wrapper so awesome, it should be illegal
"Plug 'Shougo/neocomplete'   " Next generation completion framework after neocomplcache
"Plug 'jcfaria/Vim-R-plugin' " Plugin to work with R
Plug 'Valloric/YouCompleteMe'  " A code-completion engine for Vim

call plug#end()

"----------------------------------------------------------
" Easy align interactive
"----------------------------------------------------------
vnoremap <silent> <Enter> :EasyAlign<cr>
let g:easy_align_delimiters = { ';': { 'pattern': ';', 'left_margin': 0, 'right_margin': 1, 'stick_to_left': 1 } }

"----------------------------------------------------------
" unite
"----------------------------------------------------------
" enable search history
let g:unite_source_history_yank_enable = 1

" settings for ag find command
let g:unite_source_rec_async_command='ag --nocolor --hidden --nogroup -g ""'

" type 'find ~/ -type f | wc -l' to find the number of files to cache in home dir
let g:unite_source_rec_max_cache_files=50000

" custom unite functions
call unite#custom#source('file, file/new, buffer, file_rec', 'matchers', 'matcher_fuzzy')
call unite#custom#profile('default', 'context', {'start_insert':1, 'prompt':'>> ', 'update_time':200})

" custom 'in-unite' mappings
autocmd! FileType unite call s:UniteKeymaps()
function! s:UniteKeymaps()
    "let b:SuperTabDisabled=1  " Play nice with supertab
    imap <silent><buffer><C-j> <Plug>(unite_select_next_line)
    imap <silent><buffer><C-k> <Plug>(unite_select_previous_line)
    imap <silent><buffer><expr> <C-l> unite#do_action('right')
    imap <silent><buffer><expr> <C-h> unite#do_action('left')
    nmap <silent><buffer><Esc> <Plug>(unite_all_exit)
endfunction

" unite mappings
"nnoremap <silent><leader>w :<C-u>Unite -no-split -default-action=lcd directory_rec/async:!<CR>
nnoremap <silent><leader>e :<C-u>Unite -no-split -default-action=lcd directory_rec/async:/home/marin<CR>
nnoremap <silent><leader>g :<C-u>Unite -no-split file_rec/async:/home/marin/<CR>
nnoremap <silent><leader>f :<C-u>Unite -no-split file_rec/async:!<CR>
nnoremap <silent><leader>d :<C-u>Unite -no-split buffer<CR>
nnoremap <silent><leader>x :<C-u>Unite -no-split line<CR>
nnoremap <silent><leader>s :<C-u>Unite -no-split file_mru<CR>
nnoremap <silent><leader>a :<C-u>Unite -no-split bookmark<CR>
nnoremap <silent><leader>y :<C-u>Unite -no-split history/yank<CR>
nnoremap <silent><leader>r <Plug>(unite_restart)

"----------------------------------------------------------
" vimfiler
"----------------------------------------------------------
let g:vimfiler_as_default_explorer = 1
nnoremap <silent><space>t :<C-u>VimFilerExplorer -buffer-name=explorer -split -winwidth=35<CR>
autocmd! FileType vimfiler nmap <silent><buffer><Esc> <Plug>(vimfiler_close)

"----------------------------------------------------------
" Silver search - Ag
"----------------------------------------------------------
" search the word in all files in the current dir
nmap ° :Ag <c-r>=expand("<cword>")<CR><CR>
nnoremap <leader>/ :Ag

"----------------------------------------------------------
" flake8
"----------------------------------------------------------
let g:flake8_quickfix_height=28
autocmd! FileType qf,vim-plug set colorcolumn=0

"----------------------------------------------------------
" YouCompleteMe
"----------------------------------------------------------
let g:ycm_autoclose_preview_window_after_completion = 1
set completeopt=longest,menuone,preview
