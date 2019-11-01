""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" get plugin manager if we don't already have it
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
 silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
   \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
 autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

Plug 'davidhalter/jedi-vim'
Plug 'ervandew/supertab'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
Plug 'w0rp/ale'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This ensures all virtual envs have access to flake8 & black
let g:python3_host_prog = '/Users/jasonadam/.local/share/virtualenvs/nvim-kCTaSSN-/bin/python'

syntax on
set number
set encoding=utf-8
set fileencoding=utf-8
set backspace=indent,eol,start
set mouse=a
let mapleader = "m"

" Tab & Indent Config
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

" Ignore case when searching
set ignorecase
set smartcase

" General Usability
set scrolloff=5
set autoindent
set clipboard=unnamedplus

" Search will center on line if found
nnoremap n nzzzv
nnoremap N Nzzzv

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Dracula
colorscheme dracula

" Gruvbox
" set background=dark
" colorscheme gruvbox
" let g:gruvbox_contrast_dark = 'hard'
" let g:gruvbox_invert_signs = 1
" let g:gruvbox_invert_tabline = 1
" let g:gruvbox_improved_warnings = 1

" Airline
let g:airline#extensions#ale#enabled = 1
let g:airline#extesions#coc#enabled = 1
let g:airline#extensions#ale#error_symbol = 'E:'
let g:airline#extensions#ale#warning_symbol = 'W:'
let g:airline_theme = 'dracula'

" True Color Support
set termguicolors

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ale
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_completion_enabled = 0
let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1
let g:ale_set_quickfix = 1
let g:ale_virtualtext_cursor = 1
let g:ale_warn_about_trailing_blank_lines = 0

let g:ale_linters = {
                \ 'python': ['flake8']
                \ }

let g:ale_fixers = {
            \ '*': ['trim_whitespace'],
            \ 'c': ['trim_whitespace', 'clang-format', 'clangtidy'],
            \ 'go': ['trim_whitespace', 'goimports'],
            \ 'python': ['black'],
            \ }

let g:ale_python_flake8_options    = '--max-line-length=100'
let g:ale_python_black_options     = '--line-length 100'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Jedi Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:jedi#use_splits_not_buffers = "winwidth"
let g:jedi#popup_on_dot = 0
let g:jedi#smart_auto_mappings = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Go Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_highlight_functions         = 1
let g:go_highlight_function_calls    = 1
let g:go_highlight_methods           = 1
let g:go_highlight_types             = 1
let g:go_highlight_fields            = 1
let g:go_highlight_operators         = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags     = 1
let g:go_highlight_debug             = 1

let g:go_fmt_command       = "goimports"
let g:go_fmt_autosave      = 0
let g:go_fmt_fail_silently = 1
let g:go_mod_fmt_autosave  = 0
let g:go_asmfmt_autosave   = 0

let g:go_metalinter_autosave        = 0
let g:go_metaliner_enabled          = []
let g:go_metaliner_autosave_enabled = []

let g:go_term_enabled            = 1
let g:go_term_mode               = "VTerm"
let g:go_updatetime              = 100
let g:go_code_completion_enabled = 0
let g:go_jump_to_error           = 0
let g:go_def_mapping_enabled     = 0
let g:go_gorename_prefill        = ''
let g:go_gocode_propose_source   = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File Formatting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup yaml_files
    autocmd!
    au BufRead,BufNewFile *.yml setfiletype yaml
    au FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

augroup make_files
    autocmd!
    au FileType make setlocal noexpandtab
augroup END

augroup docker_files
    autocmd!
    au BufRead,BufNewFile Dockerfile.* set syntax=Dockerfile
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:fzf_layout = {'down': '20%'}

