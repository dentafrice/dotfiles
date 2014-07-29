execute pathogen#infect()

filetype plugin indent on
set nu
set showmatch
set hlsearch
set mouse=a
set cursorline
syntax enable

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

" theme
set background=dark
colorscheme solarized

" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 0

" nerd tree
let g:nerdtree_tabs_open_on_console_startup=1
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
