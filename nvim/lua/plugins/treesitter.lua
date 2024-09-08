require 'nvim-treesitter.configs' . setup {

  ensure_installed = {
      "c",
      "cpp",
      "rust",
      "lua",
      "vim",
      "vimdoc",
      "make",
      "dockerfile",
      "json",
      "css",
      "html",
      "jsonc",
      "python",
  },

  sync_install = false,

  auto_install = false,

  ignore_install = {},

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

}
