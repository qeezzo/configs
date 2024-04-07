return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
    },
    priority = 100,
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")

        mason.setup()

        mason_lspconfig.setup({
            ensure_installed = {
                'clangd',
                'cmake',
                'lua_ls',
                'rust_analyzer',
                'pyright',
                'jdtls',
                'omnisharp',
            },
            automatic_installation = true,
        })
    end,
}
