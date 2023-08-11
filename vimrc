" general
syntax on
filetype plugin indent on
set number
set incsearch
set smartcase
set autoindent
set background=dark
set wildmode=list:longest
let g:python_space_error_highlight=1
" undo / backup / swap
set nobackup
set directory=/var/tmp//
set undodir=/var/tmp//
" keybindings
noremap <leader>e :Lex<cr>
vnoremap < <gv
vnoremap > >gv
" python
augroup python
  autocmd!
  autocmd FileType python
    \ hi pythonSpaceError guibg=darkred ctermbg=darkred
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
