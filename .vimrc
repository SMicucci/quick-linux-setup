syntax enable

set termguicolors
set number
set relativenumber
set autoindent
set ts=2 sts=2 sw=2 et ai si
set wildmenu
set wildmode=full

call plug#begin()
" colorscheme
Plug 'rakr/vim-one'
" autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" sintax
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
call plug#end()

color one
set background=dark
set path+=**
" use :find to open and :b to switch

" ############
" SET FILETYPE
" ############
autocmd BufNewFile,BufRead *.ejs set filetype=html
autocmd BufNewFile,BufRead *.cjs set filetype=javascript


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
