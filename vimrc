syntax on
set background=dark
set expandtab
set tabstop=4
set shiftwidth=4
set hlsearch
exec "set listchars=tab:\u2050\u2050,trail:\uB7"
set list
let &colorcolumn="80,".join(range(120,999),",")
hi ColorColumn ctermbg=255
map <C-c> :hi ColorColumn ctermbg=0<CR>
map <C-e> :match Error /[^\x00-\x7f]/<CR>
" map  :w!:!clear; pdflatex %; xpdf %<.pdf&
