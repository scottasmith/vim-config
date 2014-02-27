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

set backspace=indent,eol,start
set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab
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

map <F2> :Tabularize /

autocmd BufWritePre * :%s/\s\+$//e

let g:syntastic_php_phpcs_args="--report=csv --standard=PSR2"
