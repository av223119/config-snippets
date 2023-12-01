" General
set nocompatible
syntax on
filetype plugin indent on
set number
set incsearch
set smartcase
set autoindent
set laststatus=2                      " always
set scrolloff=1                       " top/bottom screen offset
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

" Install Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  let s:url='https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  silent call system('wget --help')
  if v:shell_error
    silent execute $'!curl -fLo ~/.vim/autoload/plug.vim --create-dirs {s:url}'
  else
    silent execute $'!wget -P ~/.vim/autoload {s:url}'
  endif
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin()

Plug 'overcache/NeoSolarized'
" lifepillar/vim-solarized8

Plug 'mhartington/oceanic-next'

call plug#end()

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
else
  if has('termguicolors')
    set termguicolors
  endif
endif

" Colors
set background=dark
let g:neosolarized_italic=1
let g:oceanic_next_terminal_bold=1
let g:oceanic_next_terminal_italic=1
"colorscheme NeoSolarized
colorscheme OceanicNext

" python
augroup python
  autocmd!
  autocmd FileType python
    \ hi pythonSpaceError guibg=darkred ctermbg=darkred
augroup END

" Grep is either git grep or recursive grep
function! Grep(p)
  silent call system("git status")
  if v:shell_error
    let prg = $"grep -R -n {a:p} ."
  else
    let prg = $"git --no-pager grep -n {a:p}"
  endif
  return system(prg)
endfunction
command! -nargs=+ Grep cgetexpr Grep(<f-args>) | cwindow

" keybindings
noremap <leader>e :Lex<cr>
noremap <leader>g :execute"Grep " . expand("<cword>")<cr>
vnoremap < <gv
vnoremap > >gv
