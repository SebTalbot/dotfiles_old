" Create a symbolic link of this config file to Neovim directory:
" ln -s ~/.init.vim ~/.config/nvim/init.vim
" You need to install vim-plug:
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" Install every plugins with :PluginInstall or :PluginUpdate
"
" Install TrnJS :
" cd ~/.config/nvim/plugged/tern_for_vim && npm install
"
" Run YouCompleteMe install script:
" cd ~/.config/nvim/plugged/YouCompleteMe
" ./install.py --tern-completer
" 
" Install linters for Neomake:
" -JavaScript:
" sudo npm install -g jshint
"
" Don't forget to copy .tern-project in your JS project if it isn't a children
" of your home directory

call plug#begin('~/.config/nvim/plugged')
Plug 'vim-scripts/L9'

" - look and interface
Plug 'scrooloose/nerdtree'
Plug 'liuchengxu/space-vim-dark'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" - movement
Plug 'vim-scripts/FuzzyFinder'
Plug 'Lokaltog/vim-easymotion'

" - edit text
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'sjl/gundo.vim'

" - error and snippets
Plug 'neomake/neomake'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'Valloric/YouCompleteMe'

" - git
Plug 'tpope/vim-fugitive'

" - webdev
Plug 'mattn/emmet-vim'
Plug 'ternjs/tern_for_vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'shawncplus/phpcomplete.vim'
Plug 'php.vim'

call plug#end()            " required
filetype plugin indent on    " required

" THEME AND UI  ----------------------------------------------------------------
set t_Co=256
set background=dark
set encoding=utf-8
set fileencoding=utf-8
set relativenumber
set hlsearch
set showmatch
set showcmd
set noerrorbells
set novisualbell
set cursorline
set timeoutlen=1000 ttimeoutlen=200
colorscheme space-vim-dark
hi Comment cterm=bold

" Airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='violet'

" FEEL AND UTILITIES  ----------------------------------------------------------
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
set ignorecase "Ignore case when /searches
"" set lazyredraw
set nobackup
set nowb
set noswapfile
set shiftwidth=4
set softtabstop=4
set tabstop=4
set incsearch
set ignorecase smartcase
set foldenable
set foldmethod=indent
set foldlevelstart=10
set splitbelow
set splitright
set scrolloff=2

" Python Path
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

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

" Neomake
autocmd! BufWritePost,BufEnter * Neomake
let g:neomake_warning_sign = {
  \ 'text': 'W',
  \ 'texthl': 'WarningMsg',
  \ }
let g:neomake_error_sign = {
  \ 'text': 'E',
  \ 'texthl': 'ErrorMsg',
  \ }
let g:neomake_javascript_jshint_maker = {
    \ 'args': ['--verbose'],
    \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
    \ }
let g:neomake_javascript_enabled_makers = ['jshint']

" TernJS
let g:tern_map_keys=1
let g:tern_show_argument_hints='on_hold'

" MAPPING ---------------------------------------------------------------------
let mapleader = "\<Space>"

" Open NERDTree, the file browser menu
map <Leader>n :NERDTreeToggle<CR>

" Hide search highlight
nnoremap <leader>/ :nohlsearch<CR>

" Open Gundo, the undo tree
nnoremap <Leader>u :GundoToggle<CR>

" Start help command in vertical split
nnoremap <leader>h :vert h<space>

" Move between windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Paste global clipboard to another line
nnoremap <leader>p o<ESC>"+p
nnoremap <leader>P O<ESC>"+p

" Stay in visual mode after indent
vnoremap < <gv
vnoremap > >gv
