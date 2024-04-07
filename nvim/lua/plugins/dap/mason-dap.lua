return {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies =  {
        "mfussenegger/nvim-dap",
        "williamboman/mason.nvim",
    },
    priority = 10,
    config = function()
        local dap = require("mason-nvim-dap")

        dap.setup({
            ensure_installed = {
                "cpp", "c", "rust", "python"
            },
            automatic_installation = true,
        })
    end,
}
