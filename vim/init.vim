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

"Tab settings
set tabstop=4
set expandtab
set shiftwidth=4
set autoindent

"Start scrolling before hitting top/bottom of screen
set scrolloff=10

"Theme and appearance
colorscheme nord
set cursorline

"Import plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'

Plug 'arcticicestudio/nord-vim'

Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

Plug 'jiangmiao/auto-pairs'

Plug 'lervag/vimtex'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

"Customize lightline
let g:lightline = {
            \ 'active': {
            \   'left': [['mode'], ['filename', 'modified']],
            \   'right': [['fileencoding', 'filetype']],
            \ },
            \ 'inactive': {
            \   'left': [['filename']],
            \   'right': [],
            \ },
            \ 'tabline': {
            \   'left': [['tabs']],
            \   'right': [],
            \ },
            \ 'tab': {
            \   'active': ['tabnum', 'tabname'],
            \   'inactive': ['tabnum', 'tabname'],
            \ },
            \ 'component_function': {
            \   'filename': 'CustomFilename',
            \ },
            \ 'tab_component_function': {
            \   'tabname': 'CustomTabname',
            \ },
            \ 'colorscheme': 'nord_custom',
            \ 'separator': {'left': '', 'right': ''},
            \ 'subseparator': {'left': '', 'right': ''},
            \ 'tabline_separator': {'left': '', 'right': ''},
            \ 'tabline_subseparator': {'left': '', 'right': ''},
            \ }

function! CustomFilename()
    let name = expand('%:t')
    return name != '' ? name : 'unnamed'
endfunction

function! CustomTabname(tab_num)
    let active_window_idx = tabpagewinnr(a:tab_num) - 1
    let active_buffer_idx = tabpagebuflist(a:tab_num)[active_window_idx]
    let name = bufname(active_buffer_idx)
    return name != '' ? name : 'unnamed'
endfunction

let s:palette = {
            \ 'normal': {
            \   'left': [['black', 'white', 'black', 'white'], ['white', 'black', 'white', 'black']],
            \   'middle': [['none', 'none', 'none', 'none']],
            \   'right': [['white', 'black', 'white', 'black']],
            \ },
            \ 'inactive': {
            \   'left': [['white', 'black', 'white', 'black']],
            \ },
            \ 'tabline': {
            \   'left': [['white', 'black', 'white', 'black']],
            \   'tabsel': [['black', 'white', 'black', 'white']],
            \ }}
let g:lightline#colorscheme#nord_custom#palette = s:palette

"Customize NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Adjust vertical split
highlight StatusLine ctermbg = none
highlight StatusLineNC ctermbg = none
