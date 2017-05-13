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

"Ruby
Plug 'tpope/vim-bundler', { 'for': 'ruby'  }
Plug 'tpope/vim-rails', { 'for': 'ruby'  }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby'  }
"JavaScript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'jelera/vim-javascript-syntax' 
Plug 'gavocanov/vim-js-indent'
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'maksimr/vim-jsbeautify'
Plug 'sickill/vim-pasta'
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

colorscheme onedark 

let g:solarized_termcolors=256
let g:mapleader=','
set background=dark
set number
set expandtab
set tabstop=2
set shiftwidth=2
" set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:.
" set list
set backupcopy=yes
" set foldmethod=syntax

" autocmd bufwritepost *.js silent !standard --fix %
" set autoread

set hlsearch
set incsearch

hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

"mappings

map <C-n> :NERDTreeToggle<CR>
map <Leader> <Plug>(easymotion-prefix)


"Aliases

command Ff ! standard-format --fix -w %
