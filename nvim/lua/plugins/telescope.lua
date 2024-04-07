return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup()

        telescope.load_extension('fzf')

        local keymap = vim.keymap

        keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', {
            desc = "Fuzzy find files in cwd"})
        keymap.set('n', '<leader>fr', '<cmd>Telescope oldfiles<cr>', {
            desc = "Fuzzy find recent files"})
        keymap.set('n', '<leader>fs', '<cmd>Telescope live_grep<cr>', {
            desc = "Fuzzy find string in cwd"})
        keymap.set('n', '<leader>fc', '<cmd>Telescope grep_string<cr>', {
            desc = "Fuzzy find string under cursor in cwd"})
    end
}
