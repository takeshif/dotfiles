"--------------------
"" 基本的な設定
"--------------------

" 色付け
syntax on

"新しい行のインデントを現在行と同じにする
set autoindent
 
"バックアップファイルのディレクトリを指定する
"set backupdir=$HOME/vimbackup
 
"クリップボードをWindowsと連携する
set clipboard=unnamed

"vi互換をオフする
set nocompatible

"スワップファイル用のディレクトリを指定する
"set directory=$HOME/vimbackup

"タブの代わりに空白文字を指定する
set expandtab

"変更中のファイルでも、保存しないで他のファイルを表示する
set hidden

"インクリメンタルサーチを行う
set incsearch

"行番号を表示する
set number

"閉括弧が入力された時、対応する括弧を強調する
set showmatch

"新しい行を作った時に高度な自動インデントを行う
set smarttab

" ruler
set ruler

" カーソルがある行を行を強調表示
set cursorline

" カーソルがある桁を強調表示
set cursorcolumn

" grep検索を設定する
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh

" 検索結果のハイライトをEsc連打でクリアする
nnoremap <ESC><ESC> :nohlsearch<CR>

"----------------------------------------
" パッケージ管理
" --------------------------------------
"dein Scripts-----------------------------
if &compatible
set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=/Users/mac05/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('/Users/mac05/.vim/dein'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('fatih/vim-go')
call dein#add('miyakogi/livemark.vim')
call dein#add('kannokanno/previm')
call dein#add('thinca/vim-quickrun')
call dein#add('kmnk/vim-unite-giti.git')
call dein#add('Shougo/unite.vim')
call dein#add('ujihisa/unite-colorscheme')
call dein#add('justinmk/vim-dirvish')
call dein#add('Shougo/vimfiler')
call dein#add('cohama/agit.vim')
call dein#add('tyru/open-browser.vim')
call dein#add('tyru/open-browser-github.vim')
call dein#add('dhruvasagar/vim-table-mode')
" call dein#add('itchyny/lightvim.vim')
call dein#add('kien/ctrlp.vim')
call dein#add('Shougo/neocomplete.vim')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('mrtazz/simplenote.vim')

" You can specify revision/branch/tag.
call dein#add('Shougo/vimshell', { 'rev': '3787e5' })
call dein#add('kakkyz81/evervim')
call dein#add('plasticboy/vim-markdown')
call dein#add('itchyny/lightline.vim')
call dein#add('tpope/vim-rails')
call dein#add('tpope/vim-fugitive')
call dein#add('Shougo/neomru.vim')
call dein#add('mattn/webapi-vim')
call dein#add('mattn/vimplenote-vim')
call dein#add('kovisoft/slimv')
call dein#add('glidenote/memolist.vim')
call dein#add('sjl/badwolf')
call dein#add('Shougo/unite-outline')
call dein#add('Shougo/vimproc', { 'build': { 'mac': 'make -f make_mac.mak', 'unix': 'make -f make_unix.mak', },})
call dein#add('scrooloose/nerdtree')
call dein#add('scrooloose/vim-slumlord')
call dein#add('aklt/plantuml-syntax')
call dein#add('farseer90718/vim-taskwarrior')
call dein#add('davidhalter/jedi-vim')
call dein#add('rking/ag.vim')
call dein#add('suan/vim-instant-markdown')
call dein#add('dhruvasagar/vim-table-mode')
call dein#add('wlangstroth/vim-racket')
call dein#add('aharisu/vim_goshrepl')
call dein#add('aharisu/vim-gdev')

" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------

" previm
augroup PrevimSettings
        autocmd!
        autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

let g:previm_open_cmd = 'open -a Safari'

" preivimでヘッダを隠す
let g:previm_show_header = 0

colorscheme molokai

" vimfiler
" Use vimfiler instead of default filer.
let g:vimfiler_as_default_explorer = 1
" " Open filer
noremap <silent> :tree :VimFiler -split -simple -winwidth=45 -no-quit
noremap <C-X><C-T> :VimFiler -split -simple -winwidth=45 -no-quit<ENTER>
" " Don't let <CR> enter the directory but let it open the directory
autocmd FileType vimfiler nmap <buffer> <CR> <Plug>(vimfiler_expand_or_edit)
" " Automatically open vimfiler on start
" "autocmd VimEnter * VimFilerExplorer
" " If no files are specified, open vimfiler
" "autocmd VimEnter * if !argc() | VimFiler | endif

" open-browser-github
nnoremap go :<C-u>OpenGithubFile<CR>
xnoremap go :OpenGithubFile<CR>

" vim-tableモード
let g:table_mode_corner = "|"

" rsense
" .や::を入力したときにオムニ補完が有効にする
if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplet#force_omni_input_patterns = {}
endif
"let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

" 環境変数RSENSE_HOMEに'/usr/local/bin/rsense'を指定しても動く
let g:neocomplete#sources#rsense#home_directory = '/usr/local/bin/rsense'

" gosh用
"let g:neocomplete#keyword_patterns['gosh-repl'] = '[[:alpha:]+*/@$_=.!?-][[:alnum:]+*/@$_:=.!?-]*'

" evervim
"let g:evervim_devtoken='S=s57:U=615767:E=15cc7f69d9c:C=155704570d8:P=1cd:A=en-devtoken:V=2:H=1c9cb3a05581836dd28e7df6d1d890bc'

" ctrlP
" vim終了時にキャッシュクリアしない(default:1)
let g:ctrlp_clear_cache_on_exit = 0

" " 検索ウィンドウの設定
" " :help g:ctrlp_match_window
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:50'

" バックアップファイルを作らない
:set nobackup

au BufRead,BufNewFile *.md set filetype=markdown

set shiftwidth=2

" Markdown用
" 直下の行頭にアスタリスク＋半角スペースを入れる
nnoremap <Leader>rh o<ESC>I*
" リスト行の直下にアスタリスク＋半角スペースを入れる
nnoremap <Leader>ri A<CR>
" 一段深くインデントしてからアスタリスク＋半角スペースを入れる
nnoremap <Leader>rt A<CR><ESC>I<TAB><ESC>A

" 日付挿入
inoremap <expr> ,df strftime('%Y-%m-%d %H:%M')
inoremap <expr> ,dd strftime('%Y-%m-%d')
inoremap <expr> ,dt strftime('%H:%M')
let weeks = [ "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" ]
let wday = strftime("%w")
inoremap <expr> ,ds strftime('%Y-%m-%d ').weeks[wday]

" バッファ一覧
noremap <C-b> :Unite buffer<CR>

" 最近使ったファイル一覧
noremap <C-z> :Unite file_mru<CR>

" ファイル一覧
noremap <C-n> :Unite -buffer-name=file file<CR>

" unite-outline
nnoremap <silent> tr :<C-u>Unite -no-quit -vertical -winwidth=40 outline<CR>

" unite-outline の自動更新
let g:unite_source_outline_filetype_options = {
      \ '*': {
      \   'auto_update': 1,
      \   'auto_update_event': 'write',
      \ },
      \ 'cpp': {
      \   'ignore_types': ['enum', 'typedef', 'macro'],
      \ },
      \ 'javascript': {
      \   'ignore_types': ['comment'],
      \ },
      \ 'markdown': {
      \   'auto_update_event': 'hold',
      \ },
      \}

" 挿入モードでもカーソル移動ができるようにする
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

" grep検索
"nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> ,g  :<C-u>Unite grep<CR>

" unite grepにhw(highway)を使う
if executable('hw')
  let g:unite_source_grep_command = 'hw'
  let g:unite_source_grep_default_opts = '--no-group --no-color'
  let g:unite_source_grep_recursive_opt = ''
endif

" simplenote用
let g:SimplenoteUsername = "jinko.tatu@gmail.com"
let g:SimplenotePassword = "jinkojinkojinko"

" quickrun
"let g:quickrun_config = {'*': {'hock/time/enable': '1'},}

map \ <leader>
"noremap <Leader>qn :SimplenoteNew<CR>
"noremap <Leader>ql :SimplenoteList<CR>

" マッピング
"" Simplenote
nnoremap gsn :SimplenoteNew<CR>
nnoremap gst :SimplenoteTag<CR>
nnoremap gsu :SimplenoteUpdate<CR>
nnoremap gsl :SimplenoteList<CR>

"" 新規バッファandその画面だけにする
nnoremap gno :new<CR>:on<CR>

" g Ctrl+A で全選択
nnoremap g<C-a> ggVG

" memolist
nnoremap <Leader>md  :MemoNew<CR>
nnoremap <Leader>ml  :MemoList<CR>
nnoremap <Leader>mg  :MemoGrep<CR>

let g:memolist_path = "/Users/mac05/Dropbox/memolist"

" suffix type (default markdown)
let g:memolist_memo_suffix = "markdown"
let g:memolist_memo_suffix = "txt"

" date format (default %Y-%m-%d %H:%M)
let g:memolist_memo_date = "%Y-%m-%d %H:%M"
let g:memolist_memo_date = "epoch"
let g:memolist_memo_date = "%D %T"

" tags prompt (default 0)
let g:memolist_prompt_tags = 1

" categories prompt (default 0)
let g:memolist_prompt_categories = 1

" use qfixgrep (default 0)
let g:memolist_qfixgrep = 0

" use vimfler (default 0)
let g:memolist_vimfiler = 1

" remove filename prefix (default 0)
let g:memolist_filename_prefix_none = 1

" use unite (default 0)
let g:memolist_unite = 1
let g:memolist_unite_source = "file_rec"
let g:memolist_unite_option = "-start-insert"

" use arbitrary unite source (default is 'file')
let g:memolist_unite_source = "file_rec"

" use arbitrary unite option (default is empty)
let g:memolist_unite_option = "-auto-preview -start-insert"

" use denite (default 0)
let g:memolist_denite = 1

" use arbitrary denite source (default is 'file_rec')
let g:memolist_denite_source = "anything"

" use arbitrary denite option (default is empty)
let g:memolist_denite_option = "anything"

" use various Ex commands (default '')
let g:memolist_ex_cmd = 'CtrlP'
let g:memolist_ex_cmd = 'NERDTree'

" use delimiter of array in yaml front matter (default is ' ')
let g:memolist_delimiter_yaml_array = ','

" use when get items from yaml front matter
" first line string pattern of yaml front matter (default "==========")
let g:memolist_delimiter_yaml_start = "---"

" last line string pattern of yaml front matter (default "- - -")
let g:memolist_delimiter_yaml_end  = "---"

" color scheme
"colorscheme badwolf
"highlight Normal ctermbg=none

set backupskip=/tmp/*,/private/tmp/*

let g:table_mode_corner = '|'

" controlキーとeを押すことNERDTreeコマンドのショートカットキーとして作動する
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" Anywhere SID.
function! s:SID_PREFIX()
    return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()  "{{{
    let s = ''
    for i in range(1, tabpagenr('$'))
        let bufnrs = tabpagebuflist(i)
        let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
        let no = i  " display 0-origin tabpagenr.
        let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
        let title = fnamemodify(bufname(bufnr), ':t')
        let title = '[' . title . ']'
        let s .= '%'.i.'T'
        let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
        let s .= no . ':' . title
        let s .= mod
        let s .= '%#TabLineFill# '
    endfor
    let s .= '%#TabLineFill#%T%=%#TabLine#'
    return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 " 常にタブラインを表示

" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]

" Tab jump
for n in range(1, 9)
    execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor

" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ
map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tc 新しいタブを一番右に作る
map <silent> [Tag]x :tabclose<CR>
" tx タブを閉じる
map <silent> [Tag]n :tabnext<CR>
" tn 次のタブ
map <silent> [Tag]p :tabprevious<CR>
" tp 前のタブ

