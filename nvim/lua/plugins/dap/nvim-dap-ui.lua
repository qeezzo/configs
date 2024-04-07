return {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        dapui.setup()

        dap.listeners.after.event_initialized["daui_config"] = function()
            dapui.open()
        end
        dap.listeners.after.event_terminated["daui_config"] = function()
            dapui.close()
        end
        dap.listeners.after.event_exited["daui_config"] = function()
            dapui.close()
        end
    end,
}
