local function clone_paq()
	local path = vim.fn.stdpath("data") .. "/site/pack/paqs/start/paq-nvim"
	local is_installed = vim.fn.empty(vim.fn.glob(path)) == 0
	if not is_installed then
		vim.fn.system { "git", "clone", "--depth=1", "https://github.com/savq/paq-nvim.git", path }
		return true
	end
end

local function bootstrap_paq(packages)
	local first_install = clone_paq()
	vim.cmd.packadd("paq-nvim")
	local paq = require("paq")
	if first_install then
		vim.notify("Installing plugins...")
		paq(packages)
		paq.install()
		print('hooray! bootstrapped :)')
		vim.cmd('qa')
	end
end

-- Call helper function
bootstrap_paq {
    -- auto management
    'savq/paq-nvim',

    -- colorscheme
    'sainnhe/sonokai',
    'uloco/bluloco.nvim',
        -- requires
        'rktjmp/lush.nvim',
    'norcalli/nvim-colorizer.lua',

    -- treesitter
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

    -- lsp
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'williamboman/mason-lspconfig.nvim',

    -- completion
    'hrsh7th/nvim-cmp',
    'l3mon4d3/luasnip',

    -- formatting
    'stevearc/conform.nvim',

    -- mason
    'williamboman/mason.nvim',

    -- side bar
    'nvim-tree/nvim-tree.lua',
    'nvim-tree/nvim-web-devicons',

    -- helpers
    'm4xshen/autoclose.nvim',
    'tpope/vim-commentary',
    'tpope/vim-surround',
}
