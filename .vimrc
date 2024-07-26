syntax enable

call plug#begin()
" colorscheme
Plug 'rakr/vim-one'
" autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" sintax
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'vim-python/python-syntax'
Plug 'OmniSharp/omnisharp-vim'
Plug 'sheerun/vim-polyglot'
call plug#end()

color one
" #######
" SETTING
" #######
" background dark, noexpandtab, mousehide, number, ruler, shiftwidth, smartindent, tabspace, termguicolor, wildmenu, wildmode
set bg=dark noet mh nu ru sw=4 si ts=4 tgc wmnu wim=full
" based on filetype
autocmd FileType html,css setlocal sw=2 ts=2
autocmd FileType C setlocal sw=8 ts=8
set path+=**
" use :find to open and :b to switch

" ############
" SET FILETYPE
" ############
autocmd BufNewFile,BufRead *.ejs set filetype=html
autocmd BufNewFile,BufRead *.cjs set filetype=javascript
autocmd BufNewFile,BufRead *.cshtml set filetype=html

" #######
" COMMAND
" #######
command Rendermd :vert ter++close grip -b %

" ##############
" CUSTOM MAPPING
" ##############

" set CTRL+\ as Esc in insert mode
ino <C-Bslash> <ESC>
" set CTRL+n for next (CoC)
ino <expr> <c-n> coc#pum#visible() ? coc#pum#next(1) : "\<c-n>"
" CTRL+p for previous (CoC)
ino <expr> <c-p> coc#pum#visible() ? coc#pum#prev(1) : "\<c-p>"
" Enter to accept (CoC)
ino <expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" start flutter (vim-flutter)
nn <leader>fa :FlutterRun<cr>
" reload flutter (vim-flutter)
nn <leader>fr :FlutterHotReload<cr>
" restart flutter (vim-flutter)
nn <leader>fR :FlutterHotRestart<cr>
" quit flutter (vim-flutter)
nn <leader>fq :FlutterQuit<cr>
