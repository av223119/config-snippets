" general
set nocompatible
syntax on
filetype plugin indent on
set number
set incsearch
set smartcase
set autoindent
set laststatus=2
set scrolloff=1
set background=dark
set wildmode=list:longest             " list all, complete longest
set formatoptions+=j                  " merge two commented lines
set autoread                          " autoreload modified files
set path+=**                          " :find recursively
set wildignore+=**/venv/**            " don't want venv
set wildignore+=**/__pycache__/**     " nor pycache in :find
set nobackup                          " no files~
set directory=/var/tmp//              " swap files, insecure!
set undodir=/var/tmp//                " undo files, insecure!
let g:python_space_error_highlight=1  " line-final spaces
let g:is_posix=1                      " allows $()
let g:netrw_liststyle=3               " tree view
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
  if has('termguicolors')
    set termguicolors
    colorscheme NeoSolarized
  else
    colorscheme elflord
  endif
endif
