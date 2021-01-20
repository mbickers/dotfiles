"
"Max Bickers
"NVIM Config file
"

set nocompatible
set hidden
set updatetime=250

set ignorecase

set noswapfile

"Config open/reload
nnoremap <Leader>e :e $MYVIMRC<CR>
nnoremap <Leader>r :so $MYVIMRC<CR>

"Set up line numbering
set number
set relativenumber

"Intelligent tab settings
set tabstop=4
set expandtab
set shiftwidth=4
set autoindent

"Start scrolling before hitting top of screen
set scrolloff=10

"Import plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'

Plug 'arcticicestudio/nord-vim'

Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

Plug 'jiangmiao/auto-pairs'

Plug 'lervag/vimtex'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

"Theme and appearance
colorscheme nord
set cursorline

"Customize tabline
highlight TabLineFill ctermfg=none ctermbg=none
highlight TabLine ctermfg=white ctermbg=black
highlight TabLineSel ctermfg=black ctermbg=white

function! CustomTabLine()
    let s = ''

    for i in range(tabpagenr('$'))
        let tab = i + 1
        let winnr = tabpagewinnr(tab)
        let buflist = tabpagebuflist(tab)
        let bufnr = buflist[winnr - 1]
        let bufname = bufname(bufnr)
        let bufmodified = getbufvar(bufnr, "&mod")

        let s .= (tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
        let s .= ' ' . (bufname != '' ? fnamemodify(bufname, ':t') : 'unnamed') . ' '
        let s .= "%#TabLineFill# "
    endfor

    let s .= '%#TabLineFill#'

    return s
endfunction

set tabline=%!CustomTabLine()

"Customize NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

"Configure airline
let g:airline_powerline_fonts = 1

let g:airline_theme = 'nord2'

set t_Co=256

let g:airline_section_z = airline#section#create(['%l/%L', '%3v'])

let g:airline_mode_map = {
      \ '__'     : '-',
      \ 'c'      : 'C',
      \ 'i'      : 'I',
      \ 'ic'     : 'I',
      \ 'ix'     : 'I',
      \ 'n'      : 'N',
      \ 'multi'  : 'M',
      \ 'ni'     : 'N',
      \ 'no'     : 'N',
      \ 'R'      : 'R',
      \ 'Rv'     : 'R',
      \ 's'      : 'S',
      \ 'S'      : 'S',
      \ '^S'     : 'S',
      \ 't'      : 'T',
      \ 'v'      : 'v',
      \ 'V'      : 'V',
      \ '^V'     : '^V',
      \ }

" Adjust vertical split
highlight StatusLine ctermbg = none
highlight StatusLineNC ctermbg = none

"Latex setup
let g:tex_flavor = "latex"

autocmd FileType tex nmap <buffer> <C-T> :w \| silent !xelatex %<CR>
autocmd FileType tex nmap <buffer> <C-G> :!open -a Skim %:r.pdf<CR><CR>
