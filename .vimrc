call pathogen#infect()
call pathogen#helptags()

"Some semblance of sanity with Ruby spacing:
colorscheme Tomorrow-Night
set number
set tabstop=2 shiftwidth=2 expandtab
set smarttab autoindent

"I never remember these, but I want them when I look them up...
"e.g.: Make code folding easy & intuitive for me personally:
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

"Definitely need my highlights:
syntax on
filetype plugin indent on

"powerline config (the awesome bar at the bottom of vim now):
set nocompatible
set laststatus=2
set encoding=utf-8
set t_Co=256
let g:Powerline_symbols = 'fancy'
