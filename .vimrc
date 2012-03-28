" dir
" ~/.vim
"   |-- after
"   |-- backup
"   `-- bundle

"---------------------------------------------------------------------------
" vundle
" $ git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
"

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" common
Bundle 'gmarik/vundle'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/neocomplcache'
Bundle 'Lokaltog/vim-powerline'
Bundle 'thinca/vim-quickrun'
Bundle 'vim-scripts/YankRing.vim'
" colorscheme
Bundle 'molokai'
Bundle 'Solarized'
" python
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'vim-scripts/python.vim'
Bundle 'vim-scripts/Pydiction'
Bundle 'Glench/Vim-Jinja2-Syntax'
Bundle 'nvie/vim-flake8'

filetype plugin indent on

"---------------------------------------------------------------------------
" colorscheme
"

set t_Co=256
syntax on
"set background=dark
colorscheme molokai

"---------------------------------------------------------------------------
" file
"

" complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags

" encoding
set fileformats=unix,dos,mac
set encoding=utf-8
set fileencodings=iso-2022-jp,sjis

" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif

" □とか○の文字があってもカーソル位置がずれないようにする
set ambiwidth=double

" backup
set backup
set backupdir=~/.vim/backup

" WhitespaceEOL
highlight WhitespaceEOL ctermbg=gray guibg=gray
match WhitespaceEOL /\s\+$/

" buffer
set hidden

"---------------------------------------------------------------------------
" motion
"

" tab & indent
set tabstop=4
set shiftwidth=4
set noexpandtab
set autoindent

" cmd
set showcmd

" BS
set backspace=indent,eol,start

" search highlight
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" repeated indent
vnoremap <silent> > >gv
vnoremap <silent> < <gv

"---------------------------------------------------------------------------
" plugin
"

let g:neocomplcache_enable_at_startup = 1
" neocomplecache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_underbar_completion = 1

" unite
nnoremap <silent> ,b :<C-u>Unite buffer<CR>
nnoremap <silent> ,f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,r :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,m :<C-u>Unite file_mru<CR>
nnoremap <silent> ,a :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

let g:unite_source_history_yank_enable = 1
nnoremap <silent> ,y :<C-u>Unite history/yank<CR>

" vim-powerline
set laststatus=2
"let g:Powerline_symbols = 'fancy'

" YankRing.vim
set viminfo+=!
let g:yankring_manual_clipboard_check = 0
let g:yankring_history_dir = '~/.vim'

" vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 4
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
"hi IndentGuidesOdd ctermbg = black
hi IndentGuidesEven ctermbg = 234

" Pydiction
let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict'

" vim-flake8
autocmd BufWritePost *.py call Flake8()
