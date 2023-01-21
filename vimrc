" general
syntax on
set number
set incsearch
set smartcase
set autoindent
set background=dark
set wildmode=list:longest
" python
augroup python
  autocmd!
  autocmd FileType python
    \ setlocal tabstop=4 |
    \ setlocal softtabstop=4 |
    \ setlocal shiftwidth=4 |
    \ setlocal expandtab
augroup END
" GUI
if has('gui_running')
  if has('linux')
    set guifont=Ubuntu\ Mono\ 16
    set guioptions=aegi
  elseif has('mac')
    set guifont=AndaleMono:h18
    set guioptions=egm
  endif
  set columns=120
  set lines=40
  let g:neosolarized_italic=1
  colorscheme NeoSolarized
else
  colorscheme elflord
endif
