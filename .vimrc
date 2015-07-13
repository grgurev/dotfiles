
" My Vim file
"
" Maintainer:
"       Marin Grgurev
"       marin.grgurev@gmail.com
"
" Version:
"       1.6 - May 2, 2015
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
set history=1000
set undolevels=1000

" disable backup and swap files
set nobackup
set nowritebackup
set noswapfile

" allow changing buffer without saving it first
set hidden

" exclude some of the plugins to searh for a trailing whitespace
let g:better_whitespace_filetypes_blacklist=['unite','vimfiler','qf','rbrowser']

" automatically reload files changed outside of Vim
set autoread

" activate plugins and indentation according to 'filetype'
filetype plugin on
filetype indent on

" turn on omni completion
set omnifunc=syntaxcomplete#Complete
set completeopt=menuone,longest,preview

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme Tomorrow     " set colorscheme

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" edit and source .vimrc file
nnoremap <leader>ve :e $MYVIMRC<CR>
nnoremap <leader>vs :source $MYVIMRC<CR>

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

" change directory to the file being edited
nnoremap <leader>w :cd %:p:h<CR>:pwd<CR>

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
set shortmess=atI   " don't show intro
set vb t_vb=        " remove sounds and flashing on erors
set guioptions=     " remove all GUI elements
"set guioptions-=T   " remove top toolbar
"set guioptions-=m   "remove menu bar
set guifont=Monospace\ 9  " set default font
set backspace=indent,eol,start  " allow the backspace key to erase previously entered characters, autoindent, and newline
set tw=79           " set width of document (used by gd)
set nowrap          " don't automatically wrap on load
set fo-=t           " automatically wrap text when typing
set colorcolumn=79  " set the colorcolumn to 80 column
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
"set virtualedit=all " allow the cursor to go in to 'invalid' places
set hlsearch        " highlight search terms
set incsearch       " show search matches as you type
set gdefault        " search/replace 'globally' (on a line) by default

" editor layout
set termencoding=utf-8
set encoding=utf-8
set lazyredraw      " don't update the display while executing macros
set laststatus=2   " tell VIM to always put a status line in, even if there is only one window

" folding
set foldmethod=indent   " enables folding and setting method to indent
set foldlevel=99    " enables that all folds are opent when starting vim

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
Plug 'davidhalter/jedi-vim' " Python autocompletion with VIM
Plug 'ntpeters/vim-better-whitespace'  " Better whitespace highlighting for Vim
Plug 'tpope/vim-fugitive'   " a Git wrapper so awesome, it should be illegal
"Plug 'jcfaria/Vim-R-plugin' " Plugin to work with R
Plug 'Shougo/neocomplete.vim'   " next generation completion framework
Plug 'Shougo/context_filetype.vim'  " context filetype library for Vim script
Plug 'ivanov/vim-ipython'   " a two-way integration between Vim and Python
Plug 'lervag/vimtex'       "A modern vim plugin for editing LaTeX files

call plug#end()

"----------------------------------------------------------
" Easy align interactive
"----------------------------------------------------------
vnoremap <silent> <Enter> :EasyAlign<cr>
let g:easy_align_delimiters = { ';': { 'pattern': ';', 'left_margin': 0, 'right_margin': 1, 'stick_to_left': 1 } }

"----------------------------------------------------------
" unite
"----------------------------------------------------------
" enable history yank search
let g:unite_source_history_yank_enable = 1

" use ag in unite find source
let g:unite_source_rec_async_command = 'ag --follow --nocolor --nogroup --hidden ' .
    \ '--ignore ''.hg'' --ignore ''.svn'' --ignore ''.git/'' --ignore ''.bzr'' ' .
    \ '--ignore ''.zip'' --ignore ''.tar.gz'' --ignore ''.tar.bz2'' --ignore ''.rar'' ' .
    \ '--ignore ''**/*.pyc'' -g ""'

" ues ag in unite grep source
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts =
    \ '-i --line-numbers --nocolor --nogroup --hidden --ignore ' .
    \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'' ' .
    \ '--ignore ''.zip'' --ignore ''.tar.gz'' --ignore ''.tar.bz2'' --ignore ''.rar'' ' .
    \ '--ignore ''**/*.pyc'' -g ""'
let g:unite_source_grep_recursive_opt = ''

" type 'find ~/ -type f | wc -l' to find the number of files to cache in home dir
let g:unite_source_rec_max_cache_files = 0

" really improves file_rec/async search time
let g:unite_redraw_hold_candidates = 50000

" fuzzy match by default
call unite#filters#matcher_default#use(['converter_relative_word', 'matcher_fuzzy'])
call unite#custom#source('file_rec/async,directory_rec/async', 'max_candidates', 19)

" selecta sorter by default
call unite#filters#sorter_default#use(['sorter_selecta'])

