let mapleader = "\<Space>"
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim')

call dein#add('Shougo/vimproc.vim', {
    \ 'build': {
    \     'windows': 'tools\\update-dll-mingw',
    \     'cygwin': 'make -f make_cygwin.mak',
    \     'mac': 'make -f make_mac.mak',
    \     'linux': 'make',
    \     'unix': 'gmake',
    \    },
    \ })

call dein#add('Shougo/neocomplete.vim')
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_complete_select = 0
augroup cpp-path
    autocmd!
    autocmd FileType cpp setlocal path=.,/usr/include,/usr/local/include,/usr/lib/c++/v1
augroup END

call dein#add('Shougo/neomru.vim')

call dein#add('thinca/vim-quickrun')
let g:quickrun_config={'*': {'vsplit': '50'}}
let g:quickrun_config._={'runner': 'vimproc', 
\        "runner/vimproc/updatetime": 10,
\        "outputter/buffer/close_on_empty": 1,
\        "outputter/buffer/split": ": vertical 64sp",
\}
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

call dein#add('Shougo/unite.vim')
nnoremap <silent> <Space>uf :Unite file -auto-resize<CR>
nnoremap <silent> <Space>utf :Unite file -tab -auto-resize<CR>
nnoremap <silent> <Space>ub :Unite buffer -auto-resize<CR>
nnoremap <silent> <Space>utb :Unite buffer -tab -auto-resize<CR>
nnoremap <silent> <Space>um :Unite file_mru -auto-resize<CR>
nnoremap <silent> <Space>utm :Unite file_mru -tab -auto-resize<CR>
nnoremap <silent> <Space>ur :Unite register -auto-resize<CR>
nnoremap <silent> <Space>ug :Unite grep -no-quit<CR>
"Unite-outline Error fix
let g:unite_data_directory = "~/.unite"
let g:unite_abbr_highlight = "Normal"

call dein#add('davidhalter/jedi-vim')
let g:jedi#rename_command = '<Leader>R'
" 補完の最初の項目が選択された状態だと使いにくいためオフにする
let g:jedi#popup_select_first = 0
" docstringは表示しない
autocmd FileType python setlocal completeopt-=preview
let g:jedi#popup_on_dot = 0
"~/.vim/ftplugin/python.vimに.pyenvのsite-packagesパス追加
"python << EOF
"import os
"import sys
"
"home = os.path.expanduser("~")
"path = home+"/.pyenv/versions/2.7/lib/python2.7/site-packages"
"if not path in sys.path:
"    sys.path.insert(0, path)
"EOF

call dein#add('ujihisa/unite-colorscheme')

call dein#add('Shougo/unite-outline')
nnoremap <silent> <Space>uo :Unite outline -auto-resize<CR>

call dein#add('Shougo/vimfiler.vim')
nnoremap <Space>v :VimFiler -split -simple -winwidth=30 -no-quit<CR>
let g:vimfiler_safe_mode_by_default = 0

call dein#add('tpope/vim-surround')

call dein#add('tpope/vim-rails')

call dein#add('LeafCage/yankround.vim')
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)

"set markdown preview in the browser
call dein#add('plasticboy/vim-markdown')
autocmd BufRead,BufNewFile *.{mkd,md} set filetype=markdown
autocmd! FileType markdown hi! def link markdownItalic Normal
autocmd FileType markdown set commentstring=<\!--\ %s\ -->
" for plasticboy/vim-markdown
let g:vim_markdown_no_default_key_mappings = 1
"let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_folding_style_pythonic = 1

"call dein#add('kannokanno/previm')
"
"call dein#add('tyru/open-browser.vim')
"au BufRead, BufNewFile *.md set filetype=markdown
""open browser with md file
"nmap <Space>md :PrevimOpen<CR>

call dein#add('TwitVim')
let twitvim_browser_cmd = 'open' "for Mac
let twitvim_force_ssl = 1
let twitvim_count = 40

