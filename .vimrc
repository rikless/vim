call pathogen#infect()                      " use pathogen
set nocompatible   " Disable vi-compatibility
set t_Co=256
set term=xterm-256color
set termencoding=utf-8
set guifont=Monospace\ 11
colorscheme xoria256
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set linespace=5
set ignorecase                  " ignore case when searching
set visualbell           " don't beep
set noerrorbells         " don't beep
let NERDTreeShowHidden=1
nmap <C-b> :NERDTreeToggle<cr>
nmap <C-s> :w!<cr> "faster save
syntax enable

" Powerline (Fancy thingy at bottom stuff)
let g:Powerline_symbols = 'fancy'
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

"abbrev gm !php artisan generate:model
function! Publish()
    let branch = input('Release number')

    execute ":!git flow release start " . branch . " && git flow release publish " . branch . " && git flow release finish -Fp " . branch
endfunction

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

set tabstop=4        "number of visual spaces per TAB
set softtabstop=4   "number of spaces in tab when editing
set expandtab       " tabs are spaces
set number          " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files!!!!!!!
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
let mapleader=","       " leader is comma

augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.md
                \:call <SID>StripTrailingWhitespaces()
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END


