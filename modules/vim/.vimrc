set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin()
" Plug 'chrisbra/NrrwRgn'
  Plug 'herringtondarkholme/yats.vim', { 'for': 'javascript'  }

"JavaScript
Plug 'pangloss/vim-javascript', { 'for': 'javascript'  }
Plug 'mxw/vim-jsx', { 'for': 'javascript'  }
Plug 'jelera/vim-javascript-syntax' , { 'for': 'javascript'  }

"HTML
  Plug 'tpope/vim-haml', { 'for': 'haml' }

"CSS/LESS/Stylus/SCSS
  Plug 'ap/vim-css-color', { 'for': ['css', 'scss', 'sass', 'less', 'stylus']  }
  Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss', 'sass']  }
  Plug 'groenewege/vim-less', { 'for': 'less'  }
  Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'scss']  }
  Plug 'wavded/vim-stylus', { 'for': 'stylus'  }"
call plug#end()

filetype plugin indent on
syntax on

let g:jsx_ext_required = 0
let g:used_javascript_libs = 'underscore,jquery,react,chai,handlebars'

" Youcompleteme
let g:ycm_goto_buffer_command = 'vertical-split'
nnoremap <silent> gd :leftabove vertical :YcmCompleter GoTo<CR>
nnoremap <silent> gf :YcmCompleter GoToReferences<CR>

"System
set autoread

colorscheme onedark
set encoding=utf-8

let g:solarized_termcolors=256
let g:mapleader=' '
inoremap jk <Esc>
set background=dark
set number
set expandtab
set tabstop=2
set shiftwidth=2
set listchars=eol:¬,tab:>-,trail:~,extends:>,precedes:<
"set listchars=eol:¬,tab:>-,trail:~,extends:>,precedes:<,space: 
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

" statusline
:set statusline=%{fugitive#statusline()}\ %f\ %L
:set statusline+=%#warningmsg#
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

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

"Aliases

"Translation
  let g:trans_bin = "~/.vim"
  vnoremap <silent> <leader>t :Trans<CR>
  vnoremap <silent> <leader>td :TransSelectDirection<CR>

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
" noremap <F3> :!npx tsfmt % -r<CR>
" noremap <F3> :Autoformat<CR>
noremap <F4> :!npx tslint -c tslint.json -p tsconfig.json --fix %<CR>

let g:yats_host_keyword = 1
