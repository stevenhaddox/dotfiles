let mapleader = ","

call pathogen#infect()
call pathogen#helptags()

"#######################################################
"#######              Leader mappings             ######
"#######################################################
"v to select just pasted text for manipulation
nnoremap <leader>v V`]
"W to remove whitespace from file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
"ft to fold tag (e.g. HTML)
nnoremap <leader>ft Vatzf
"q to hard rewrap paragraphs of text
nnoremap <leader>q gqip

"Some semblance of sanity with Ruby spacing:
colorscheme Tomorrow-Night
set number
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set smarttab autoindent

"Sanity as per:
"http://stevelosh.com/blog/2010/09/coming-home-to-vim/ 
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile

" Make the colorcolumn light gray
highlight ColorColumn ctermbg=7
"Columns
set wrap
set textwidth=79
set formatoptions=qrn1
"set colorcolumn=85

"I never remember these, but I want them when I look them up...
"e.g.: Make code folding easy & intuitive for me personally:
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

"Definitely need my highlights:
syntax on
filetype plugin indent on
"Invisibles that mimic TextMate, it's visually pleasing to me:
set list
set listchars=tab:▸\ ,eol:¬

"Searching defaults, from:
"http://stevelosh.com/blog/2010/09/coming-home-to-vim/ 
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %`

"File security apparently:
set modelines=0

"powerline config (the awesome bar at the bottom of vim now):
set nocompatible
set laststatus=2
set encoding=utf-8
set t_Co=256
let g:Powerline_symbols = 'fancy'