" defining custom ignores
call unite#custom_source('directory_rec/async,file_rec/async',
    \ 'ignore_pattern', join([
    \ '.cache/', '.git/', 'tmp/', '\.jpg$', '\.jpeg$', '\,bmp$', '\.png$', '\.gif$',
    \ '.zip$', '\.tar\.gz$', '\.tar\.bz2$', '\.rar$', '\.tar\.xz$', '\.pyc$', '\.swp',
    \ '.sol$'
    \ ], '\|'))

" tweaks related to unite ui
call unite#custom#profile('default', 'context', {
    \ 'prompt': '» ',
    \ 'start_insert': 1,
    \ 'update_time': 200,
    \ 'cursor_line_highlight': 'UniteSelectedLine',
    \ 'direction': 'botright',
    \ 'prompt_direction': 'top',
    \ })

" custom unite mappings (insert mode)
autocmd! FileType unite call s:UniteKeymaps()
function! s:UniteKeymaps()
    imap <silent><buffer><C-j> <Plug>(unite_select_next_line)
    imap <silent><buffer><C-k> <Plug>(unite_select_previous_line)
    imap <silent><buffer><expr> <C-l> unite#do_action('right')
    imap <silent><buffer><expr> <C-h> unite#do_action('left')
    nmap <silent><buffer><Esc> <Plug>(unite_all_exit)
endfunction

" custom unite mappings (normal mode)
nnoremap <silent><leader>e :<C-u>Unite -default-action=lcd directory_rec/async:/home/marin<CR>
nnoremap <silent><leader>g :<C-u>Unite file_rec/async:/home/marin/<CR>
nnoremap <silent><leader>f :<C-u>Unite file_rec/async:!<CR>
nnoremap <silent><leader>d :<C-u>Unite buffer<CR>
nnoremap <silent><leader>x :<C-u>Unite line<CR>
nnoremap <silent><leader>s :<C-u>Unite file_mru<CR>
nnoremap <silent><leader>a :<C-u>Unite bookmark<CR>
nnoremap <silent><leader>y :<C-u>Unite history/yank<CR>
nnoremap <silent><leader>r <Plug>(unite_restart)

"----------------------------------------------------------
" vimfiler
"----------------------------------------------------------
let g:vimfiler_as_default_explorer = 1
nnoremap <silent><space>t :<C-u>VimFilerExplorer -winwidth=35<CR>
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
let g:flake8_quickfix_height=15
autocmd! FileType qf,vim-plug set colorcolumn=0
autocmd BufWritePost *.py call Flake8()

"----------------------------------------------------------
" YouCompleteMe
"----------------------------------------------------------
" auto-close the preview window after the user accepts the offered completion string
"let g:ycm_autoclose_preview_window_after_completion = 1
"
"" show the completion menu even when typing inside comments
"let g:ycm_complete_in_comments = 1
"
"" collect identifiers from strings and comments
"let g:ycm_collect_identifiers_from_comments_and_strings = 1
"
"" completer will seed its identifier database with the keywords of the programming language used
"let g:ycm_seed_identifiers_with_syntax = 1
"
"let g:ycm_prefer_semantic = 0
"
""nnoremap <leader>h :YcmCompleter GoToDefinitionElseDeclaration<CR>
"
"" controls the character-based triggers for the various semantic completion engines
""let g:ycm_semantic_triggers =  {'python' : ['re!\w*\s']}

"----------------------------------------------------------
" neocomplete
"----------------------------------------------------------
" neocomplete gets started automatically when Vim starts
let g:neocomplete#enable_at_startup = 1

" use smartcase.
let g:neocomplete#enable_smart_case = 1

" controls length of keyword becoming the targets of the completion at the minimum
let g:neocomplete#min_keyword_length = 3

" close preview window automatically
let g:neocomplete#enable_auto_close_preview = 1

" For smart TAB completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ neocomplete#start_manual_complete()
inoremap <expr><s-TAB> pumvisible() ? "\<C-p>" :
    \ <SID>check_back_space() ? "\<s-TAB>" :
    \ neocomplete#start_manual_complete()
function! s:check_back_space() "{
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~ '\s'
endfunction"}

"----------------------------------------------------------
" jedi-vim
"----------------------------------------------------------
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0

if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'

" decide the direction where the split will open
let g:jedi#use_splits_not_buffers = "right"
let g:jedi#use_tabs_not_buffers = 0

" default jedi-vim mappings
let g:jedi#goto_assignments_command = "<localleader>g"
let g:jedi#goto_definitions_command = "<localleader>d"
let g:jedi#goto_command = ""
let g:jedi#documentation_command = "<localleader>D"
let g:jedi#usages_command = "<localleader>u"
let g:jedi#completions_command = ""
let g:jedi#rename_command = "<localleader>r"

"----------------------------------------------------------
" general plugin settings
"----------------------------------------------------------
" escape Python documentations, qf and vim-plug buffers with escape key
autocmd! FileType rst,vim-plug,qf,help nmap <silent><buffer><Esc> :q<CR>
autocmd! FileType qf,vim-plug set colorcolumn=0
