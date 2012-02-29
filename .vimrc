filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/neocomplcache'
Bundle 'Lokaltog/vim-powerline'
Bundle 'thinca/vim-quickrun'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'vim-scripts/Pydiction'
Bundle 'Glench/Vim-Jinja2-Syntax'
Bundle 'nvie/vim-flake8'
Bundle 'Solarized'

filetype plugin indent on

set t_Co=256
syntax on
set background=dark
colorscheme solarized

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags

set fileformats=unix,dos,mac
set encoding=utf-8
set fileencodings=iso-2022-jp,sjis

if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif

set backup
set backupdir=~/.vim/backup

set tabstop=4
set shiftwidth=4
set noexpandtab
set autoindent

set backspace=indent,eol,start

set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>

let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_underbar_completion = 1

nnoremap <silent> ,b :<C-u>Unite buffer<CR>
nnoremap <silent> ,f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,r :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,m :<C-u>Unite file_mru<CR>
nnoremap <silent> ,a :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

set laststatus=2

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 4
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
hi IndentGuidesEven ctermbg = 234

let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict'

autocmd BufWritePost *.py call Flake8()
