set nocompatible
execute pathogen#infect()

filetype plugin indent on
set nu
set showmatch
set hlsearch
set mouse=a
set cursorline
syntax enable
set backspace=indent,eol,start

" fix commenting space
let g:NERDSpaceDelims = 1

" auto reload if changed outside of vim
set autoread

" status
set laststatus=2

" tab line
set showtabline=2

" tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

autocmd Filetype yaml setlocal ts=2 sts=2 sw=2

let g:ack_default_options = " -H --nocolor --nogroup --column"

" theme
let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai

" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 0

" nerd tree
"let g:nerdtree_tabs_open_on_console_startup=1
map <C-n> :NERDTreeTabsToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.swp$']

" gitgutter
let g:gitgutter_realtime = 1
set updatetime=750 " update gitgutter quicker
highlight clear SignColumn

" stupid bells
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

map <leader>gb :Gblame<CR>

" ignore files
set wildignore+=*.pyc
let NERDTreeIgnore = ['\.pyc$', '\.swp$']

" searching
set incsearch
set ignorecase
set smartcase

set scrolloff=3 " show more context at end of buffer

nmap <F8> :TagbarToggle<CR>
nmap <leader>; :CtrlPBuffer<CR>

set nobackup
set noswapfile

" highlight spaces, tabs, and extended lines
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" must.. not.. arrow.
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

set colorcolumn=100

" ctrl-p
let g:ctrlp_custom_ignore = {
    \ 'dir': 'env',
    \ }
let g:ctrlp_open_multiple_files = 't'
let g:ctrlp_open_new_file = 't'

" syntastic
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--max-line-length=100'

" easy motion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
map <Leader> <Plug>(easymotion-prefix)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

" you complete me
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_key_list_select_completion = []
let g:ycm_key_list_previous_completion = []
nnoremap <leader>g :YcmCompleter GoTo<CR>
nnoremap <leader>g :YcmCompleter GoToDeclaration<CR>

" tagbar
let g:tagbar_autofocus = 1
