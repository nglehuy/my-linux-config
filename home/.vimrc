call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'                  " line on top and bottom

Plug 'vim-airline/vim-airline-themes'           " theme of the top and bottom lines

Plug 'mattn/emmet-vim'

Plug 'airblade/vim-gitgutter'

Plug 'w0rp/ale'

Plug 'sbdchd/neoformat'

Plug 'neomake/neomake'

Plug 'morhetz/gruvbox'

Plug 'ayu-theme/ayu-vim'

Plug 'sheerun/vim-polyglot'                     " syntax++

Plug 'chrisbra/csv.vim'                         " csv

Plug 'prettier/vim-prettier', { 'do': 'npm install' }      " js, ts autoformat

Plug 'vim-scripts/indentpython.vim'

Plug 'mhinz/vim-signify'

Plug 'jiangmiao/auto-pairs'                     " auto closed brackets

Plug 'yuttie/comfortable-motion.vim'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install'  }

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

" For indentation
Plugin 'Yggdroot/indentLine'

" Rainbow
Plugin 'luochen1990/rainbow'

" Clang Format
Plugin 'rhysd/vim-clang-format'

" Vim auto closed tag
Plugin 'alvan/vim-closetag'

" NerdTree
Plugin 'scrooloose/nerdtree'

" Markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" Python indent
Plugin 'Vimjas/vim-python-pep8-indent'

"All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" deoplete
let g:deoplete#enable_at_startup = 1

" start nvim/vim config
set relativenumber
set showmatch
set showcmd
set cursorline
highlight clear CursorLine " Removes the underline causes by enabling cursorline
syntax on
set bg=dark
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#ale#enabled = 1
let ayucolor="mirage"
let python_highlight_all=1
" end nvim/vim config

" start theme config
set termguicolors
" color dracula
" color lucario
" color nord
color gruvbox
" color PaperColor
" color molokai
" colorscheme ayu
" let g:airline_theme='deus'
" let g:molokai_original = 1
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
" let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeHijackNetrw = 1
map <C-t> :NERDTreeToggle<CR>
" Start NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | q | endif
" end NERDTree config

" save session
autocmd VimLeave * if getcwd() != $HOME && getcwd() != $HOME.'/.config/nvim/' | :mksession! .session.vim | endif

" load session
if getcwd() != $HOME.'/.config/nvim/' && getcwd() != $HOME && filereadable(".session.vim")
  " source local project Session.vim
  source .session.vim
endif

" set default indentation
set tabstop=4
set shiftwidth=4
set expandtab
set laststatus=2
set splitright
set splitbelow

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
map <C-i> :Autopep8<CR>
set encoding=utf-8

" start syntastic config
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" 
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_enable_highlighting=1
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
let g:ale_python_pylint_change_directory=0
let g:ale_python_flake8_change_directory=0
let g:ale_list_window_size = 2
let g:ale_linters = {
\   'python': ['flake8', 'pylint'],
\   'javascript': ['eslint'],
\   'vue': ['eslint']
\}
" end ALE config

:set listchars=tab:\|\ 
:set list

" Indent line guides
" let g:indentLine_setColors = 0
let g:indentLine_char = '|'

" Gitgutter
let g:gitgutter_highlight_lines = 0

" Comfortable scroll
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"

" Background
hi Normal guibg=NONE ctermbg=NONE

" Gruvbox config
let g:gruvbox_italic = 1

" Rainbow
let g:rainbow_active = 1

" Prettier
" single quotes over double quotes
" Prettier default: false
let g:prettier#config#single_quote = 'false'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

"HMe pylint
let g:ale_python_pylint_change_directory=0

"auto closed tag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.jsx'

" swap
set swapfile
set dir=~/.swap-files

" markdown
autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
let g:vim_markdown_math = 1
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_conceal = 0
let g:tex_conceal = ""
let g:vim_markdown_math = 1
let g:vim_markdown_conceal_code_blocks = 0

" wrap line
set nowrap

" rofi
au BufNewFile,BufRead /*.rasi setf css
