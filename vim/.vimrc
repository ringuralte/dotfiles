call plug#begin()

Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'fugitive.vim'
Plug 'airblade/vim-gitgutter'
Plug 'Shougo/denite.nvim'
Plug 'Yggdroot/indentLine'
Plug 'neoclide/coc.nvim',{'tag':'*','do':{->coc#util#install()}}
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

call plug#end()

set nocompatible
set laststatus=2
set noshowmode
set showtabline=2
set t_Co=256
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
set tabstop=2           "show existing tab with 2 spaces width
set softtabstop=2
set shiftwidth=2        "when indenting with '>' use 2 spaces width
set expandtab           "on pressing tab insert 2 spaces
set number
"set visualbell
set encoding=utf-8
set termguicolors
set undofile            "maintain undo history between sessions
set undodir=~/.vim/undo "persistent undo
set hls is              "set search highlighting and incremental search
"set ic                  "set ignore case for search

"set splitbelow          always set new splits below and right"
"set splitright

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"


let g:indentLine_char = '|'
colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'

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


let g:lightline = {
  \   'colorscheme': 'one',
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
    \ 'left': [['tabs','filename',]],
    \ 'right': [['close']]
    \}

"NerdTree visuals"
let g:WebDevIconsUnicodeDecorateFolderNodes=1
let g:WebDevIconsNerdTreeAfterGlyphPadding=' '
let g:NERDTreeDirArrowExpandable='+'
let g:NERDTreeDirArrowCollapsible='-'

"emmet
let g:user_emmet_expandabbr_key = '<C-e>'

"nerdtree is ctrl+n 
map <C-N> :NERDTreeToggle<CR>

"remapping hjkl to jkl;
noremap ; l
noremap l k
noremap k j
noremap j h

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

"type :Prettier to use the coc-prettier extension
command! -nargs=0 Prettier :CocCommand prettier.formatFile
