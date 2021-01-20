" Copyright (C) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
" Copyright (C) 2016-present Sven Greb <development@svengreb.de>

" Project: Nord Vim
" Repository: https://github.com/arcticicestudio/nord-vim
" License: MIT


let g:airline_left_sep = ''
let g:airline_right_sep = ''

let s:nord0_gui = "#2E3440"
let s:nord1_gui = "#3B4252"
let s:nord2_gui = "#434C5E"
let s:nord3_gui = "#4C566A"
let s:nord4_gui = "#D8DEE9"
let s:nord5_gui = "#E5E9F0"
let s:nord6_gui = "#ECEFF4"
let s:nord7_gui = "#8FBCBB"
let s:nord8_gui = "#88C0D0"
let s:nord9_gui = "#81A1C1"
let s:nord10_gui = "#5E81AC"
let s:nord11_gui = "#BF616A"
let s:nord12_gui = "#D08770"
let s:nord13_gui = "#EBCB8B"
let s:nord14_gui = "#A3BE8C"
let s:nord15_gui = "#B48EAD"

let g:airline#themes#nord2#palette = {}
let palette = g:airline#themes#nord2#palette

let s:highlights_term = {
            \'normal': 'white',
            \'insert': 'blue',
            \'replace': 'magenta',
            \'visual': 'cyan'
            \}

for item in ['normal', 'insert', 'replace', 'visual']
    let s:primary = ['', '', 'black', s:highlights_term[item], 'bold']
    let s:secondary = ['', '', s:highlights_term[item], 'black', 'none']
    let s:middle = ['', '', s:highlights_term[item], 'none', 'none']

    let palette[item] = airline#themes#generate_color_map(s:primary, s:secondary, s:middle)
    let palette[item].airline_term = s:middle
endfor

let s:inactive = ['', '', '8', 'none', 'none']
let g:airline#themes#nord2#palette.inactive = airline#themes#generate_color_map(s:inactive, s:inactive, s:inactive)

let s:warn = [s:nord1_gui, s:nord13_gui, '0', 'yellow']
let s:error = [s:nord0_gui, s:nord11_gui, '0', 'red']

for item in ['normal', 'insert', 'replace', 'visual', 'inactive']
    exe "let palette.".item.".airline_warning = s:warn"
    exe "let palette.".item.".airline_error = s:error"
endfor
