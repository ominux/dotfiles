let mapleader = "\<Space>"
if &compatible
  set nocompatible
endif
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

call dein#add('Shougo/neomru.vim')

call dein#add('thinca/vim-quickrun')
let g:quickrun_config={'*': {'vsplit': '50'}}
let g:quickrun_config._={'runner': 'vimproc', 
\		"runner/vimproc/updatetime": 10,
\		"outputter/buffer/close_on_empty": 1,
\		"outputter/buffer/split": ": vertical 64sp",
\}

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
"ftpluginに.pyenvのsite-packagesパス追加
"python << EOF
"import os
"import sys
"
"home = os.path.expanduser("~")
"path = home+"/.pyenv/versions/2.7/lib/python2.7/site-packages"
"if not path in sys.path:
"	sys.path.insert(0, path)
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

call dein#add('TwitVim')
let twitvim_browser_cmd = 'open' "for Mac
let twitvim_force_ssl = 1
let twitvim_count = 40

call dein#end()



set cursorline
set nobackup
set noundofile
set clipboard+=autoselect
set clipboard+=unnamed
set scrolloff=8
set number
set ignorecase
set list listchars=tab:¦.,eol:↩︎
set tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType ruby setl tabstop=2 shiftwidth=2 softtabstop=2
set autoindent
set noexpandtab
autocmd FileType ruby setl expandtab
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType ruby setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,do
autocmd FileType ruby setl shiftwidth=2
"setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
"autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4
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
inoremap {<Enter> {}<Left><CR><CR><C-h><Up><ESC><S-a>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap "" "
inoremap ' ''<LEFT>
inoremap ` ``<LEFT>
inoremap < <><LEFT>
inoremap << <<
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


colorscheme cabin


syntax on
















"
"
"
"
"
"
""neobundle setting
"set runtimepath+=~/.vim/bundle/neobundle.vim/
"call neobundle#begin(expand('~/.vim/bundle/'))
"
"NeoBundleFetch 'shougo/neobundle.vim'
"NeoBundle 'Shougo/vimproc.vim', {
"		\ 'build' : {
"		\				'mac' : 'make -f make_mac.mak'
"		\			}
"		\}
"NeoBundle 'thinca/vim-quickrun'
"let g:quickrun_config={'*': {'vsplit': '50'}}
""openGL, vim-quickrun
"""let g:quickrun_config.c={
"""\		'cmdopt': '-framework GLUT -framework OpenGL'
"""\}
"let g:quickrun_config._={'runner': 'vimproc', 
"\		"runner/vimproc/updatetime": 10,
"\		"outputter/buffer/close_on_empty": 1,
"\		"outputter/buffer/split": ": vertical 64sp",
"\}
"
"NeoBundle 'Shougo/unite.vim'
""Unite ailias
"nnoremap <silent> <Space>uf :Unite file -auto-resize -auto-preview<CR>
"nnoremap <silent> <Space>utf :Unite file -tab -auto-resize -auto-preview<CR>
"nnoremap <silent> <Space>ub :Unite buffer -auto-resize -auto-preview<CR>
"nnoremap <silent> <Space>utb :Unite buffer -tab -auto-resize -auto-preview<CR>
"nnoremap <silent> <Space>um :Unite file_mru -auto-resize<CR>
"nnoremap <silent> <Space>utm :Unite file_mru -tab -auto-resize<CR>
"nnoremap <silent> <Space>ur :Unite register -auto-resize<CR>
"nnoremap <silent> <Space>ug :Unite grep -no-quit<CR>
""Unite-outline Error fix
"let g:unite_data_directory = "~/.unite"
"let g:unite_abbr_highlight = "Normal"
"
"NeoBundle 'davidhalter/jedi-vim'
"let g:jedi#rename_command = '<Leader>R'
"" 補完の最初の項目が選択された状態だと使いにくいためオフにする
"let g:jedi#popup_select_first = 0
"" docstringは表示しない
"autocmd FileType python setlocal completeopt-=preview
"let g:jedi#popup_on_dot = 0
"
"NeoBundle 'Shougo/neomru.vim' " MRU plugin includes unite.vim MRU sources
"NeoBundle 'ujihisa/unite-colorscheme'
"NeoBundle 'Shougo/unite-outline' " outline source for unite.vim
"nnoremap <silent> <Space>uo :Unite outline -auto-resize<CR>
"NeoBundle 'Shougo/vimfiler.vim' " :file_folder: Powerful file explorer implemented by Vim script
"nnoremap <Space>v :VimFiler -split -simple -winwidth=30 -no-quit<CR>
"let g:vimfiler_safe_mode_by_default = 0
"NeoBundle 'tpope/vim-surround' " surround.vim: quoting/parenthesizing made simple
"NeoBundle 'tpope/vim-rails' " rails.vim: Ruby on Rails power tools
"NeoBundle 'Shougo/neocomplete.vim' " Next generation completion framework after neocomplcache
"let g:neocomplete#enable_at_startup = 1
""autocmd FileType python setlocal omnifunc=jedi#completions
"""let g:jedi#popup_select_first=0
""let g:jedi#completions_enabled = 0
""let g:jedi#auto_vim_configuration = 0
""let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
"NeoBundle 'marcus/rsense', {
"\	'autoload': {
"\		'filetypes': 'ruby',
"\	},
"\}
"let g:rsenseHome = "/usr/local/Cellar/rsense/0.3/libexec/"
"let g:rsenseUseOmniFunc = 1
"
"NeoBundle 'LeafCage/yankround.vim' " logging registers and reusing them.
"nmap p <Plug>(yankround-p)
"nmap P <Plug>(yankround-P)
"nmap gp <Plug>(yankround-gp)
"nmap gP <Plug>(yankround-gP)
"nmap <C-p> <Plug>(yankround-prev)
"nmap <C-n> <Plug>(yankround-next)
"NeoBundle 'kana/vim-textobj-user' " Vim plugin: Create your own text objects
"call neobundle#end()
