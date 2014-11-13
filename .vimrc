execute pathogen#infect()

" display
filetype plugin indent on
syntax enable

set showmatch " show matching characters ([{}])
set hlsearch " highlights search
set cursorline " highlights current line
set showtabline=2
set laststatus=2
set scrolloff=5 " show more context at end of buffer
set colorcolumn=100
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:. " highlight spaces, tabs, and extended lines
set title
set foldlevelstart=20 " all folds open when starting a file

" theme
let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai

" sanity
set nocompatible
set nu
set nobackup
set noswapfile
set autoread
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
set hidden
set tags=.git/tags,.tags
set splitbelow
set splitright
set completeopt=menuone
set timeoutlen=1000 ttimeoutlen=0

" better splits
set splitbelow
set splitright

" searching
set incsearch
set ignorecase
set smartcase
set wildignore+=*.pyc,*.o,*.obj,.git
set wildignore+=*.jar,*.zip,*.md5,*.map,*.png,*.jpg,*.svg,*.min.js
set wildignore+=*.eot,*.ttf,*.woff,*.pid
set wildignore+=log,tmp,node_modules
set wildignore+=bower_components,assets/build,env

" basic controls
set mouse=a
set backspace=indent,eol,start

" fix commenting space
let g:NERDSpaceDelims = 1

" tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2
autocmd Filetype jade setlocal ts=2 sts=2 sw=2
autocmd Filetype coffee setlocal ts=2 sts=2 sw=2
set cindent
set smartindent
set autoindent

" key bindings
let mapleader = ",""
set pastetoggle=<F3>
nnoremap <silent> <Space> :noh<CR>

if has('mac')
    nnoremap <leader>y :call system('nc localhost 8377', @0)<CR>
elseif has('unix')
    nnoremap <leader>y :call system('nc --send-only localhost 8377', @0)<CR>
endif

"" helpers
nnoremap gr /Reviewers:<CR>A

"" nerdtree
map <C-n> :NERDTreeTabsToggle<CR> " toggle NERDTree

"" fugative
map <leader>gb :Gblame<CR> " open git blame

"" tagbar
nmap <F8> :TagbarToggle<CR> " toggle tagbar

"" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

"" easymotion
map <Leader> <Plug>(easymotion-prefix)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

"" ctrl-p
nmap <leader>; :CtrlPBuffer<CR>

"" you complete me
nnoremap <leader>g :YcmCompleter GoToDeclaration<CR>

"" goyo
nnoremap <Leader>G :Goyo<CR>

"" better splits
nnoremap <C-w>- :sp<CR>
nnoremap <C-w><bar> :vsp<CR>

"" better split navigation
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" plugins

"" ack
let g:ack_default_options = " -H --nocolor --nogroup --column"

"" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 0

"" nerd tree
"let g:nerdtree_tabs_open_on_console_startup=1
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$', '\.swp$']

"" gitgutter
let g:gitgutter_realtime = 1
set updatetime=750 " update gitgutter quicker
highlight clear SignColumn

"" ctrl-p
let g:ctrlp_custom_ignore = {'dir': 'env'}
let g:ctrlp_open_multiple_files = 't'
let g:ctrlp_open_new_file = 't'

"" syntastic
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--max-line-length=100'

"" easy motion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion

"" you complete me
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_key_list_select_completion = []
let g:ycm_key_list_previous_completion = []

"" tagbar
let g:tagbar_autofocus = 1

" functions

"" Strip trailing whitespace on save

fun! <SID>StripTrailingWhitespaces()
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
