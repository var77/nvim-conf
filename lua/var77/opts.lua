local g = vim.g -- a table to access global variables
local opt = vim.opt -- to set options

opt.guicursor = ""
opt.showmatch = false
opt.relativenumber = true
opt.hlsearch = false
opt.hidden = true
opt.errorbells = false
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.wrap = false
opt.nu = true
opt.smartcase = true
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.incsearch = true
opt.termguicolors = true
opt.scrolloff = 8
opt.cmdheight = 2
opt.updatetime = 50
opt.shortmess = opt.shortmess + "c"
--opt.colorcolumn = "120"
opt.encoding = "UTF-8"
opt.completeopt = "menu,menuone,noselect"
opt.splitright = true

g.mapleader = " "

g.EasyGrepFilesToExclude = "android,ios,node_modules,coverage,*.lock,*.log,__snapshots__"
g.EasyGrepRecursive = 1
g.EasyGrepCommand = 1

g.netrw_browse_split = 2
g.vrfr_rg = "true"
g.netrw_banner = 0
g.netrw_winsize = 25

opt.clipboard = 'unnamedplus';
opt.mouse = ""
