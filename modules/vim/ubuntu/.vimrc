set nocompatible              " be iMproved, required
filetype off                  " required

let js_typechecker_stdio=["node", "/home/sl/install/javascript-typescript-langserver/lib/language-server-stdio"]
let js_typechecker_tcp=['tcp://127.0.0.1:2089']

call plug#begin()

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'valloric/youcompleteme'

Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
let g:deoplete#enable_at_startup = 1

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'mileszs/ack.vim'
Plug 'cohama/agit.vim'
Plug 'flazz/vim-colorschemes'
Plug 'danro/rename.vim'
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'
Plug 'mhinz/vim-startify'
Plug 'jremmen/vim-ripgrep'
Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'
Plug 'eparreno/vim-l9'
Plug 'vim-scripts/FuzzyFinder'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'jlanzarotta/bufexplorer'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-commentary'

" Plug 'w0rp/ale'
" Plug 'chrisbra/NrrwRgn'
" Plug 'VincentCordobes/vim-translate'

" Plug 'joe-skb7/cscope-maps'
" Plug 'majutsushi/tagbar'
" Plug 'vim-syntastic/syntastic'

" Plug 'w0rp/ale'
" let ale_fixers=['trim_whitespace']
" let vim_linter=['vint']
" let js_fixers=['eslint']
" let ts_fixers=['prettier', 'tslint']
" let b:ale_linters = {
"   \'javascript': ['eslint'],
"   \'javascript.jsx': ['eslint'],
"   \'typescript': ['tslint'],
"   \'typescript.tsx': ['tslint'],
"   \'html': ['tidy'],
"   \'vim': vim_linter
" \}
" let b:ale_fixers = {
"   \'*': ale_fixers,
"   \'vim': ale_fixers,
"   \'javascript.jsx': js_fixers,
"   \'typescript': ts_fixers,
"   \'typescript.tsx': ts_fixers,
" \}
" let g:ale_completion_enabled = 1
" let g:airline#extensions#ale#enabled = 1
" let g:ale_set_balloons=1
" let g:ale_lint_delay=0
" " nnoremap <silent> gr :ALEFindReferences<CR>
" " nnoremap <silent> gd :ALEGoToDefinitionInVSplit<CR>
" " nnoremap <silent> gD :ALEDocumentation<CR>
" " nnoremap <silent> gh :ALEHover<CR>
" set mouse=a
" set ttymouse=xterm

" Plug 'chrisbra/NrrwRgn'

"Translation
  Plug 'echuraev/translate-shell.vim', { 'do': 'wget -O ~/.vim/trans git.io/trans && chmod +x ~/.vim/trans' }
  let g:trans_bin = "~/.vim"
  vnoremap <silent> <leader>t :Trans<CR>
  vnoremap <silent> <leader>td :TransSelectDirection<CR>

  Plug 'joe-skb7/cscope-maps'
  Plug 'majutsushi/tagbar'

"JavaScript
  Plug 'othree/yajs.vim' , { 'for': 'javascript'  }
  Plug 'mxw/vim-jsx' , { 'for': 'javascript'  }
  Plug 'jelera/vim-javascript-syntax' , { 'for': 'javascript'  }
  Plug 'othree/javascript-libraries-syntax.vim' , { 'for': 'javascript'  }
  Plug 'othree/es.next.syntax.vim', { 'for': 'javascript'  }
  " Plug 'Chiel92/vim-autoformat'
  Plug 'maksimr/vim-jsbeautify', { 'for': 'javascript'  }
  Plug 'sickill/vim-pasta', { 'for': 'javascript'  }
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'for': 'javascript'  }
  Plug 'herringtondarkholme/yats.vim'

  Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
  set hidden
  set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()

  let g:LanguageClient_serverCommands = {
    \ 'javascript': js_typechecker_tcp,
    \ 'javascript.jsx': js_typechecker_tcp,
    \ 'typescript': js_typechecker_tcp,
    \ 'typescript.tsx': js_typechecker_tcp
  \ }
  nnoremap <F5> :call LanguageClient_contextMenu()<CR>
  " " Or map each action separately
  nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
  nnoremap <silent> gd :call LanguageClient#textDocument_definition({'gotoCmd': 'vsplit'})<CR>
  nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

"HTML
  Plug 'tpope/vim-haml', { 'for': 'haml' }

"CSS/LESS/Stylus/SCSS
  Plug 'ap/vim-css-color', { 'for': ['css', 'scss', 'sass', 'less', 'stylus']  }
  Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss', 'sass']  }
  Plug 'groenewege/vim-less', { 'for': 'less'  }
  Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'scss']  }
  Plug 'wavded/vim-stylus', { 'for': 'stylus'  }"

"collor chemas"
  Plug 'morhetz/gruvbox'

" Track the engine.
  Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
  Plug 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

call plug#end()

filetype plugin indent on
syntax on

let g:jsx_ext_required = 0
let g:used_javascript_libs = 'underscore,jquery,react,chai,handlebars'

"System
set autoread

colorscheme onedark
set encoding=utf-8

let g:solarized_termcolors=256
let g:mapleader=' '
inoremap jj <Esc>
set background=dark
set number
set expandtab
set tabstop=2
set shiftwidth=2
set listchars=eol:¬,tab:>-,trail:~,extends:>,precedes:<,space:·
set list
set backupcopy=yes
set clipboard=unnamedplus
set backspace=indent,eol,start
set undofile
set undodir=~/.vim/undodir
set directory=~/.vim/swapfiles
set backupdir=~/.vim/backups
let g:localvimrc_file = '.vimrc'
let g:prosession_dir = '~/.vim/session'
let g:prosession_per_branch = 1
let g:prosession_on_startup = 1

set hlsearch
set incsearch

hi IndentGuidesOdd  ctermbg=red
hi IndentGuidesEven ctermbg=yellow
" Highlight trailing spaces
" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" function! LinterStatus() abort
"     let l:counts = ale#statusline#Count(bufnr(''))

"     let l:all_errors = l:counts.error + l:counts.style_error
"     let l:all_non_errors = l:counts.total - l:all_errors

"     return l:counts.total == 0 ? 'OK' : printf(
"     \   '%dW %dE',
"     \   all_non_errors,
"     \   all_errors
"     \)
" endfunction

" statusline
:set statusline=%{fugitive#statusline()}\ %L\ %f\
:set statusline+=%#warningmsg#
" :set statusline+=%{LinterStatus()}
:set statusline+=\ %{ObsessionStatus()}
:set statusline+=%*

" NERDTree
map <Leader>N :NERDTreeToggle<CR>
map <Leader> <Plug>(easymotion-prefix)
nmap <Leader>n :NERDTreeFind<CR>
autocmd VimEnter * NERDTree
autocmd vimenter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

" Tabs
let g:tagbar_ctags_bin="/usr/bin/ctags"
set tags=./tags,tags;$HOME
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"Aliases

"Tabs -> buffers
set modifiable

" Tags
nmap <F8> :TagbarToggle<CR>


" FZF
set rtp+=~/.fzf
map <C-f> :FZF<CR>
nmap <Leader>b :BufExplorerVerticalSplit<CR>

set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

" JS
" noremap <F3> :Autoformat<CR>
" let g:formatdef_prettier_javascript = '"prettier"'
" let g:loaded_matchit = 1

" let g:autoformat_remove_trailing_spaces = 1
let g:yats_host_keyword = 1
