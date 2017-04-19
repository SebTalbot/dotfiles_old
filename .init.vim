" Create a symbolic link of this config file to Neovim directory (create it if
" it doesn't exist):
" mkdir ~/.config/nvim
" ln -s ~/.init.vim ~/.config/nvim/init.vim
"
" You need to install vim-plug:
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" Then install every plugins with :PluginInstall or :PluginUpdate
"
" Installing python
if(!has("python"))
	call system(expand("pip2 install --user --upgrade neovim"))
endif

if(!has("python3"))
	call system(expand("pip3 install --user --upgrade neovim"))
endif
"
" Install Tern
" cd ~/.config/nvim/plugged/tern_for_vim && npm install
"
" Run YouCompleteMe install script:
" cd ~/.config/nvim/plugged/YouCompleteMe
" ./install.py --tern-completer
"
" Install linters for Neomake:
" -JavaScript:
" sudo npm install -g jshint
" -Python:
" sudo pip install jedi
"
" Don't forget to copy ~/.tern-project in your JS project if it isn't a children
" of your home directory

" Plugins  ---------------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')
Plug 'vim-scripts/L9'

" - look and interface
Plug 'scrooloose/nerdtree'
Plug 'liuchengxu/space-vim-dark'
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'thirtythreeforty/lessspace.vim'
Plug 'rbgrouleff/bclose.vim'

" - movement
Plug 'vim-scripts/FuzzyFinder'
Plug 'Lokaltog/vim-easymotion'

" - edit text
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'simnalamburt/vim-mundo'

" - error and snippets
Plug 'sheerun/vim-polyglot'
Plug 'neomake/neomake'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Raimondi/delimitMate'
Plug 'Valloric/YouCompleteMe'
Plug 'ternjs/tern_for_vim'
Plug 'davidhalter/jedi-vim'

" - git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" - webdev
Plug 'mattn/emmet-vim'
Plug 'groenewege/vim-less'
Plug 'ap/vim-css-color'
Plug 'hail2u/vim-css3-syntax'
Plug 'jelera/vim-javascript-syntax'
Plug 'shawncplus/phpcomplete.vim'
Plug 'php.vim'

call plug#end()
filetype plugin indent on

" THEME AND UI  ----------------------------------------------------------------
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
set colorcolumn=81
colorscheme madeofcode
hi Comment cterm=bold
highlight ColorColumn ctermbg=235

" Airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='violet'

" FEEL AND UTILITIES  ----------------------------------------------------------
set ignorecase "Ignore case when /searches
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
set foldlevelstart=20
set splitbelow
set splitright
set scrolloff=2
set hidden

" Mundo
" Enable persistent undo so that undo history persists across vim sessions
set undofile
set undodir=~/.nvim/undo

" Python Path
let g:python_host_skip_check=1
let g:python3_host_skip_check=1
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

" Filetype
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd filetype php set filetype=php.html
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" Ultisnip
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"

" Neomake
autocmd! BufWritePost,BufEnter * Neomake
hi link NeomakeError Error
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

" YouCompleteMe
let g:ycm_use_ultisnips_completer = 1
let g:ycm_semantic_triggers =  {
\   'c' : ['->', '.'],
\   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
\             're!\[.*\]\s'],
\   'ocaml' : ['.', '#'],
\   'cpp,objcpp' : ['->', '.', '::'],
\   'perl' : ['->'],
\   'php' : ['->', '::'],
\   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
\   'ruby' : ['.', '::'],
\   'lua' : ['.', ':'],
\   'erlang' : [':'],
\ }

" TernJS
let g:tern_map_keys=1
let g:tern_show_argument_hints='on_hold'

" MAPPING ----------------------------------------------------------------------
let mapleader = "\<Space>"

" Open NERDTree, the file browser menu
map <Leader>n :NERDTreeToggle<CR>

" Hide search highlight
nnoremap <leader>/ :nohlsearch<CR>

" Open Mundo, the undo tree
nnoremap <Leader>u :MundoToggle<CR>

" Start help command in vertical split
nnoremap <leader>h :vert h<space>

" Manipulate windows
nnoremap <leader>w<leader> <C-W>q
nnoremap <leader>wv <C-W>v
nnoremap <leader>wj <C-W><C-J>
nnoremap <leader>wk <C-W><C-K>
nnoremap <leader>wl <C-W><C-L>
nnoremap <leader>wh <C-W><C-H>

" Manipulate tabs
nnoremap <leader>t<leader> :tabclose<CR>
nnoremap <leader>tt :tabonly<CR>
nnoremap <leader>tn :tabnew %<CR>

" Manipulate buffers
nnoremap <leader>b<leader> :Bclose<CR>
nnoremap gb :bn<CR>
nnoremap gB :bp<CR>

" Paste global clipboard to another line
nnoremap <leader>p o<ESC>"+p
nnoremap <leader>P O<ESC>"+p

" Bouger lignes
nnoremap <A-k> ddkP
nnoremap <A-j> ddp

" Highlight same variable
nnoremap <leader>* *``

" Stay in visual mode after indent
vnoremap < <gv
vnoremap > >gv

" Manipulate terminal
tnoremap <Esc> <C-\><C-n>
