" basic settings - - - - - - - - - - - - - - - - -
set encoding=utf-8
set background=dark
set expandtab
set tabstop=4
set shiftwidth=4
set hlsearch
exec "set listchars=tab:\u2050\u2050,trail:\uB7"
set list
set nu
hi ColorColumn ctermbg=255
hi LineNr ctermfg=darkgrey
let python_highlight_all=1
syntax on

" file specific indentation - - - - - - - - - - -
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \| set softtabstop=4
    \| set shiftwidth=4
    \| set fileformat=unix
    \| set expandtab
    \| set autoindent
    \| set fileformat=unix
    " \| set textwidth=79
au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2
    \| set softtabstop=2
    \| set shiftwidth=2
    \| set fileformat=unix

" split window settings - - - - - - - - - - - - -
" " general movement
set winminheight=0
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" " toggle full and split view
nnoremap <C-N> :call SplitFullToggle()<cr>
let g:split_is_full = 0
function! SplitFullToggle()
    if g:split_is_full
        echo "minimize"
        exe "normal \<C-W>\<C-_>"
        let g:split_is_full = 0
    else
        echo "maximize"
        exe "normal \<C-W>\<C-=>"
        let g:split_is_full = 1
    endif
endfunction

" code folding - - - - - - - - - - - - - - - - -
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" plugins - - - - - - - - - - - - - - - - - - - -
call plug#begin('~/.vim/plugged')
  Plug 'tmhedberg/SimpylFold'
  Plug 'vim-scripts/indentpython.vim'
  Plug 'davidhalter/jedi-vim'
  Plug 'ervandew/supertab'
  Plug 'vim-syntastic/syntastic'
  Plug 'nvie/vim-flake8'
  Plug 'tpope/vim-commentary'
  Plug 'dense-analysis/ale'
  " Plug 'preservim/nerdtree'
  " Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  " Plug 'junegunn/fzf.vim'
call plug#end()
" " vim-plug
filetype indent off  " b/c vim-plug turns this on
" " NERDTree
" let NERDTreeShowHidden=1
" let NERDTreeMapActivateNode='l'
" " SimplyFold
let g:SimpylFold_docstring_preview=1
" " jedi-vim
let g:jedi#auto_vim_configuration = 0
let g:jedi#use_splits_not_buffers = 'bottom'
let g:jedi#popup_on_dot = 0
autocmd FileType python setlocal completeopt-=preview  " disable docstring window
nnoremap <C-D> :call jedi#goto()<CR>
" " supertab
set omnifunc=syntaxcomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
" " python virtualenv support for goto definition
python3 << EOF
import os
import subprocess
if "VIRTUAL_ENV" in os.environ:
    project_base_dir = os.environ["VIRTUAL_ENV"]
    script = os.path.join(project_base_dir, "bin/activate")
    pipe = subprocess.Popen(". %s; env" % script, stdout=subprocess.PIPE, shell=True)
    output = pipe.communicate()[0].decode('utf8').splitlines()
    env = dict((line.split("=", 1) for line in output))
    os.environ.update(env)
EOF
" " vim-commentary
vmap <C-_> gc  " weirdly C-_ means Ctrl+/
" " ale
packloadall
silent! helptags ALL
let g:ale_linters = {
      \   'python': ['flake8', 'pylint3'],
      \}
