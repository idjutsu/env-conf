return {
	"nvim-treesitter/nvim-treesitter",

	build = ":TSUpdate",

	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			auto_install = true,
			autotag = {
				enable = true,
			},
			ensure_installed = { "c", "lua", "query", "vim", "vimdoc" },
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,

	dependencies = { "windwp/nvim-ts-autotag" },
}
