local treesitter = require("nvim-treesitter.configs")

treesitter.setup({
	ensure_installed = {
		"bash",
		"css",
		"cmake",
		"go",
		"html",
		"javascript",
		"lua",
		"markdown",
		"python",
		"rust",
		"toml",
		"typescript",
		"yaml",
		"zig",
	},
	ignore_install = {},
	highlight = {
		enable = true,
		disable = {},
	},
	indent = { enable = true },
})
