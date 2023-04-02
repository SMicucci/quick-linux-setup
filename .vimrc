syntax enable

set termguicolors
set number
set relativenumber
set tabstop=8
set shiftwidth=8
set autoindent
set wildmenu
set wildmode=full

call plug#begin()
Plug 'rakr/vim-one'
call plug#end()
color one
set background=dark

"	default vim (by a video)

" use :find to open and :b to switch
set path+=**
" Ctrl + [ to jump tag, add g for ambiguoug, Ctrl + t to jump back
" Ctrl+x Ctrl+n JUST this file, Ctrl+x Ctrl+f filenames, Ctrl+x Ctrl+] for
set omnifunc=syntaxcomplete#Complete
autocmd Filetype c set omnifunc=ccomplete#Complete
autocmd Filetype python set omnifunc=pytoncomplete#Complete
"tags, Ctrl+n and Ctrl+p to scroll in the suggestion
command! MakeTags !ctags -R

