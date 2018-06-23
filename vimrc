syntax on
set background=dark
set expandtab
set tabstop=4
set shiftwidth=4
set hlsearch
exec "set listchars=tab:\u2050\u2050,trail:\uB7"
set list
let &colorcolumn="80,".join(range(120,120),",")
hi ColorColumn ctermbg=255
map <C-c> :hi ColorColumn ctermbg=0<CR>
map <C-e> :match Error /[^\x00-\x7f]/<CR>
" split window settings below
set winminheight=0
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
" map  :w!:!clear; pdflatex %; xpdf %<.pdf&

" folding
" set foldmethod=indent
" set foldminlines=5
" set foldignore=
" nnoremap <space> za
" vnoremap <space> zf
" function! MyFoldText()
"     let line = getline(v:foldstart)
"
"     let nucolwidth = &fdc + &number * &numberwidth
"     let windowwidth = winwidth(0) - nucolwidth - 3
"     let foldedlinecount = v:foldend - v:foldstart
"
"     " expand tabs into spaces
"     let onetab = strpart('          ', 0, &tabstop)
"     let line = substitute(line, '\t', onetab, 'g')
" 
"     let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
"     let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
"     return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
" endfunction
" set foldtext=MyFoldText()
