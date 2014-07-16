execute pathogen#infect()
filetype plugin indent on
set nu
set showmatch
set hlsearch
set mouse=a
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

fun! s:ToggleMouse()
    if !exists("s:old_mouse")
        let s:old_mouse = "a"
    endif

    if &mouse == ""
        let &mouse = s:old_mouse
        echo "Mouse is for Vim (" . &mouse . ")"
    else
        let s:old_mouse = &mouse
        let &mouse=""
        echo "Mouse is for terminal"
    endif
endfunction

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

map <C-n> :NERDTreeToggle<CR>
