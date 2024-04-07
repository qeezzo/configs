vim.g.mapleader = ' '

require("mappings")
require("lazy-init")
require("colo_light_dark")

-- options
vim.o.exrc = true
vim.o.autochdir = true
vim.o.scrolloff = 5
vim.opt.foldenable = true
vim.o.foldmethod = "syntax"
vim.o.foldlevel = 99
vim.opt.fillchars = {fold = " "}
vim.o.showcmd = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.relativenumber = true
vim.o.signcolumn = "number"
vim.o.number = true
vim.o.cursorline = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true

vim.filetype.add({extension = { sway = 'swayconfig' }})
vim.filetype.add({extension = { axaml = 'xml' }})
