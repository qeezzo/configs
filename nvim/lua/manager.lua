require 'paq' {
    -- auto management
    'savq/paq-nvim',

    -- theme
    'sainnhe/sonokai',
    'uloco/bluloco.nvim',
        -- requires
        'rktjmp/lush.nvim',
    'norcalli/nvim-colorizer.lua',
    'sphamba/smear-cursor.nvim',
    'tamton-aquib/duck.nvim',

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

    -- dev container
    'esensar/nvim-dev-container',
}

-- require all modules in the 'lua/plugins' directory
local plugins_dir = vim.fn.stdpath('config') .. '/lua/plugins'
for _, file in ipairs(vim.fn.readdir(plugins_dir)) do
    if file:match('%.lua$') then
        local status_ok, err = pcall(require, 'plugins.' .. file:sub(1, -5))
        if not status_ok then
            vim.notify('Failed to load plugin: ' .. file, vim.log.levels.ERROR)
            vim.notify(err)
        end
    end
end
