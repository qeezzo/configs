vim.keymap.set("t", "<esc>", "<C-\\><C-n>")

vim.keymap.set("n", "<c-h>", "<c-w>h")
vim.keymap.set("n", "<c-j>", "<c-w>j")
vim.keymap.set("n", "<c-k>", "<c-w>k")
vim.keymap.set("n", "<c-l>", "<c-w>l")

vim.keymap.set("n", "<leader>sa", "<cmd>mksession! .session.vim<cr>")
vim.keymap.set("n", "<leader>so", "<cmd>source .session.vim<cr>")

local Formatting = vim.api.nvim_create_augroup("Formatting", { clear = false })
vim.api.nvim_create_autocmd({ "BufNew", "BufAdd", "BufEnter" }, {
	pattern = { "*.cpp" },
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.shiftwidth = 2
	end,
	group = Formatting,
})

-- format
vim.keymap.set("n", "<leader>fm", ":Format<cr>")

local CompileRun = vim.api.nvim_create_augroup("CompileRun", { clear = false })

-- compile
vim.keymap.set("n", "<leader>em", function()
	local input = vim.fn.input("make : ", vim.opt_local.makeprg:get())
	vim.opt_local.makeprg = input
end)

vim.keymap.set("n", "<leader>ea", function()
	local input = vim.fn.input("args : ", vim.b.args, "file")
	vim.b.args = input
end)

vim.keymap.set("n", "<F7>", "<cmd>!clear<cr><cmd>make!<cr>", { silent = true })
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "cpp" },
	callback = function()
		vim.b.args = ""
		vim.opt_local.makeprg = "g++ -Wall -g -std=c++23 -o %< %"
		vim.opt_local.commentstring = "// %s"

		vim.keymap.set("n", "<leader><F7>", function()
			local saved = vim.opt_local.makeprg:get()
			vim.opt_local.makeprg = "g++ -Wall -g -std=c++23 -pthread -o %< % -lgtest_main -lgtest -lpthread"

			vim.cmd.make()
			vim.opt_local.makeprg = saved
		end)
	end,
	group = CompileRun,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "c" },
	callback = function()
		vim.b.args = ""
		vim.opt_local.makeprg = "cc -g -o %< %"
	end,
	group = CompileRun,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "cs" },
	callback = function()
		vim.b.args = ""
		vim.opt_local.makeprg = "dotnet build"
	end,
	group = CompileRun,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "java" },
	callback = function()
		vim.b.args = ""
		vim.opt_local.makeprg = "javac %"
	end,
	group = CompileRun,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "typescript" },
	callback = function()
		vim.b.args = ""
		vim.opt_local.makeprg = "tsc %"
	end,
	group = CompileRun,
})

-- run
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "cpp", "c", "nasm" },
	callback = function()
		vim.keymap.set("n", "<leader><F5>", function()
			vim.cmd("bo sp | term ./%< " .. vim.b.args)
		end)
	end,
	group = CompileRun,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "cs" },
	callback = function()
		vim.keymap.set("n", "<leader><F5>", function()
			vim.cmd("bo sp | term dotnet run " .. vim.b.args)
		end)
	end,
	group = CompileRun,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "java" },
	callback = function()
		vim.keymap.set("n", "<leader><F5>", function()
			vim.cmd("bo sp | term java %< " .. vim.b.args)
		end)
	end,
	group = CompileRun,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "js", "typescript" },
	callback = function()
		vim.keymap.set("n", "<leader><F5>", function()
			vim.cmd("bo sp | term node %<.js " .. vim.b.args)
		end)
	end,
	group = CompileRun,
})
