" VUNDLE
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'airblade/vim-gitgutter'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on


" Enable filetype plugins
filetype plugin on
filetype indent on
filetype on
" Set to autoread when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" Leader key allows extra key combos
let mapleader = ","

" Fast Saving
nmap <leader>w <Esc>:w<cr>

" Turn on wildmenu
set wildmenu

" Always show current position
set ruler

" Ignore case when searching
set ignorecase

" When searching, try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Show mactching brackets when text indicator is over them
set showmatch

" Enable syntax highlighting
syntax on

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" 1 tab = 4 spaces
" SEE LATER COMMAND SO THIS DOESNT MESS WITH MAKEFILES
set shiftwidth=4
set smartindent
set softtabstop=4


set number
set background=dark
set autoindent
set visualbell
filetype plugin on
set pastetoggle=<F3>


" Autocmds
" autocmd {Event to watch for} {Pattern to filter for} {command to run}
"" Set normal tabs for Makefiles, these files are picky
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0



" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>








