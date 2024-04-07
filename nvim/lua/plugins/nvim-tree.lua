return {
    'nvim-tree/nvim-tree.lua',
    lazy = false,
    config = function()
        require("nvim-tree").setup{}

        -- vim.keymap.set('n', '<Leader>e', '<cmd>NvimTreeOpen<CR>')
        vim.keymap.set('n', '<Leader>t', '<cmd>NvimTreeToggle<CR>')
        -- vim.keymap.set('n', '<Leader>tf', '<cmd>NvimTreeFocus<CR>')
        -- vim.keymap.set('n', '<Leader>tc', '<cmd>NvimTreeCollapse<CR>')
    end,
}
