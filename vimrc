call pathogen#infect()
call pathogen#helptags()

" Get rid of Vi compatibility to enable a load of vim features
set nocompatible

" Hides buffers instead of closing them
" This means undos are preserved when switching between buffers
" Also, vim won't try to prompt you to save or undo changes to the current buffer when switching to another
set hidden

" Tabs are equivalent to 4 spaces
set tabstop=4

" Make backspace delete 4 spaces, not just one at a time
set softtabstop=4

" Automatic indentation uses tabs equivalent to 4 spaces
set shiftwidth=4

" Convert tabs to spaces
set expandtab

" Automatically indent new lines to match the one above
set autoindent

" Smarter indentation - e.g. indent further inside a loop or function
set smartindent

" Make backspace work properly (e.g. traverse line breaks)
set backspace=indent,eol,start

" Highlight all matches for a search term
set hlsearch

" Make search case-insensitive
set ignorecase

" Start searching as soon as the first character is input after /
set incsearch

" Display whitespace
set list

" Highlight tabs and trailing spaces
set listchars=tab:>-,trail:`

" BufExplorer has a bug that sets list off. This fixes it
autocmd BufEnter,BufNew,BufRead,BufNewFile * set list

" Set the colour for highlighted stuff
highlight SpecialKey ctermfg=darkgreen

" Remove trailing spaces when saving a buffer
autocmd BufWritePre * :%s/\s\+$//e

" Make Command-T find more files (default is 10000)
let g:CommandTMaxFiles=25000

" Enable filetype specific plugins and auto indentation
filetype indent plugin on

" Turn on syntax highlighting
syn on

" Show line numbers
set number

" When a bracket is inserted, briefly jump to the matching one
set showmatch

" Automatically change the screen title
set title

" Show the current cursor position in the status line

" Set persistent undo (so undo history is saved even when buffers are closed)
set undodir=~/.vim-undo
set undofile
set undolevels=1000  " Maximum number of changes that can be undone
set undoreload=10000 " Maximum number of lines to save for undo on a buffer reload

" Always show the status line (current file etc)
set ls=2

" Show possible completions of commands, file names etc in status line
set wildmenu

set splitright
set modeline
set complete=.,w,b,u,t
set nowrap

set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set laststatus=2

" command and search history
set history=1000

" Shortcut for refreshing Command-T's file list
nmap <F5> :CommandTFlush<CR>

" Deactivate search highlight
nmap <F7> :nohlsearch<CR>

" Shortcut for Tabularize
nmap <F2> :Tabularize /

" Vertical split
nmap <F6> :vsplit<CR>

" Unit test
nmap <F8> :!vendor/bin/phpunit

" Syntastic options
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_quiet_messages = {'level': 'warnings'}

let g:syntastic_php_phpcs_args="--report=csv --standard=PSR2"

" Use htmljinja plugin to syntax highlight both HTML and twig in .twig files
au BufRead,BufNewFile *.twig set filetype=htmljinja

" Use puppet plugin to syntax highlight puppet files
au BufRead,BufNewFile *.pp set filetype=puppet
