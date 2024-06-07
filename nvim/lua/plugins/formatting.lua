return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")
    conform.setup({
      notify_on_error = true,
      formatters_by_ft = {
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        xml = { "prettier" },
        lua = { "stylua" },

        cs = { "clang-format" },
        cpp = { "clang-format" },
        h = { "clang-format" },
        hpp = { "clang-format" },
        c = { "clang-format" },
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>fm", function()
      conform.format({
        lsp_fallback = true,
        async = false,
      })
    end, { desc = "Format file" })

    -- 		local formatter = require("formatter")
    -- 		formatter.setup({
    -- 			logging = true,
    -- 			filetype = {
    -- 				xml = {
    -- 					require("formatter.filetypes.xml").xmlformat,
    --           function()
    --             return {
    --               exe = "xmlformat",
    --               args = { "-" },
    --               stdin = true,
    --             }
    --           end
    -- 				},
    -- 				lua = {
    -- 					require("formatter.filetypes.lua").stylua,
    -- 				},
    -- 				tsx = {
    --           function()
    --             return {
    --               exe = "prettier",
    --               args = { "-" },
    --               stdin = true,
    --             }
    --           end
    -- 				},
    -- 				ts = {
    --           function()
    --             return {
    --               exe = "prettier",
    --               args = { "-" },
    --               stdin = true,
    --             }
    --           end
    -- 				},
    -- 				cs = {
    -- 					function()
    -- 						return {
    -- 							exe = "clang-format",
    -- 							stdin = true,
    -- 						}
    -- 					end,
    -- 				},
    -- 				cpp = {
    -- 					function()
    -- 						return {
    -- 							exe = "clang-format",
    -- 							stdin = true,
    -- 						}
    -- 					end,
    -- 				},
    -- 				sql = {
    -- 					function()
    -- 						return {
    -- 							exe = "sqlfmt -",
    -- 							stdin = true,
    -- 						}
    -- 					end,
    -- 					require("formatter.filetypes.sql").sqlfmt,
    -- 				},

    -- 				["*"] = {
    -- 					require("formatter.filetypes.any").remove_trailing_whitespace,
    -- 				},
    -- 			},
    -- 		})
  end,
}
