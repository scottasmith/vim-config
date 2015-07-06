call pathogen#infect()
call pathogen#helptags()

"""""""""""""""""""""""""""""
" Editor settings
"""""""""""""""""""""""""""""
set number " Show line numbers
set backspace=indent,eol,start " Make backspace work properly (e.g. traverse line breaks)

set tabstop=4     " tabs are equivalent to 4 spaces
set softtabstop=4 " make backspace delete 4 spaces, not just one at a time
set shiftwidth=4  " automatic indentation uses tabs equivalent to 4 spaces
set expandtab     " convert tabs to spaces

set cindent      " indent inside braces basically
set smartindent  " smarter indentation - e.g. indent further inside a loop or function
set autoindent   " automatically indent new lines to match the one above
set history=1000 " command and search history

" Get rid of Vi compatibility to enable a load of vim features
set nocompatible

" Hides buffers instead of closing them
" This means undos are preserved when switching between buffers
" Also, vim won't try to prompt you to save or undo changes to the current buffer when switching to another
set hidden

" show possible completions of commands, file names etc in status line
set wildmenu
set wildmode=full

set list                      " display whitespace
set listchars=tab:>-,trail:·  " highlight tabs and trailing spaces

set hid "hide abandon buffers in order to not lose undo history.

set incsearch   " start searching as soon as the first character is input after /
set hlsearch    " highlight all matches for a search term
set ignorecase  " make search case-insensitive
set smartcase

set scrolloff=6 " keep cursor away from bottom of screen

filetype indent plugin on " enable filetype specific plugins and auto indentation

set ls=2 " always show the status line (current file etc)

set splitright
set modeline
set complete=.,w,b,u,t
set nowrap

set showmatch " when a bracket is inserted, briefly jump to the matching one

" Set persistent undo (so undo history is saved even when buffers are closed)
set undodir=~/.vim-undo
set undofile
set undolevels=1000  " Maximum number of changes that can be undone
set undoreload=10000 " Maximum number of lines to save for undo on a buffer reload

"""""""""""""""""""""""""""""
" Theme
"""""""""""""""""""""""""""""
set t_Co=256
syn on " turn on syntax highlighting

let g:rehash256 = 1
let g:molokai_original = 1
colorscheme molokai
let g:airline_powerline_fonts = 1
let g:airline_theme='molokai'

" set the colour for highlighted stuff
highlight SpecialKey ctermfg=darkgreen

if has("autocmd")
    " Use htmljinja plugin to syntax highlight both HTML and twig in .twig files
    autocmd BufRead,BufNewFile *.twig set filetype=htmljinja

    " Use puppet plugin to syntax highlight puppet files
    autocmd BufRead,BufNewFile *.pp set filetype=puppet
endif

"""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""

" BufExplorer
"""""""""""""
if has("autocmd")
    autocmd BufEnter,BufNew,BufRead,BufNewFile * set list " BufExplorer has a bug that sets list off. This fixes it
endif

" Command-T
"""""""""""
let g:CommandTMaxFiles=25000 " Make Command-T find more files (default is 10000)

" Syntastic
"""""""""""
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=0
let g:syntastic_php_phpcs_args="--report=csv --standard=PSR2"
let g:syntastic_php_phpmd_post_args="codesize,design,unusedcode,naming,controversial"


"""""""""""""""""""""""""""""
" Shortcuts
"""""""""""""""""""""""""""""
nmap <F2> :Tabularize /
nmap <F5> :CommandTFlush<CR>:so $MYVIMRC<CR>:nohlsearch<CR>:call ReloadAllSnippets()<CR>
nmap <F6> :vsplit<CR>
nmap <F7> :nohlsearch<CR>
nmap <Leader>u :!vendor/bin/phpunit
nmap <Leader>i :!vendor/bin/phpunit --filter <C-R><C-W> <CR>
nmap <Leader>o :!vendor/bin/phpunit -c phpunit-integration.xml <CR>
nmap <F9> :TlistToggle<CR>
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>

""""""""""""""""""""""
" Whitespace
""""""""""""""""""""""

" Remove trailing spaces when saving a buffer
if has ("autocmd")
    autocmd BufWritePre *.php,*.js,*.twig :call Preserve("%s/\\s\\+$//e")
    autocmd BufWritePre $HOME/repos/*,/var/repos/* :call Preserve("%s/\\s\\+$//e")
endif

""""""""""""""""""""""
" Functions
""""""""""""""""""""""

" http://technotales.wordpress.com/2010/03/31/preserve-a-vim-function-that-keeps-your-state/
function! Preserve(command)
    " Preparation: save cursor position.
    let l = line(".")
    let c = col(".")
    " Do the business:
    execute a:command
    " Clean up: restore cursor position
    call cursor(l, c)
endfunction
