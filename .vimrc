" You need to install Vundle first:
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"
" Install every plugins with :PluginInstall or :PluginUpdate
"
" Install TrnJS :
" cd ~/.vim/bundle/tern_for_vim && npm install
"
" Run YouCompleteMe install script:
" cd ~/.vim/bundle/YouCompleteMe
" ./install.py --tern-completer
"
" Don't forget to copy .tern-project in your JS project if it isn't a children
" of your home directory

" VUNDLE CONFIG
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-scripts/L9'

" - look and interface
Plugin 'scrooloose/nerdtree'
Plugin 'liuchengxu/space-vim-dark'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" - movement
Plugin 'vim-scripts/FuzzyFinder'
Plugin 'Lokaltog/vim-easymotion'

" - edit text
Plugin 'tpope/vim-surround'
Plugin 'tomtom/tcomment_vim'
Plugin 'vim-scripts/Gundo'

" - error and snippets
Plugin 'scrooloose/syntastic'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets.git'
Plugin 'jiangmiao/auto-pairs'
Plugin 'Valloric/YouCompleteMe'

" - git
Plugin 'tpope/vim-fugitive'

" - webdev
Plugin 'mattn/emmet-vim'
Plugin 'ternjs/tern_for_vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'php.vim'

call vundle#end()            " required
filetype plugin indent on    " required

" THEME AND UI  ----------------------------------------------------------------
set t_Co=256
syntax enable
set background=dark
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
colorscheme space-vim-dark
hi Comment cterm=bold

" Airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
"let g:airline_left_sep=''
"t g:airline_right_sep=''
let g:airline_theme='violet'

" FEEL AND UTILITIES  ----------------------------------------------------------
set autoread
set ignorecase "Ignore case when /searches
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" set lazyredraw
set nobackup
set nowb
set noswapfile
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set autoindent
set incsearch
set foldenable
set foldmethod=indent
set foldlevelstart=10
set splitbelow
set splitright
set scrolloff=2

" Snippets
autocmd filetype php set filetype=php.html
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" Ultisnip
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"

" SuperTab like snippets behavior.
" imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']

" TernJS
let g:tern_map_keys=1
let g:tern_show_argument_hints='on_hold'

" MAPPING ---------------------------------------------------------------------
let mapleader = "\<Space>"
map <Leader>n :NERDTreeToggle<CR>
nnoremap <leader>/ :nohlsearch<CR>
nnoremap gV `[v`]
nnoremap <Leader>u :GundoToggle<CR> "Super Undo aka undo-tree
nnoremap <leader>h :vert h<space>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-Z> <C-W>T

" Stay in visual mode after indent
vnoremap < <gv
vnoremap > >gv
