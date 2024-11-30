if vim.g.vscode then
    local vscode = require('vscode')

    vscode.update_config('editor.lineNumbers', 'relative')

    vim.api.nvim_del_keymap('n', '<leader>t')
    vim.keymap.set('n', '<leader>t', function()
            vscode.call('workbench.action.toggleSidebarVisibility')
        end,
        { noremap = true, silent = true })
end
