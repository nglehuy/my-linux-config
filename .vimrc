call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'                  " line on top and bottom

Plug 'vim-airline/vim-airline-themes'           " theme of the top and bottom lines

Plug 'terryma/vim-multiple-cursors'

Plug 'mattn/emmet-vim'

Plug 'airblade/vim-gitgutter'

Plug 'w0rp/ale'

Plug 'sbdchd/neoformat'

Plug 'neomake/neomake'

Plug 'morhetz/gruvbox'

Plug 'ayu-theme/ayu-vim'

Plug 'drewtempelmeyer/palenight.vim'

Plug 'sheerun/vim-polyglot'                     " syntax++

Plug 'justinmk/vim-syntax-extra'                " c,bison,flex

Plug 'tpope/vim-markdown'                       " markdown

Plug 'chrisbra/csv.vim'                         " csv

Plug 'prettier/vim-prettier', { 'do': 'yarn install' }      " js, ts autoformat

Plug 'vim-scripts/indentpython.vim'

Plug 'mhinz/vim-signify'

Plug 'lervag/vimtex'

Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'fatih/molokai'

Plug 'connorholyday/vim-snazzy'

Plug 'jiangmiao/auto-pairs'                     " auto closed brackets

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()

" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/plugged/vundle')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/syntastic'

" For indentation
Plugin 'Yggdroot/indentLine'

" javascript syntax
Plugin 'othree/yajs.vim'

"All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" deoplete
let g:deoplete#enable_at_startup = 1

" start nvim/vim config
set number
set showmatch
set showcmd
set cursorline
highlight clear CursorLine " Removes the underline causes by enabling cursorline
syntax on
set bg=dark
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let ayucolor="mirage"
let g:gitgutter_highlight_lines = 1
let python_highlight_all=1
" end nvim/vim config

" start theme config
colorscheme snazzy
let g:airline_theme='badwolf'
let g:molokai_original = 1
" end theme config

" start netrw config
" let g:netrw_banner = 0
" let g:netrw_browse_split = 4
" let g:netrw_liststyle = 3
" let g:netrw_altv = 1
" let g:netrw_winsize = 25
" end netrw config
execute pathogen#infect()
call pathogen#helptags()

" start NERDTree config
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeHijackNetrw = 1
map <C-t> :NERDTreeToggle<CR>
" Start NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | q | endif
" end NERDTree config

" set default indentation
set tabstop=4
set shiftwidth=4
set expandtab
set laststatus=2
set splitright
set splitbelow

" auto closed brackets
" inoremap ( ()<left>
" inoremap { {}<left>
" inoremap [ []<left>

" for javascript
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2

" mapping
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" autopep8
au BufNewFile,BufRead *.py
    \ set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix

set encoding=utf-8

" start syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" end syntastic config

" virtualenv
" %{virtualenv#statusline()}

" python with virtualenv support
if has('python')
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
endif

" start ALE config
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
" end ALE config

:set listchars=tab:\|\ 
:set list

" Indent line guides
" let g:indentLine_setColors = 0
let g:indentLine_char = '|'

" Vimtex
let g:polyglot_disabled = ['latex']

" Gitgutter
let g:gitgutter_highlight_lines = 0
