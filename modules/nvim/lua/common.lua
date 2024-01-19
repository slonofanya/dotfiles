local o = vim.opt
local g = vim.g

-- g.colorscheme = 'onedark'
g.mapleader = ' '
o.autoread = true

nmap('<leader>r', ':source $MYVIMRC<CR>')
imap('jk', '<Esc>')

o.background = 'dark'
o.encoding = 'UTF-8'
o.backupcopy = 'yes'
o.clipboard = 'unnamed'
o.rnu = true
o.number = true

o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2
o.expandtab = true

o.autoindent = true
o.autowrite = true

o.undofile = true
o.undodir = os.getenv('HOME') .. '/.vim/undodir'
o.swapfile = false
o.backup = false

o.list = true
o.listchars = {eol = '↲', tab = '▸ ', trail = '·'}
o.langmap = 'ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;\'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>'

o.spelllang = 'en'
o.spellsuggest = 'best,9'
o.spell = true