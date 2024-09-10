" Basic settings {{{
lan en_US.ISO8859-1
let mapleader = " " 
let maplocalleader = "\\"
syntax on
set hlsearch
set incsearch
set nocompatible "便利な機能を使えるようにする
filetype plugin indent on
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4 "自動インデントに使われるスペースの数
set backspace=2
set number "行番号を出す
set foldlevelstart=0 "バッファの編集を始めた時点でのfoldlevelを設定する。0だとすべてのfoldsがclose。99だとすべてのfoldsがopen。foldlevelが高いほどcloseしているfoldsが少なくなっていく。これを設定しなくてもfoldlevelオプションがdefaultで0なので挙動は変わらない。また、foldlevelstartはBufReadPre autocommandsの前に設定されるので、BufReadPreを使って任意のファイルタイプでの挙動を上書きができる。
colorscheme slate
" }}}
" StatusLine settings {{{
set statusline=%f%=\ FileType:\ %y\ CurrentLine:\ %3.l/%3.L laststatus=2 " ステータスラインのフォーマットを変えて、常にステータス員が表示されるようにする
" }}}
" Mapping settings {{{
inoremap jk <esc>
" Visualモードで単語を大文字にする
inoremap <c-u> <esc>vawUei
" Normalモードで単語を大文字にする
nnoremap <c-u> vawUe<esc>
" .vimrcファイルを縦にWindowを分割して表示する
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
" alternate bufferを現在ウインドウの右側に縦分割で開くalternate buffer
" vertical
nnoremap <leader>abv :execute "rightbelow vsplit " .. bufname('#')<CR>
" .vimrcファイルを現在のプロセスで読み込む
nnoremap <leader>sv :source $MYVIMRC<CR>
" 分割されたウィンドウを上に移動する
nnoremap sk <c-w>k
" 分割されたウィンドウを下に移動する
nnoremap sj <c-w>j
" 分割されたウィンドウを右に移動する
nnoremap sl <c-w>l
" 分割されたウィンドウを左に移動する
nnoremap sh <c-w>h
" Visualモードで選択していた範囲をdouble quoteで囲む
vnoremap "" <esc>`<i"<esc>`>a"<esc>
" 現在行の先頭に移動する
nnoremap H ^
" 現在行の末尾に移動する
nnoremap L $

" 1コマンドで2行消すが、undolevelsを設定することで、undo blockを新たに作り、undoするのは1行ずつにする
nnoremap <leader>d dd:let &g:undolevels = &g:undolevels<cr>dd

" 2個以上連続するスペースをハイライトする。
nnoremap <leader>w :match DiffDelete /\v\s{2,}/<cr>
" 2個以上連続するスペースをハイライトする。という設定を無効にする。
nnoremap <leader>W :match none<cr>
" /と?で検索するときに自動的に\vを挿入してvery magic検索をする。
nnoremap / /\v
nnoremap ? ?\v
" 最後に検索したitemのハイライトを止める。
nnoremap nhl :nohlsearch<cr>


" ウィンドウ間の移動を無効にする
nnoremap <c-w>k <nop>
nnoremap <c-w>j <nop>
nnoremap <c-w>l <nop>
nnoremap <c-w>h <nop>

onoremap <leader>in( :<c-u>normal! f(vi(<cr>
onoremap <leader>an( :<c-u>normal! f(va(<cr> 
onoremap <leader>al( :<c-u>normal! F(va(<cr>
onoremap <leader>in{ :<c-u>normal! f{vi{<cr>
onoremap <leader>an{ :<c-u>normal! f{va{<cr>
onoremap <leader>il{ :<c-u>normal! F{va{<cr>
onoremap <leader>al{ :<c-u>normal! F{va{<cr>

onoremap in@ :execute "normal! /[[:alnum:]\\._-]\\+@[[:alnum:]\\.]\\+\rvt@"<cr>
" }}}
" FileType-specific settings {{{
" Vimscript file settings {{{
augroup filetype_vim
    autocmd!
    autocmd Filetype vim setlocal foldmethod=marker
augroup END
" }}}
" Markdown file settings {{{
augroup filetype_markdown
    autocmd!
    autocmd FileType markdown onoremap ih :execute "normal! ?^[=-]\\{2,}$\r:nohlsearch\rkvg_"<cr>
    autocmd FileType markdown onoremap ah :execute "normal! ?^[=-]\\{2,}$\r:nohlsearch\rg_vk0"<cr>
augroup END
" }}}
" Javascript file settings {{{
augroup filetype_javascript
    autocmd!
    autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
augroup END
" }}}
" Python file settings {{{
augroup py_type
    autocmd!
    autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
    autocmd FileType python iabbrev <buffer> iff if:<left>
augroup END    
" }}}
" }}}
