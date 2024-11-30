require 'mason-lspconfig' . setup {
    ensure_installed = {
        "lua_ls",
        "ts_ls",
        "bashls",
        "rust_analyzer",
        "omnisharp",
        "cmake",
        "jdtls",
        "lemminx",
        "dockerls",
        "pyright",
        "mesonlsp",
        "emmet_language_server",
        "cssls"
    },
}
