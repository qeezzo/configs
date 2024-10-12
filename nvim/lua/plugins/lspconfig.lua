local lspconfig = require 'lspconfig'
local capabilities = require 'cmp_nvim_lsp' .default_capabilities()

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

local on_attach = function(_, bufnr)
    opts.buffer = bufnr

    opts.desc = "Show references"
    keymap.set("n", "<leader>ref", vim.lsp.buf.references, opts)

    opts.desc = "Show document symbols"
    keymap.set("n", "<leader>dsy", vim.lsp.buf.document_symbol, opts)

    opts.desc = "Query workspace symbols"
    keymap.set("n", "<leader>wsy", vim.lsp.buf.workspace_symbol, opts)

    opts.desc = "Incoming calls"
    keymap.set("n", "<leader>in", vim.lsp.buf.incoming_calls, opts)

    opts.desc = "Outcoming calls"
    keymap.set("n", "<leader>out", vim.lsp.buf.outgoing_calls, opts)

    opts.desc = "Go to declaration"
    keymap.set("n", "<leader>gd", vim.lsp.buf.declaration, opts)

    opts.desc = "Go to definition"
    keymap.set("n", "gd", vim.lsp.buf.definition, opts)

    opts.desc = "Go to implementation"
    keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, opts)

    opts.desc = "Go to type definition"
    keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, opts)

    opts.desc = "See avaible code actions"
    keymap.set({ "n", "v" }, "<leader>ac", vim.lsp.buf.code_action, opts)

    opts.desc = "Smart rename"
    keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

    opts.desc = "Show buffer diagnostics"
    -- keymap.set("n", "<leader>er", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
    keymap.set("n", "<leader>er", function (o) vim.diagnostic.get(0, o) end, opts)

    opts.desc = "Show line diagnostics"
    keymap.set("n", "<leader>el", vim.diagnostic.open_float, opts)

    opts.desc = "Go to previous diagnostic"
    keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

    opts.desc = "Go to next diagnostic"
    keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

    opts.desc = "Show documentation for what is under cursor"
    keymap.set("n", "K", vim.lsp.buf.hover, opts)

    opts.desc = "Restart LSP"
    keymap.set("n", "<leader>rs", "<cmd>LspRestart<CR>", opts)
end

-- Get Neovim runtime path
local function get_vim_runtime()
    local vim_runtime = vim.env.VIMRUNTIME
    if not vim_runtime then
        -- Fallback if VIMRUNTIME is not set
        vim_runtime = vim.fn.stdpath('config') .. '/lua' 
    end
    return vim_runtime
end

-- Configure lua-ls
lspconfig.lua_ls.setup {
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = {
                    '?.lua',
                    '?/init.lua',
                    -- Add more paths if necessary
                },
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = {
                    get_vim_runtime(),
                },
                checkThirdParty = false,
            },
            telemetry = {
                enable = false,
            },
        },
    },
}

lspconfig["clangd"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

-- neocmake was
lspconfig["cmake"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

lspconfig["rust_analyzer"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

lspconfig["jdtls"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    single_file_support = true,
})

lspconfig["omnisharp"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { "omnisharp" },
})

lspconfig["tsserver"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

lspconfig["lemminx"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

lspconfig["dockerls"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

lspconfig["sqlls"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        sqlLanguageServer = {
            connections = {
                {
                      adapter = 'mysql',
                      host = '[::]',
                      user = 'renat',
                      password = 'renatus',
                      port = 3306,
                      database = 'bank',
                },
            },
        },
    },
    cmd = { "sql-language-server", "up", "--method", "stdio" },
})

lspconfig["qmlls"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { "qmlls6" },
})

lspconfig["pyright"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

lspconfig["mesonlsp"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

lspconfig["emmet_language_server"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

lspconfig["cssls"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})
