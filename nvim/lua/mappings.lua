-- make and source session
vim.keymap.set("n", "<leader>sa", "<cmd>mksession! .session.vim<cr>")
vim.keymap.set("n", "<leader>so", "<cmd>source .session.vim<cr>")

-- invoke terminal
vim.keymap.set("n", "<c-`>", "<cmd>hor term<cr>i")

-- toggle colorcheme

function theme_toggle()
    if vim.o.background == 'dark' then
        light()
    else
        dark()
    end
end

function light()
    vim.o.background = 'light'
    vim.cmd.colorscheme('bluloco-light')
end

function dark()
    vim.o.background = 'dark'
    vim.cmd.colorscheme('sonokai')
end
