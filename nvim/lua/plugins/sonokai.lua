return {
	"sainnhe/sonokai",
	lazy = false,
	priority = 1000,
	config = function()
        -- atlantis shusia maia
        vim.o.termguicolors = true
        vim.g.sonokai_style = 'andromeda'
        vim.g.sonokai_better_performance = 1
        vim.g.sonokai_dim_inactive_windows = 1
        vim.g.sonokai_diagnostic_line_highlight = 1
        vim.g.sonokai_transparent_background = 0
        vim.g.sonokai_enable_italic = 1
        vim.cmd.colorscheme("sonokai")
	end,
}
