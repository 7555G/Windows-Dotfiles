"
" ${HOME}\_gvimrc
"

"""""""""""""""""""""""""""""""""""""""""""
set nocompatible " be iMproved, required
filetype off     " required

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
call vundle#begin('$HOME/vimfiles/bundle/')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"" plugins start here

Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdcommenter'
Plugin 'w0rp/ale'
Plugin 'lervag/vimtex'
Plugin 'lazywei/vim-matlab'
Plugin 'vim-python/python-syntax'
Plugin 'keith/swift.vim'
Plugin 'JuliaEditorSupport/julia-vim'
Plugin 'PProvost/vim-ps1'
Plugin 'neovimhaskell/haskell-vim'
Plugin 'bitc/vim-hdevtools'
Plugin 'gregjurman/vim-nc'

"" plugins end here
call vundle#end() " required
"""""""""""""""""""""""""""""""""""""""""""

filetype plugin indent on

" saving settings
set updatetime=750
set undofile                     " maintain undo file...
set undodir=$HOME/vimfiles/undo/ " in ~/vimfiles/undo/
set noswapfile
set nobackup
set nowb
set history=20

" colors
set t_Co=256
colorscheme sunyata

" set encodings and line ending formats
set gfs=fixedgr
set fileencodings=ucs-bom,utf-8,cp1253,default,latin1 " tried on open
set encoding=utf-8           " encoding displayed inside vim
set fileformats=dos,unix,mac " format order to be tried on a new buffer

" behavior
syntax on
set mouse=a
set regexpengine=1     " use old regex engine
set showcmd            " show typed command
set number             " show line numbers
set showmatch          " show matching parentheses
set laststatus=0       " hide statusline titles
set splitbelow         " open new horizontal windows at bottom
set splitright         " open new vertical windows at right
set fillchars+=vert:\  " set vertical separator to ' '
set previewheight=3    " set preview window height to 3

set autoindent
set ignorecase
set smartcase  " case sensitive only if Uppercase
set hlsearch   " highlight search matches

set sw=4 ts=4 sts=4         " default: 4 spaces per tab
set expandtab               " replace tabs with spaces
set backspace=2             " allow backspace in instert mode
set whichwrap+=h,l,<,>,[,]  " fix line movement on line borders
set wrap lbr                " wrap lines by word
set formatoptions+=tawcroql " automatic line breaking
set nojoinspaces            " don't insert 2 spaces after '.', '?' or '!'
let colorcolumnposition=81  " position of column to mark text width
set shell=pwsh.exe
let &shellcmdflag = '-NoLogo -Command'
set shellslash

" allow folding
set foldenable
set foldmethod=indent
set foldlevel=0    " depth of first folding
set foldnestmax=99 " depth of last folding
set foldcolumn=0

" fix movement in wrapped lines
noremap  <buffer> <silent> <Up>    gk
inoremap <buffer> <silent> <Up>    <C-o>gk
noremap  <buffer> <silent> <Down>  gj
inoremap <buffer> <silent> <Down>  <C-o>gj
noremap  <buffer> <silent> j       gj
noremap  <buffer> <silent> k       gk
noremap  <buffer> <silent> <Home>  g<home>
inoremap <buffer> <silent> <Home>  <C-o>g<home>
noremap  <buffer> <silent> <End>   g<End>
inoremap <buffer> <silent> <End>   <C-o>g<End>
noremap  <buffer> <silent> 0       g0
noremap  <buffer> <silent> ^       g^
noremap  <buffer> <silent> $       g$
noremap  <buffer> <silent> <Space> za

" execute last command with C-@
noremap  <buffer> <silent> <C-@>   :@:<CR>
inoremap <buffer> <silent> <C-@>   <Esc>:@:<CR>
cnoremap <buffer> <silent> <C-@>   <C-e><C-u>@:<CR>

" show highlight group under cursor
map <F10> :echo
\ 'hi<' . synIDattr(synID(line("."),col("."),1),"name") . '> ' .
\ 'trans<' . synIDattr(synID(line("."),col("."),0),"name") . '> ' .
\ 'lo<' . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . '>'
\ <CR>

" smart indent when entering insert mode with i on empty lines
function! IndentWithI()
    if len(getline('.')) == 0
        return "\"_cc"
    else
        return "i"
    endif
endfunction
nnoremap <expr> i IndentWithI()

function! IndentWithA()
    if len(getline('.')) == 0
        return "\"_cc"
    else
        return "a"
    endif
endfunction
nnoremap <expr> a IndentWithA()

" use OS clipboard and copy-paste shortcuts
set clipboard=unnamed
"inoremap <C-v> <Space><ESC>"+gPi<Delete>
inoremap <C-v> <C-r>+
nnoremap <C-v> "+p
vnoremap <C-v> "+p
cnoremap <C-v> <C-r>+
vnoremap <C-c> "+y

" other mappings
nnoremap o o<Esc>
let g:SuperTabDefaultCompletionType='<c-n>' " reverse supertab order

" commenting
let g:NERDDefaultAlign = 'left' " flush left comment delimiters
let g:NERDCommentEmptyLines = 1 " comment empty lines too

" Fortran
let fortran_free_source=1
let fortran_fold=1
let fortran_fold_conditionals=1
let fortran_more_precise=1
let fortran_do_enddo=1

" LaTeX
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_TreatMacViewerAsUNIX=1
let g:Tex_ExecuteUNIXViewerInForeground=1
let g:vimtex_view_general_viewer='SumatraPDF'
let g:tex_comment_nospell=1

" ALE
let g:ale_cursor_detail=1 " show errors in  preveiew window
let g:ale_echo_cursor=0   " don't show errors in status line
let g:ale_echo_msg_format='%s [%linter%]'
let g:ale_sign_column_always=1
let g:ale_sign_error='x'
let g:ale_sign_warning ='!'

" functions
function! SetSignColumn(file_name, is_modifiable)
    if empty(a:file_name) || !a:is_modifiable
        let &signcolumn = 'no'
        let b:gutterwidth = 0
    else
        let &signcolumn = 'yes'
        let b:gutterwidth = 2
    endif
endfunction

" Autocommands
augroup vimrc
    autocmd!
    autocmd CursorHold ?* nested update " autosave
    autocmd BufEnter,Syntax * syn sync minlines=200 maxlines=200
    autocmd BufWinEnter,BufRead,BufWrite *
      \  call SetSignColumn(@%, &modifiable)
    autocmd BufWinEnter,VimResized,TextChanged,TextChangedI,OptionSet *
      \  let &numberwidth = float2nr(log10(line('$'))) + 2
      \| let &textwidth   =
      \    colorcolumnposition - 2 - &numberwidth*&number - b:gutterwidth
      \| let &colorcolumn =
      \    colorcolumnposition - b:gutterwidth - &numberwidth*&number
    autocmd BufWinEnter,BufRead,BufWrite ?* silent! set fileencoding=utf-8
    autocmd BufWinEnter,BufRead,BufWrite *.c  set cindent
    autocmd BufWinEnter,BufRead,BufWrite *.py :Python3Syntax 
    autocmd BufWinEnter,BufRead,BufWrite *.tex
        \ set spell spelllang=en_us,el " spell check only .tex files
augroup END

" Windows only
set guioptions= " no gui
set lines=24 columns=80
set guifont=tewi:h11
"set guifont=Fixedsys:h12
"set linespace=4
"set guifont=Terminal:h9
set guifont=SF_Mono:h10:W600
set linespace=1
