vim.g.mapleader = ' '

-- options
vim.o.termguicolors = true
vim.o.exrc = true
vim.o.autochdir = true
vim.o.scrolloff = 5
vim.o.showcmd = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.signcolumn = "number"
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.g.syntax_on = true

-- folds
vim.opt.foldenable = true
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.o.foldlevel = 99
vim.opt.fillchars = {fold = " "}

-- filetypes
vim.filetype.add({extension = { sway = 'swayconfig' }})
vim.filetype.add({extension = { axaml = 'xml' }})
vim.filetype.add({extension = { jsonc = 'json' }})
vim.filetype.add({extension = { ixx = 'cpp' }})

-- colorcsheme
vim.cmd.colorscheme('sonokai')
