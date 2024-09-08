require 'mason-lspconfig' . setup {
    ensure_installed = {
        "lua_ls",
        "pyright",
        "rust_analyzer",
    },
}
