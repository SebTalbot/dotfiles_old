" THEME AND UI  ----------------------------------------------------------------
syntax enable
set encoding=utf-8
set fileencoding=utf-8
set wildmenu
set relativenumber
set hlsearch
set showmatch
set noerrorbells
set novisualbell
set cursorline
set ttimeoutlen=10
hi Comment cterm=bold
let g:molokai_original = 1
colorscheme molokai
set colorcolumn=81
highlight ColorColumn ctermbg=235

" FEEL AND UTILITIES  ----------------------------------------------------------
set autoread
set ignorecase "Ignore case when /searches
set nobackup
set nowb
set noswapfile
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set autoindent
set foldenable
set foldmethod=indent
set foldlevelstart=10
set splitbelow
set splitright
set scrolloff=2
set clipboard=unnamed

" MAPPING ---------------------------------------------------------------------
let mapleader = "\<Space>"

" Hide search highlight
nnoremap <leader>/ :nohlsearch<CR>

" Start help command in vertical split
nnoremap <leader>h :vert h<space>

" Manipulate windows
nnoremap <leader>wd <C-W>q
nnoremap <leader>wv <C-W>v
nnoremap <leader>ws <C-W>s
nnoremap <leader>wj <C-W><C-J>
nnoremap <leader>wk <C-W><C-K>
nnoremap <leader>wl <C-W><C-L>
nnoremap <leader>wh <C-W><C-H>

" Manipulate tabs
nnoremap <leader>t<leader> :tabclose<CR>
nnoremap <leader>tt :tabonly<CR>
nnoremap <leader>tn :tabnew %<CR>

" Manipulate buffers
nnoremap <leader>bb :ls<CR>:b<space>
nnoremap <leader>b<leader> :Bclose<CR>
nnoremap gb :bn<CR>
nnoremap gB :bp<CR>

" Paste global clipboard to another line
nnoremap <leader>p o<ESC>"+p
nnoremap <leader>P O<ESC>"+p

" Bouger lignes
nnoremap <C-K> ddkP
nnoremap <C-J> ddp
vnoremap <C-K> dkP`[V`]
vnoremap <C-J> dp`[V`]

" Stay in visual mode after indent
vnoremap < <gv
vnoremap > >gv

" Highlight same variable
nnoremap <leader>* *``
