return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function ()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        'c', 'vim', 'lua', 'rust', 'cpp',
        'cmake', 'python', 'c_sharp',
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = false },
    })
  end
}
