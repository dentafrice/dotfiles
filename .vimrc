set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

" Vundle packages
call vundle#begin()
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'digitaltoad/vim-jade'
Plugin 'edkolev/tmuxline.vim'
Plugin 'gmarik/Vundle.vim' " required
Plugin 'groenewege/vim-less'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kchmck/vim-coffee-script'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'majutsushi/tagbar'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'plasticboy/vim-markdown'
Plugin 'Raimondi/delimitMate'
Plugin 'rodjek/vim-puppet'
Plugin 'SirVer/ultisnips'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'Valloric/YouCompleteMe'
Plugin 'nelstrom/vim-markdown-folding'
Plugin 'mattn/emmet-vim'
call vundle#end()

" Move visual block
vnoremap J :m '>+1<CR>gv
vnoremap K :m '<-2<CR>gv

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

" wrapping
au FileType gitcommit set tw=100

" fugative settings
set diffopt+=vertical

" key bindings
let mapleader = ","
set pastetoggle=<F3>
nnoremap <silent> <Space> :noh<CR>

" quick save with ,s
noremap <leader>s :update<CR>

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
let g:syntastic_python_flake8_args = '--max-line-length=100 --ignore=W503'

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
autocmd! BufNewFile,BufRead *.applescript,*.scpt    setfiletype applescript

" Tip: Place the cursor in the optimal position, editing email messages.
" Author: Davide Alberani
" Version: 0.1
" Date: 24 May 2006
" Description: if you use Vim to edit your emails, having to manually
" move the cursor to the right position can be quite annoying.
" This command will place the cursor (and enter insert mode)
" in the more logical place: at the Subject header if it's
" empty or at the first line of the body (also taking
" care of the attribution, to handle replies messages).
" Usage: I like to call the Fip command by setting the command that is used
" by my mail reader (mutt) to execute Vim. E.g. in my muttrc I have:
" set editor="vim -c ':Fip'"
" Obviously you can prefer to call it using an autocmd:
" " Modify according to your needs and put this in your vimrc:
" au BufRead mutt* :Fip
" Hints: read the comments in the code and modify it according to your needs.
" Keywords: email, vim, edit, reply, attribution, subject, cursor, place.

" Function used to identify where to place the cursor, editing an email.
function FirstInPost (...) range
  let cur = a:firstline
  while cur <= a:lastline
    let str = getline(cur)
    " Found an _empty_ subject in the headers.
    " NOTE: you can put similar checks to handle other empty headers
    " like To, From, Newgroups, ...
    if str == 'Subject: '
      execute cur
      :start!
      break
    endif
    " We have reached the end of the headers.
    if str == ''
      " let cur = cur + 1
      " If the first line of the body is an attribution, put
      " the cursor _after_ that line, otherwise the cursor is
      " leaved right after the headers (assuming we're writing
      " a new mail, and not editing a reply).
      " NOTE: modify the regexp to match your mail client's attribution!
      " if strlen(matchstr(getline(cur), '^On.*wrote:.*')) > 0
      "   let cur = cur + 1
      " endif
      execute cur
      :start
      break
    endif
    let cur = cur + 1
  endwhile
endfunction

" Command to be called.
com Fip :set tw=0<Bar>:%call FirstInPost()
au BufRead mutt* :Fip

" Delete buffers via Ctrl-P
let g:ctrlp_buffer_func = { 'enter': 'MyCtrlPMappings' }

func! MyCtrlPMappings()
    nnoremap <buffer> <silent> <c-@> :call <sid>DeleteBuffer()<cr>
endfunc

func! s:DeleteBuffer()
    let line = getline('.')
    let bufid = line =~ '\[\d\+\*No Name\]$' ? str2nr(matchstr(line, '\d\+'))
        \ : fnamemodify(line[2:], ':p')
    exec "bd" bufid
    exec "norm \<F5>"
endfunc
