" vim:foldmethod=marker"
" vim:fmr={,}
" vim:fdm=marker

" If folding is not working run:
" :set fdm=marker
" zM (close-all), zR (open-all), za (toggle), zc, zo

" Pathogen {{{
call pathogen#infect()
call pathogen#helptags()
" }}}

" http://stevelosh.com/blog/2010/09/coming-home-to-vim/#using-the-leader
" Leader mappings {{{
let mapleader = ","
"v to select just pasted text for manipulation
nnoremap <leader>v V`]
"jj to <esc>
:imap jj <Esc>
"W to remove whitespace from file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
"ft to fold tag (e.g. HTML)
nnoremap <leader>ft Vatzf
"q to hard rewrap paragraphs of text
nnoremap <leader>q gqip
" }}}

" Colorschemes
" set t_Co=256
if filereadable(expand("${HOME}/.vimrc_background"))
  let base16colorspace=256
  source ${HOME}/.vimrc_background
  set background=dark
endif

" Some semblance of sanity with Ruby spacing {{{
set number
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set smarttab autoindent
set pastetoggle=<F2> " Toggle pastemode via F2 to prevent cascading indents
" }}}

" Vim Sanity {{{
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
" }}}

" Enable the colorcolumn {{{
"Columns
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=+1 " Column highlights 1 char beyond texwidth
highlight ColorColumn ctermbg=19
" }}}

" Enable the cursorline background color {{{
highlight CursorLine cterm=NONE ctermbg=19
set cursorline
" }}}

" Line number color {{{
highlight LineNr ctermfg=19
highlight CursorLineNr ctermfg=4
" }}}

" Folding {{{
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1
" }}}

" Highlights {{{
syntax on
filetype plugin indent on
" Invisibles that mimic TextMate, it's visually pleasing to me:
set list
set listchars=tab:▸\ ,eol:¬
" }}}

" Searching {{{
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
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
" }}}

" Filetype syntax & spacing via modeline {{{
set modelines=2
" }}}

" File Backups {{{
" Save your backups to a less annoying place than the current directory.
" If you have .vim-bak in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim-bak or . if all else fails.
if isdirectory($HOME . '/.vim-bak') == 0
  :silent !mkdir -p ~/.vim-bak >/dev/null 2>&1
endif
set backupdir=$TEMP//,~/.vim-bak//,~/tmp,.
set backup
" }}}

" Swp Files {{{
" Save your swp files to a less annoying place than the current directory.
" If you have .vim-swp in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim-swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
  :silent !mkdir -p ~/.vim-swap >/dev/null 2>&1
endif
set directory=$TEMP//,~/.vim-swp//,~/tmp,.
" }}}

" viminfo stores (previous editing session) {{{
set viminfo+=n~/.vim-info
" }}}

" Undo {{{
if exists("+undofile")
  "undofile - This allows you to use undos after exiting and restarting
  "This, like swap and backups, uses .vim-undo first, then ~/.vim-undo
  ":help undo-persistence
  "This is only present in 7.3+
  if isdirectory($HOME . '/.vim-undo') == 0
    :silent !mkdir -p ~/.vim-undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim-undo//
  set undofile
endif
" }}}

" Crontab OS X Fix
if $VIM_CRONTAB == 'true'
  set nobackup
  set nowritebackup
endif

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'
"let g:airline_theme='base16-default'
"let g:airline#themes#base16#constant = 1
set laststatus=2


au BufReadPost Jenkinsfile set syntax=groovy
au BufReadPost Jenkinsfile set filetype=groovy
