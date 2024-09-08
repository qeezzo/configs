-- make and source session
vim.keymap.set("n", "<leader>sa", "<cmd>mksession! .session.vim<cr>")
vim.keymap.set("n", "<leader>so", "<cmd>source .session.vim<cr>")

-- invoke terminal
vim.keymap.set("n", "<c-`>", "<cmd>hor term<cr>i")
