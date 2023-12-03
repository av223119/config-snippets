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
set noswapfile                        " no swap files either
let g:python_space_error_highlight=1  " line-final spaces
let g:is_posix=1                      " allows $()
let g:netrw_liststyle=3               " tree view

" Personal undo dir
if empty(glob('~/.vim/undo'))
  silent call system('mkdir -p ~/.vim/undo')
endif
set undodir=~/.vim/undo//

" Install Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  let url='https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  silent call system('wget --help')
  if v:shell_error
    silent execute $'!curl -fLo ~/.vim/autoload/plug.vim --create-dirs {url}'
  else
    silent execute $'!wget -P ~/.vim/autoload {url}'
  endif
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin()

Plug 'overcache/NeoSolarized'
Plug 'lifepillar/vim-solarized8'
Plug 'mhartington/oceanic-next'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

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

" filetype-specific stuff
augroup filetypes
  autocmd!
  autocmd FileType python
    \ hi pythonSpaceError guibg=darkred ctermbg=darkred
  autocmd FileType vim
    \ setlocal tabstop=2 shiftwidth=2 expandtab
augroup END

" Grep is either git grep or recursive grep
function! Grep(p)
  silent call system('git status')
  if v:shell_error
    let prg = $'grep -R -n {a:p} .'
  else
    let prg = $'git --no-pager grep -n {a:p}'
  endif
  return system(prg)
endfunction

" Custom commands
command! -nargs=+ Grep cgetexpr Grep(<f-args>) | cwindow

command! -bang -nargs=* GitGrep
  \ let gitroot = systemlist('git rev-parse --show-toplevel')[0]
  \ | if v:shell_error
  \ |   echoerr 'Not in git repo'
  \ | else
  \ |   call fzf#vim#grep(
  \       'git grep --line-number -- '.fzf#shellescape(<q-args>),
  \       fzf#vim#with_preview({'dir': gitroot}), <bang>0)
  \ | endif

" keybindings
noremap <leader>ff :Files<cr>
noremap <leader>gf :GFiles<cr>
noremap <leader>gg :GitGrep<cr>
"noremap <leader>g :execute 'Grep ' . expand('<cword>')<cr>
vnoremap < <gv
vnoremap > >gv
