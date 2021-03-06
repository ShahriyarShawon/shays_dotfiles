filetype plugin on
filetype indent on
"filetype on

" Set to autoread when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime
"Leader key allows extra key combos
let mapleader = ","

" jump to jump point, delete it, and go into insert mode
nnoremap <space><space> <esc>/<jp><cr>4xi
" Fast Saving
nmap <leader>w <Esc>:w<cr>
" Skeleton for LaTeX document
nmap <leader>l i\documentclass{article}<cr><cr>
            \\title{<jp>}<cr>
            \\date{<jp>}<cr>
            \\author{Shahriyar Shawon}<cr><cr>
            \\begin{document}<cr>
            \\maketitle<cr>
            \\newpage<cr><cr>
            \\end{document}

nnoremap j jzz
nnoremap k kzz

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Easy Tab switching
nnoremap <leader>h <C-w>h
nnoremap <leader>l <C-w>l
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k

" NerdTree configs
nnoremap <leader>t :NERDTreeFocus<cr>
nnoremap <C-s> :NERDTreeToggle<cr>

" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree


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
set pastetoggle=<F3>

" Autocmds
" autocmd {Event to watch for} {Pattern to filter for} {command to run}

"" Set normal tabs for Makefiles, these files are picky
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0


" Put 80 char indicator 
set cc=80






