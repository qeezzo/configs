return {
	"mhartington/formatter.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local formatter = require("formatter")
		formatter.setup({
			logging = true,
			filetype = {
				xml = {
					require("formatter.filetypes.xml").xmlformat,
          function()
            return {
              exe = "xmlformat",
              args = { "-" },
              stdin = true,
            }
          end
				},
				lua = {
					require("formatter.filetypes.lua").stylua,
				},
				cs = {
					function()
						return {
							exe = "clang-format",
							stdin = true,
						}
					end,
				},
				cpp = {
					function()
						return {
							exe = "clang-format",
							stdin = true,
						}
					end,
				},
				sql = {
					function()
						return {
							exe = "sqlfmt -",
							stdin = true,
						}
					end,
					require("formatter.filetypes.sql").sqlfmt,
				},

				["*"] = {
					require("formatter.filetypes.any").remove_trailing_whitespace,
				},
			},
		})
	end,
}
