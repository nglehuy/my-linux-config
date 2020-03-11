" call plug#begin('~/.vim/plugged')
" 
" " Plug 'mattn/emmet-vim'
" 
" " Plug 'w0rp/ale'
" 
" " if has('nvim')
" "   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" " else
" "   Plug 'Shougo/deoplete.nvim'
" "   Plug 'roxma/nvim-yarp'
" "   Plug 'roxma/vim-hug-neovim-rpc'
" " endif
" 
" call plug#end()

" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/vundle')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Ale
Plugin 'dense-analysis/ale'

" Brings physics-based smooth scrolling to the Vim/Neovim world!
Plugin 'yuttie/comfortable-motion.vim'

" Insert or delete brackets, parens, quotes in pair.
Plugin 'jiangmiao/auto-pairs'

" Show difference in code by using a sign column
Plugin 'mhinz/vim-signify'
Plugin 'airblade/vim-gitgutter'

" For indentation
Plugin 'Yggdroot/indentLine'

" Rainbow
Plugin 'luochen1990/rainbow'

" Clang Format
Plugin 'rhysd/vim-clang-format'

" Vim auto closed tag
Plugin 'alvan/vim-closetag'

" Vaffle
Plugin 'cocopon/vaffle.vim'

" Markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" COC 
Plugin 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install() }}

" Python formatter
Plugin 'tell-k/vim-autopep8'

" OPERATOR TO SURROUND A TEXT OBJECT
Plugin 'kana/vim-operator-user'
Plugin 'rhysd/vim-operator-surround'

" MARKDOWN PREVIEW FOR (NEO)VIM
Plugin 'iamcco/markdown-preview.nvim'

" Prettier formatter for javascript
Plugin 'prettier/vim-prettier'

" Csv file
Plugin 'chrisbra/csv.vim'

" Syntax++
Plugin 'sheerun/vim-polyglot'

" fuzzy finder
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }

" Comment
Plugin 'tpope/vim-commentary'

" Themes
Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'phanviet/vim-monokai-pro'
Plugin 'joshdick/onedark.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" deoplete
let g:deoplete#enable_at_startup = 1
" call deoplete#custom#option('ignore_sources': { 'py' })

" onedark
let g:onedark_terminal_italics = 1

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
let python_highlight_all=1
" end nvim/vim config

" start theme config
set termguicolors
" colorscheme gruvbox
colorscheme onedark
" colorscheme monokai_pro
" colorscheme ayu
let g:airline_theme='onedark'
" let g:molokai_original = 1
" end theme config

" start netrw config
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_liststyle = 3
let g:netrw_altv = 1
let g:netrw_winsize = 25
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
autocmd VimEnter * nested call LoadSession()
" autocmd VimEnter * NERDTree
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | q | endif
" end NERDTree config

" save session
" autocmd VimLeave * NERDTreeClose
autocmd VimLeave * if getcwd() != $HOME && getcwd() != $HOME.'/.config/nvim/' | mksession! .session.vim | endif

" load session
" open vaffle only no .session.vim file 
function! LoadSession()
    if getcwd() != $HOME.'/.config/nvim/' && getcwd() != $HOME && filereadable(".session.vim")
      " source local project Session.vim
      source .session.vim
    else
        if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in")
            call OpenVaffle()
        endif
    endif
endfunction

set sessionoptions-=options  " Don't save options

" set default indentation
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set laststatus=2
set splitright
set splitbelow
set textwidth=79
set fileformat=unix

" for javascript
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2

" mapping
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" autopep8
let g:autopep8_max_line_length=79
let g:autopep8_disable_show_diff=1
let g:autopep8_on_save=1
let g:autopep8_indent_size=2
let g:autopep8_ignore="E501,W293,E226,E24,W6,E121"
autocmd FileType python set tabstop=2 softtabstop=2 shiftwidth=2 textwidth=79 expandtab fileformat=unix
autocmd FileType python noremap <buffer> <C-i> :call Autopep8("--ignore E121")<CR>
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
let g:ale_sign_error = 'er'
let g:ale_sign_warning = 'wn'
let g:ale_lint_on_save=1
let g:ale_lint_on_text_changed=0
let g:ale_python_pylint_change_directory=0
let g:ale_python_pylint_use_global=1
let g:ale_python_pylint_auto_pipenv=1
let g:ale_list_window_size=1
let g:ale_linters = {
\   'python': ['pylint'],
\   'javascript': ['eslint'],
\   'vue': ['eslint']
\}
let g:airline#extensions#ale#enabled=1
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
" hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE

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

set shell=/usr/bin/zsh

" operator mappings
map <silent>sa <Plug>(operator-surround-append)
map <silent>sd <Plug>(operator-surround-delete)
map <silent>sr <Plug>(operator-surround-replace)

" Vaffle
function! OpenVaffle() abort
  if bufname('%') == ''
    call vaffle#init()
  else
    call vaffle#init(expand('%:p'))
  endif
endfunction
nnoremap <leader>v :call OpenVaffle()<CR>
let g:vaffle_show_hidden_files = 1
map sh <Plug>(vaffle-open-selected-split)
map sv <Plug>(vaffle-open-selected-vsplit)

" Coc nvim
set hidden
set nobackup
set nowritebackup
" Give more space for displaying messages.
set cmdheight=2
set updatetime=300
set shortmess+=c

" Switch to opened buffer position, including tab
set switchbuf=usetab
