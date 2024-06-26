return {
    'kevinhwang91/nvim-ufo',
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'kevinhwang91/promise-async'
    },
    config = function()
        local ufo = require'ufo'

        local handler = function(virtText, lnum, endLnum, width, truncate)
            local newVirtText = {}
            local suffix = (' 󰁂 %d '):format(endLnum - lnum)
            local sufWidth = vim.fn.strdisplaywidth(suffix)
            local targetWidth = width - sufWidth
            local curWidth = 0
            for _, chunk in ipairs(virtText) do
                local chunkText = chunk[1]
                local chunkWidth = vim.fn.strdisplaywidth(chunkText)
                if targetWidth > curWidth + chunkWidth then
                    table.insert(newVirtText, chunk)
                else
                    chunkText = truncate(chunkText, targetWidth - curWidth)
                    local hlGroup = chunk[2]
                    table.insert(newVirtText, {chunkText, hlGroup})
                    chunkWidth = vim.fn.strdisplaywidth(chunkText)
                    -- str width returned from truncate() may less than 2nd argument, need padding
                    if curWidth + chunkWidth < targetWidth then
                        suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
                    end
                    break
                end
                curWidth = curWidth + chunkWidth
            end
            table.insert(newVirtText, {suffix, 'MoreMsg'})
            return newVirtText
        end


        ufo.setup({
            provider_selector = function (_, _, _)
                return {'treesitter', 'indent'}
            end,
            fold_virt_text_handler = handler,
        })

        vim.api.nvim_set_hl(0, 'Folded', { bg = '#383450' })
        vim.api.nvim_set_hl(0, 'UfoFoldedBg', { bg = '#514b74' })

        vim.keymap.set('n', 'zR', ufo.openAllFolds)
        vim.keymap.set('n', 'zM', ufo.closeAllFolds)
        vim.keymap.set('n', 'zr', ufo.openFoldsExceptKinds)
        vim.keymap.set('n', 'zm', ufo.closeFoldsWith)
        vim.keymap.set('n', 'zp', function()
            ufo.peekFoldedLinesUnderCursor()
        end)
    end
}
