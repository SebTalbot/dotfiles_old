" Dependencies -----------------------------------------------------------------
" You need to run ./scripts/install-nvim-dependencies.sh
"
" Then install every plugins with :PluginInstall or :PluginUpdate
"
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

" Plugins  ---------------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')

" THEME AND UI
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'

" APPLICATIONS
Plug 'simnalamburt/vim-mundo'
Plug 'kien/ctrlp.vim'

" COMMANDS
Plug 'rbgrouleff/bclose.vim'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'

" AUTOCOMP AND SNIPPETS
Plug 'roxma/nvim-completion-manager'
Plug 'SirVer/ultisnips'
Plug 'jsfaint/gen_tags.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neco-syntax'

"" VimScript
Plug 'Shougo/neco-vim'
"" CSS
Plug 'othree/csscomplete.vim'
"" PHP
Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}
"" JavaScript
Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}
Plug 'roxma/ncm-flow'
"" Python
Plug 'davidhalter/jedi-vim'


call plug#end()
filetype plugin indent on

" THEME AND UI  ----------------------------------------------------------------
syntax enable
set termguicolors
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
colorscheme gruvbox
set background=dark
set colorcolumn=81
highlight ColorColumn ctermbg=235

" FEEL AND UTILITIES  ----------------------------------------------------------
set autoread
set ignorecase
set nobackup
set nowb
set noswapfile
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set autoindent
set hidden
set foldenable
set foldmethod=indent
set foldlevelstart=20
set splitbelow
set splitright
set scrolloff=2
set clipboard=unnamed
set undofile
set undodir=~/.nvim/undo
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" LANGUAGES --------------------------------------------------------------------
"
" General
" -Omnicompletion
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType c set omnifunc=ccomplete#Complete

set cot-=preview

" PHP
autocmd FileType php set makeprg=php\ -l\ %
autocmd FileType php set errorformat=%m\ in\ %f\ on\ line\ %l
autocmd FileType php LanguageClientStart


" PYTHON
let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'jedi')
let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'mistune')
let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'psutil')
let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'setproctitle')

" PLUGINS ----------------------------------------------------------------------
" Airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='term'

" nvim-completion-manager
let g:cm_refresh_length = 1
let g:cm_matcher_module = "cm_matchers.fuzzy_matcher"

" Ultisnips
let g:UltiSnipsExpandTrigger		= "<C-L>"
let g:UltiSnipsJumpForwardTrigger	= "<C-N>"
let g:UltiSnipsJumpBackwardTrigger	= "<C-P>"
let g:UltiSnipsRemoveSelectModeMappings = 0

" MAPPING ---------------------------------------------------------------------
let mapleader = "\<Space>"

" Applications
nnoremap <Leader>au :MundoToggle<CR>
nnoremap <Leader>ap :CtrlP<CR>

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
nnoremap <leader>wJ <C-W><S-J>
nnoremap <leader>wK <C-W><S-K>
nnoremap <leader>wL <C-W><S-L>
nnoremap <leader>wH <C-W><S-H>

" Manipulate tabs
nnoremap <leader>td :tabclose<CR>
nnoremap <leader>tt :tabonly<CR>
nnoremap <leader>tn :tabnew %<CR>

" Manipulate buffers
nnoremap <leader>bb :ls<CR>:b<space>
nnoremap <leader>bt <C-^>
nnoremap <leader>bd :Bclose<CR>
nnoremap gb :bn<CR>
nnoremap gB :bp<CR>

" Paste global clipboard to another line
nnoremap <leader>p o<ESC>"+p
nnoremap <leader>P O<ESC>"+p

" Move lines
nnoremap <C-K> ddkP
nnoremap <C-J> ddp
vnoremap <C-K> dkP`[V`]
vnoremap <C-J> dp`[V`]

" Stay in visual mode after indent
vnoremap < <gv
vnoremap > >gv

" Highlight same variable
nnoremap <leader>* *``

" Manipulate terminal
tnoremap <Esc> <C-\><C-n>
tnoremap <C-D> <c-\><c-n>:Bclose!<CR>

" Toggling between languages
nnoremap <leader>lh :set ft=html<CR>
nnoremap <leader>lp :set ft=php<CR>
