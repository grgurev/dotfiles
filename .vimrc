""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" My Vim file
"
" Maintainer:
"       Marin Grgurev
"       marin.grgurev@gmail.com
"
" Version:
"       1.0 - March 31, 2015
"
" Sections:
"       1) General settings
"       2) User interface
"       3) Colors and fonts
"       4) Mappings
"       5) Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 1) General settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn on the enhancements and improvements of Vi Improved
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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 2) User interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""








" better copy & paste
set pastetoggle=<F2>
set clipboard=unnamed


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 3) Colors and fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"------ Set colorscheme ------"
colorscheme default


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 4) Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Edit and source .vimrc file
nnoremap <leader>oe :e $MYVIMRC<CR>
nnoremap <leader>pv :source $MYVIMRC<CR>

" Easier moving of code blocks
vnoremap <silent>< <gv
vnoremap <silent>> >gv

" Move vertically by visual line
nnoremap j gj
nnoremap k gk

" Enforce use of the hjkl keys
 noremap <up> <nop>
 noremap <down> <nop>
 noremap <left> <nop>
 noremap <right> <nop>

" map keys for easier window navigation
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
nnoremap <leader>w <C-w>v<C-w>l




"------ Console UI & Text display ------"
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
set colorcolumn=80
highlight ColorColumn guibg=lightgrey


" allow changing buffer without saving it first
set hidden

" editing settings
set showmode        " always show what mode we're currently editing in
set tabstop=4       " a tab is four spaces
set softtabstop=4   " when hitting <BS>, pretend like a tab is removed, even if spaces
set shiftwidth=4    " number of spaces to use for autoindenting
set shiftround      " use multiple of shiftwidth when indenting with '<' and '>'
set expandtab       " expand tabs by default (overloadable per file type later)

" folding
set foldmethod=indent   " enables folding and setting method to indent
set foldlevel=99        " enables that all folds are opent when starting vim





" Show invisible characters.
set listchars=tab:▸\ ,trail:·
set list

"------ Section 2 ------"
"------------------------------------------------------------------------------
" Loading plugins and setting options
call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'rking/ag.vim'         " ag plugin
Plug 'Shougo/vimproc.vim'   " vimproc plugin, needed for Unite
Plug 'Shougo/unite.vim'     " Unite plugin
Plug 'Shougo/neomru.vim'    " mru plugin for Unite
Plug 'Shougo/vimfiler.vim'  " Powerful file explorer implemented by Vim script
Plug 'nvie/vim-flake8'      " a static syntax and style checker for Python source code
Plug 'ervandew/supertab'    " plugin which allows you to use <Tab> for all your insert completion
Plug 'davidhalter/jedi-vim' " Python autocompletion with VIM
Plug 'bronson/vim-trailing-whitespace'  " Highlights trailing whitespace in red and provides :FixWhitespace to fix it. 

call plug#end()

"------ Plugin settings ------"
"------ Easy align interactive ------"
vnoremap <silent> <Enter> :EasyAlign<cr>
let g:easy_align_delimiters = { ';': { 'pattern': ';', 'left_margin': 0, 'right_margin': 1, 'stick_to_left': 1 } }

"------ Unite ------"
" general settings
let g:unite_source_history_yank_enable = 1  " enable search history
let g:unite_enable_start_insert=1  " enable automatic insert when starting unite
let g:unite_prompt='» '  " enable '>>' as prompt

" enable recursive file search using fuzzy file matching
try
    let g:unite_source_rec_async_command='ag --nocolor --nogroup -g ""'
    call unite#filters#matcher_default#use(['matcher_fuzzy'])
    call unite#filters#sorter_default#use(['sorter_rank'])
catch
endtry

" custom mappings for the unite buffer
autocmd! FileType unite call s:UniteKeymaps()
function! s:UniteKeymaps()
    let b:SuperTabDisabled=1  " Play nice with supertab
    imap <silent><buffer><C-j> <Plug>(unite_select_next_line)
    imap <silent><buffer><C-k> <Plug>(unite_select_previous_line)
    imap <silent><buffer><expr> <C-l> unite#do_action('right')
    nmap <silent><buffer><Esc> <Plug>(unite_all_exit)
endfunction

" start recursive file search using fuzzy file matching
nnoremap <silent><leader>f :<C-u>Unite -no-split file_rec/async:!<CR>

" start search through buffer
nnoremap <silent> <leader>d :<C-u>Unite -no-split buffer<CR>

" start search through line
nnoremap <silent> <leader>g :<C-u>Unite -no-split line<CR>

" start search through recent files
nnoremap <silent> <leader>s :<C-u>Unite -no-split file_mru<CR>

" start bookmark searching
nnoremap <leader>a :<C-u>Unite -no-split bookmark<CR>

" start search through yanks
nnoremap <leader>y :<C-u>Unite -no-split history/yank<CR>

" restart unite
:nnoremap <leader>r <Plug>(unite_restart)

"--- vimfiler ---"
let g:vimfiler_as_default_explorer = 1
nnoremap <silent><space>e :<C-u>VimFilerExplorer -buffer-name=explorer -split -winwidth=35<CR>
autocmd! FileType vimfiler nmap <silent><buffer><Esc> <Plug>(vimfiler_close)

"###--- Silver search ---###"
" --- type ° to search the word in all files in the current dir
nmap ° :Ag <c-r>=expand("<cword>")<CR><CR>
nnoremap <leader>/ :Ag

"------ flake8 ------"
let g:flake8_quickfix_height=28
autocmd! FileType qf set colorcolumn=0

" supertab settings
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

" vim-trailing-whitespace settings
autocmd FileType vimfiler,unite call s:RemoveWhitespace()  " remove trailing spaces from unite buffers
"autocmd FileType vimfiler call s:RemoveWhitespace()  " remove trailing spaces from vimfiler buffer
function! s:RemoveWhitespace()
    autocmd InsertLeave <buffer> match ExtraWhitespace //
    autocmd InsertEnter <buffer> match ExtraWhitespace //
    autocmd BufWinEnter <buffer> match ExtraWhitespace //
endfunction 