call dein#add('kakkyz81/evervim')
let g:evervim_devtoken="S=s273:U=2db87c6:E=15b9b8d54e0:C=15443dc26f0:P=1cd:A=en-devtoken:V=2:H=90b77547db15a4a5090f8c63c59edb9c"
nnoremap <Leader>el :EvervimNotebookList<CR>
nnoremap <Leader>es :EvervimSearchByQuery<Space>
nnoremap <Leader>ec :EvervimCreateNote<CR>
nnoremap <Leader>et :EvervimListTags<CR>

"call dein#add('nathanaelkane/vim-indent-guides')
"let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_guide_size = 1
"let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=red ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

call dein#add('junegunn/vim-easy-align')
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

call dein#add('Yggdroot/indentLine')

"call dein#add('justmao945/vim-clang')

call dein#add('Shougo/neoinclude.vim')
let g:neoinclude_enable_auto_select = 0

call dein#add('ciaranm/inkpot')

"call dein#add('Rip-Rip/clang_complete')
"if !exists('g:neocomplete#force_omni_input_patterns')
"    let g:neocomplete#force_omni_input_patterns = {}
"endif
"let g:neocomplete#force_omni_input_patterns.cpp =
"        \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

call dein#add('slim-template/vim-slim')

call dein#add('kchmck/vim-coffee-script')
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
autocmd FileType coffee    setlocal sw=2 sts=2 ts=2 et

call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')
let g:neosnippet#snippets_directory = '~/.vim/dein/.dein/neosnippets/'

call dein#end()



set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp932
set nocursorline
set nobackup
set undodir=~/.vim/undodir
set clipboard+=autoselect
set clipboard+=unnamed
set scrolloff=8
set number
set ignorecase
set hlsearch
set list listchars=tab:¦.,eol:↩︎
set tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType ruby setl tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType yaml setl tabstop=2 shiftwidth=2 softtabstop=2
set autoindent
autocmd FileType yaml setl noautoindent
set expandtab
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType ruby setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,do
autocmd FileType yaml setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,do
autocmd FileType ruby setl shiftwidth=2
"setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
"autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4

if has("autocmd")
  augroup redhat
    " In text files, always limit the width of text to 78 characters
    autocmd BufRead *.txt set tw=78
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
  augroup END
endif


set foldmethod=indent
set nofoldenable
set t_Co=256

inoremap <silent> jj <ESC>
inoremap <silent> kk <ESC>
vnoremap v $h
nnoremap <S-Left> <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up> <C-w>-<CR>
nnoremap <S-Down> <C-w>+<CR>
nnoremap j gj
nnoremap k gk
"外からコピーしてきたコードを補完させずに貼り付ける
inoremap <C-v> <ESC>"*pi
inoremap { {}<LEFT>
inoremap {<Enter> {}<Left><CR><CR><Up><ESC>dd<Up>o
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap "" "
inoremap ' ''<LEFT>
inoremap '' '
inoremap ` ``<LEFT>
inoremap `` `
inoremap < <><LEFT>
inoremap >>> <LEFT><RIGHT> > 
inoremap << <LEFT><RIGHT> << 
inoremap >> <LEFT><RIGHT> >> 
inoremap <<< <LEFT><RIGHT> < 
inoremap <% <%  %><LEFT><LEFT><LEFT>
inoremap <%= <%=  %><LEFT><LEFT><LEFT>
inoremap => =>
inoremap = <LEFT><RIGHT> = 
inoremap == <LEFT><RIGHT> == 
inoremap === =
inoremap <= <LEFT><RIGHT> <= 
inoremap >= <LEFT><RIGHT> >= 
inoremap += <LEFT><RIGHT> += 
inoremap -= <LEFT><RIGHT> -= 
inoremap *= <LEFT><RIGHT> *= 
inoremap /= <LEFT><RIGHT> /= 
inoremap != <LEFT><RIGHT> != 
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap { {zz
nmap } }zz


colorscheme inkpot


syntax on



