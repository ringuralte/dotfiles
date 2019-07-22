call plug#begin()

Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install() }}
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'jparise/vim-graphql'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-commentary'
Plug 'tomasr/molokai'
Plug 'justinmk/vim-sneak'
Plug 'ryanoasis/vim-devicons'
Plug 'kaicataldo/material.vim'
Plug 'vim-scripts/indentpython.vim'

call plug#end()

set nocompatible
set laststatus=2
set noshowmode
set showtabline=2
set background=dark
set shortmess+=c
set completeopt+=preview
set noswapfile
set nowrap
set title
set cmdheight=2         "set bottomcommadn height to be 2
set updatetime=2000
set history=200	        "keep 200 lines of command line history
set ruler               "how the cursor position all the time
set showcmd	            "display incomplete commands
set wildmenu	          "display completion matches in a status line
set expandtab           "on pressing tab insert 2 spaces
"set visualbell
set encoding=utf-8
set termguicolors
set undofile            "maintain undo history between sessions
set undodir=~/.vim/undo "persistent undo
set hls is              "set search highlighting and incremental search
set tabstop=2
set shiftwidth=0        "use tabstop
set softtabstop=-1      "use shiftwidth"
set conceallevel=0

"set splitbelow          always set new splits below and right"
set splitright

"leader key
let mapleader = "\<Space>"

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

let g:indentLine_char = '|'
colorscheme material
let g:gruvbox_contrast_dark='hard'
let g:material_theme_style='ocean'

" Switch syntax highlighting on when the terminal has colors or when using the
" GUI (which always has colors).
if &t_Co > 2 || has("gui_running")
  ""Revert with :syntax off".
  syntax on
endif

if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  " Revert with ":filetype off".
  filetype plugin indent on

  " Put these in an autocmd group, so that you can revert them with:
  " :augroup vimStartup | au! | augroup END"
  augroup vimStartup
    au!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid, when inside an event handler
    " (happens when dropping a file on gvim) and for a commit message (it's
    " likely a different one than last time).
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif

  augroup END

endif " has("autocmd")

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

let g:lightline = {
  \   'colorscheme': 'molokai',
  \   'active': {
  \     'left':[[ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly'],
  \             [ 'cocstatus','readonly']
  \     ]
  \   },
  \   'component_function': {
  \     'gitbranch': 'fugitive#head',
  \     'cocstatus': 'coc#status'
  \   }
  \ }
let g:lightline.separator = {
	\   'left': '', 'right': ''
  \}
let g:lightline.subseparator = {
	\   'left': '', 'right': '' 
  \}

let g:lightline.tabline = {
    \ 'left': [['tabs']],
    \ 'right': [['filename', 'close']]
    \}

"emmet
let g:user_emmet_expandabbr_key = '<C-e>'

"escape with jk 
inoremap jk <Esc>

"split management
nmap <C-H> <C-W><C-H>
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-L> <C-W><C-L>

"Remapping tab 
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

"remap fzf
nmap <Leader>p :Files<Cr>
nmap <Leader>f :GFiles<Cr>
nmap <Leader>b :Buffers<Cr>
nmap <Leader>h :History<Cr>
nmap <Leader>g :Rg<Cr>

"more remapping
nmap <Leader>n :noh<Cr> 

"remove ex mode when accidentally pressing capital Q
nnoremap Q <nop>

"type :Prettier to use the coc-prettier extension
" command! -nargs=0 <C-n> :CocCommand prettier.formatFile
nmap <C-n> :CocCommand prettier.formatFile<Cr>

let g:sneak#label=1

"setting different number mode for insert and normal mode
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

"setting indentation for javascript, html and css
au BufNewFile,BufRead *.js,*.html,*.css,*.scss
  \  setlocal tabstop=2

"setting for python
au BufNewFile,BufRead *.py
  \ setlocal tabstop=4 textwidth=79 fileformat=unix

"flag unnecessary whitespace
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
