local conform = require 'conform'

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

		rs = { "rustfmt" },

        python = { "blue" },
	},
})

vim.keymap.set({ "n", "v" }, "<leader>fm", function()
	conform.format({
		lsp_fallback = true,
		async = false,
	})
end)
