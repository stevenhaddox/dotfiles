" Base16 color scheme for Powerline
" N = no focus
call Pl#Hi#Allocate({
  \ 'base00': 0,
  \ 'base01': 10,
  \ 'base02': 11,
  \ 'base03': 8,
  \ 'base04': 12,
  \ 'base05': 7,
  \ 'base06': 13,
  \ 'base07': 15,
  \ 'base08': 1,
  \ 'base09': 9,
  \ 'base0a': 3,
  \ 'base0b': 2,
  \ 'base0c': 6,
  \ 'base0d': 4,
  \ 'base0e': 5,
  \ 'base0f': 14,
  \ })

let g:Powerline#Colorschemes#base16#colorscheme = Pl#Colorscheme#Init([
  \ Pl#Hi#Segments(['SPLIT'], {
    \ 'n': ['base07', 'base02'],
    \ 'N': ['base07', 'base01'],
    \ }),
  \
  \ Pl#Hi#Segments(['mode_indicator'], {
    \ 'n': ['base01', 'base0b', ['bold']],
    \ 'i': ['base07', 'base0d', ['bold']],
    \ 'v': ['base01', 'base09', ['bold']],
    \ 'r': ['base07', 'base08', ['bold']],
    \ 's': ['base01', 'base02', ['bold']],
    \ }),
  \
  \ Pl#Hi#Segments(['branch', 'scrollpercent', 'raw', 'filesize'], {
    \ 'n': ['base06', 'base03'],
    \ 'N': ['base03', 'base01'],
    \ }),
  \
  \ Pl#Hi#Segments(['fileinfo', 'filename'], {
    \ 'n': ['base07', 'base03', ['bold']],
    \ 'N': ['base03', 'base01', ['bold']],
    \ }),
  \
  \ Pl#Hi#Segments(['fileinfo.filepath'], {
    \ 'n': ['base05'],
    \ 'N': ['base03'],
    \ 'i': ['base06'],
    \ }),
  \
  \ Pl#Hi#Segments(['static_str'], {
    \ 'n': ['base07', 'base02'],
    \ 'N': ['base03', 'base01'],
    \ 'i': ['base07', 'base0d'],
    \ }),
  \
  \ Pl#Hi#Segments(['fileinfo.flags'], {
    \ 'n': ['base08', ['bold']],
    \ 'N': ['base08'],
    \ 'i': ['base08', ['bold']],
    \ }),
  \
  \ Pl#Hi#Segments(['currenttag', 'fullcurrenttag', 'fileformat', 'fileencoding', 'pwd', 'filetype', 'rvm:string', 'rvm:statusline', 'virtualenv:statusline', 'charcode', 'currhigroup'], {
    \ 'n': ['base05', 'base02'],
    \ 'i': ['base06', 'base02'],
    \ }),
  \
  \ Pl#Hi#Segments(['lineinfo'], {
    \ 'n': ['base01', 'base06', ['bold']],
    \ 'N': ['base03', 'base01', ['bold']],
    \ }),
  \
  \ Pl#Hi#Segments(['errors'], {
    \ 'n': ['base0a', 'base02', ['bold']],
    \ }),
  \
  \ Pl#Hi#Segments(['lineinfo.line.tot'], {
    \ 'n': ['base03'],
    \ 'N': ['base03'],
    \ 'i': ['base01'],
    \ }),
  \
  \ Pl#Hi#Segments(['paste_indicator', 'ws_marker'], {
    \ 'n': ['base07', 'base0e', ['bold']],
    \ }),
  \
  \ Pl#Hi#Segments(['gundo:static_str.name', 'command_t:static_str.name'], {
    \ 'n': ['base07', 'base08', ['bold']],
    \ 'N': ['base06', 'base0f', ['bold']],
    \ }),
  \
  \ Pl#Hi#Segments(['gundo:static_str.buffer', 'command_t:raw.line'], {
    \ 'n': ['base07', 'base08'],
    \ 'N': ['base06', 'base0f'],
    \ }),
  \
  \ Pl#Hi#Segments(['gundo:SPLIT', 'command_t:SPLIT'], {
    \ 'n': ['base07', 'base08'],
    \ 'N': ['base06', 'base0f'],
    \ }),
  \
  \ Pl#Hi#Segments(['ctrlp:focus', 'ctrlp:byfname'], {
    \ 'n': ['base06', 'base0e'],
    \ }),
  \
  \ Pl#Hi#Segments(['ctrlp:prev', 'ctrlp:next', 'ctrlp:pwd'], {
    \ 'n': ['base07', 'base0e'],
    \ }),
  \
  \ Pl#Hi#Segments(['ctrlp:item'], {
    \ 'n': ['base0e', 'base07', ['bold']],
    \ }),
  \
  \ Pl#Hi#Segments(['ctrlp:marked'], {
    \ 'n': ['base08', 'base0e', ['bold']],
    \ }),
  \
  \ Pl#Hi#Segments(['ctrlp:count'], {
    \ 'n': ['base0e', 'base07'],
    \ }),
  \
  \ Pl#Hi#Segments(['ctrlp:SPLIT'], {
    \ 'n': ['base07', 'base0e'],
    \ }),
  \ ])
