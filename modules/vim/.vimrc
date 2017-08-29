set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'valloric/youcompleteme'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'kien/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'mileszs/ack.vim'
Plug 'cohama/agit.vim'
Plug 'flazz/vim-colorschemes'
Plug 'danro/rename.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'mhinz/vim-startify'
Plug 'embear/vim-localvimrc'
Plug 'brooth/far.vim'
Plug 'wincent/scalpel'
Plug 'vimwiki/vimwiki'
Plug 'bling/vim-airline'

"Ruby
Plug 'tpope/vim-bundler', { 'for': 'ruby'  }
Plug 'tpope/vim-rails', { 'for': 'ruby'  }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby'  }

"JavaScript
Plug 'pangloss/vim-javascript', { 'for': 'javascript'  }
Plug 'mxw/vim-jsx', { 'for': 'javascript'  }
Plug 'jelera/vim-javascript-syntax' , { 'for': 'javascript'  }
Plug 'gavocanov/vim-js-indent', { 'for': 'javascript'  }
Plug 'othree/yajs.vim', { 'for': 'javascript'  }
Plug 'othree/es.next.syntax.vim', { 'for': 'javascript'  }
Plug 'maksimr/vim-jsbeautify', { 'for': 'javascript'  }
Plug 'sickill/vim-pasta', { 'for': 'javascript'  }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'for': 'javascript'  }
Plug 'nathanaelkane/vim-indent-guides'
Plug 'chiel92/vim-autoformat', { 'for': ['javascript', 'css', 'scss']  }

"HTML
Plug 'gregsexton/MatchTag', { 'for': ['html', 'javascript']  }
Plug 'mattn/emmet-vim', { 'for': ['html', 'javascript']  }
Plug 'othree/html5.vim', { 'for': ['html', 'javascript']  }
Plug 'tpope/vim-haml', { 'for': 'haml' }
"CSS/LESS/Stylus/SCSS
Plug 'ap/vim-css-color', { 'for': ['css', 'scss', 'sass', 'less', 'stylus']  }
Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss', 'sass']  }
Plug 'groenewege/vim-less', { 'for': 'less'  }
Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'scss']  }
Plug 'wavded/vim-stylus', { 'for': 'stylus'  }"

"collor chemas"
Plug 'morhetz/gruvbox'
Plug 'dracula/vim'
Plug 'crusoexia/vim-monokai'

call plug#end()

syntax on

let g:jsx_ext_required = 0
set autoread
set autowriteall
autocmd BufLeave,FocusLost * silent! wall

let g:formatterpath = ['standard --fix']
noremap <F3> :Autoformat<CR>
autocmd FileType js, scss, css BufWrite * if  | :Autoformat
autocmd FileType js, scss, css let g:autoformat_autoindent = 1
autocmd FileType js, scss, css let g:autoformat_retab = 1
autocmd FileType js, scss, css let g:autoformat_remove_trailing_spaces = 1
set nocompatible

colorscheme onedark

let g:solarized_termcolors=256
let g:mapleader=','
set background=dark
set number
set expandtab
set tabstop=2
set shiftwidth=2
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<
set list
set backupcopy=yes
" set foldmethod=syntax
set undofile
set undodir=~/.vim/undodir

set hlsearch
set incsearch

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
"hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=black

" NERDTree
map <C-n> :NERDTreeToggle<CR>
map <Leader> <Plug>(easymotion-prefix)
nmap ,n :NERDTreeFind<CR>
autocmd VimEnter * NERDTree
autocmd vimenter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

" Tags
set tags=./tags;/
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"Aliases
command! Fjs ! standard-format --fix -w %

"Find and Replace
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_map = '<c-f>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40

let g:rg_highlight=1

let g:ScalpelCommand='S'

"System
set directory=~/.vim/swapfiles/
set backupdir=~/.vim/backups/

let g:localvimrc_file = '.vimrc'

set clipboard=unnamedplus

"Tabs -> buffers
set modifiable


"Git


"Statu bar
let g:airline#extensions#tabline#enabled = 1

