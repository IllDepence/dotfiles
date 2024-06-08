" // currently not used \\
"
" " ?
" set background=dark
"
" " display colored column in col 80
" set colorcolumn=80
" hi ColorColumn ctermbg=255
"
" " show line numbers in dark grey
" " (not needed when using lualine plugin)
" set nu
" hi LineNr ctermfg=darkgrey
"
" \\ currently not used //

" basic setup - - - - - - - - - - - - - - - - - -
" " disables Vi compatibility mode to enable more advanced features
set nocompatible
" " set file encoding to UTF-8
set encoding=utf-8
" " convert tabs to spaces, 4 for tab key, 4 for autoindent
set expandtab
set tabstop=4
set shiftwidth=4
" " hightlight all search results
set hlsearch
" " indicate tabs as ⁐⁐ and trailing spaces as ·
set list
exec "set listchars=tab:\u2050\u2050,trail:\uB7"
" " prevent mouse clicks from changing cursor position
" " (makes selecting to copy w/o holding shift possible)
set mouse=r
" " enable syntax highlighting
syntax on
" " full syntax highlighting for Python
let python_highlight_all=1
" " configures backspace key to work in various contexts
set backspace=indent,eol,start

" file specific indentation - - - - - - - - - - -
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \| set softtabstop=4
    \| set shiftwidth=4
    \| set fileformat=unix
    \| set expandtab
    \| set autoindent
    \| set fileformat=unix
au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2
    \| set softtabstop=2
    \| set shiftwidth=2
    \| set fileformat=unix

" split window settings - - - - - - - - - - - - -
" " minimum window height
set winminheight=0
" " Ctrl + h/j/k/l to move to window left/down/up/right
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" " Ctrl + n to toggle full/split view (custom function)
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
" " use indentation to define folds
set foldmethod=indent
" " open all folds by default
set foldlevel=99
" " Space to toggle folds
nnoremap <space> za

" vim-plug - - - - - - - - - - - - - - - - - - -
" " add plugins
call plug#begin('~/.vim/plugged')
  Plug 'tmhedberg/SimpylFold'
  Plug 'vim-scripts/indentpython.vim'
  Plug 'davidhalter/jedi-vim'
  Plug 'ervandew/supertab'
  Plug 'vim-syntastic/syntastic'
  Plug 'nvie/vim-flake8'
  Plug 'tpope/vim-commentary'
  Plug 'dense-analysis/ale'
  Plug 'github/copilot.vim'

  Plug 'nvim-lualine/lualine.nvim'
  Plug 'nvim-tree/nvim-web-devicons'

  Plug 'sainnhe/sonokai'

  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }

  Plug 'nvim-tree/nvim-tree.lua'
call plug#end()
" " disable automatic file type indentation
" " (b/c vim-plug turns this on)
filetype indent off

" SimplyFold - - - - - - - - - - - - - - - - - - -
let g:SimpylFold_docstring_preview=1
" jedi-vim - - - - - - - - - - - - - - - - - - - -
" " hides mode indicator (e.g., --INSERT--)
set noshowmode
" " show call signatures in command line instead
" " of within the buffer
let g:jedi#show_call_signatures = '2'
" " disable automatic vim configuration
let g:jedi#auto_vim_configuration = 0
" " use splits for Jedi popups
let g:jedi#use_splits_not_buffers = 'bottom'
" " disable autocompletion popups (on pressing dot (.)?)
let g:jedi#popup_on_dot = 0
" " disable docstring window
autocmd FileType python setlocal completeopt-=preview
" " Ctrl + d to got to defintion
nnoremap <C-D> :call jedi#goto()<CR>

" supertab - - - - - - - - - - - - - - - - - - - -
set omnifunc=syntaxcomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

" vim-commentary - - - - - - - - - - - - - - - - -
" " Ctrl + / to toogle comment
vmap <C-_> gc

" ale - - - - - - - - - - - - - - - - - - - - - -
" " load all packages
packloadall
" " silently generate help tags for all plugins
silent! helptags ALL
" " enable sign column to indicate linting errors
set signcolumn=yes
" " configure lintors
let g:ale_linters = {
      \   'python': ['flake8', 'pylint'],
      \}

" copilot - - - - - - - - - - - - - - - - - - - -
" " disable copilot
" " (autocmd that executes for all new buffers / when
" " opening a file of any kind)
au BufNewFile,BufRead * let b:copilot_enabled = 0
