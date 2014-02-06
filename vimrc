call pathogen#infect()
call pathogen#helptags()

filetype indent on
filetype plugin on

syn on
set hidden
set incsearch
set hlsearch
set ignorecase
set number
set tabstop=4
set shiftwidth=4
"set expandtab
set path=.,~/codebase/gen1/switch/**,~/codebase/gen2/switch/**
set list
set listchars=tab:>-
set splitright
set wildmenu
set modeline
set complete=.,w,b,u,t
set nowrap

set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2

set history=1000

nmap <F7> :nohlsearch<CR>
imap <F7> <Esc><F7>a

