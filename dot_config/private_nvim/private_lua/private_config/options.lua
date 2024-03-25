local opt = vim.opt

-- Tab + Indentation
-- How many spaces is a Tab
opt.tabstop = 2
--How many spaces for indentation
opt.shiftwidth = 2
--How many spaces is a Tab in Insert mode
opt.softtabstop = 2
--Convert Tabs to Spaces
opt.expandtab = true
--Auto indentation
opt.smartindent = true
--Do not wrap lines
opt.wrap = false

-- Search
-- Move cursor to matches as search characters are entered
opt.incsearch = true
-- Ignore capitalization by default
opt.ignorecase = true
-- Do not ignore capitalization if used in search
opt.smartcase = true
-- Do not highlight search matches
opt.hlsearch = false

-- Appearance
-- Set hybrid line numbers
opt.number = true
opt.relativenumber = true
-- Full color support
opt.termguicolors = true
-- Column to alert about long lines
opt.colorcolumn = '100'
-- Gutter for debugger symbols
opt.signcolumn = 'yes'
-- Command line height
opt.cmdheight = 1
-- How many lines before scrolling stops (do not hit bottom)
opt.scrolloff = 10
-- Define autocompletion behaviour
-- Show even if only 1 option in autocompletion
-- Do not insert anything by default
-- Do not select anything by default
opt.completeopt = 'menuone,noinsert,noselect'

-- Behavior
-- Change buffers without saving
opt.hidden = true
-- Disable error bells
-- opt.errorbells = false
-- Disable swapfile and backups
opt.swapfile = false
opt.backup = false
-- Where to store undo history
opt.undodir = vim.fn.expand('~/.vim/undodir')
opt.undofile = true
-- Backspace enablement
opt.backspace = 'indent,eol,start'
-- Split directions
opt.splitright = true
opt.splitbelow = true
-- Do not automatically switch words
opt.autochdir = false
-- If word is hyphenated, treat it as a whole word
opt.iskeyword:append('-')
-- Mouse is always available
opt.mouse:append('a')
-- Add register plus to clipboard to paste in/out of nvim
opt.clipboard:append('unnamedplus')
-- By default, can always edit current buffer
opt.modifiable = true
-- Changes appearance of cursor
-- opt.guicursor = "n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
-- Buffers set to UTF-8
opt.encoding = "UTF-8"
