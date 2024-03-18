return {
	"dense-analysis/ale",

	config = function()
		vim.g.ale_fixers = {
			css = { "prettier" },
			html = { "eslint", "prettier" },
			php = { "intelephense" },
			javascript = { "eslint", "prettier" },
			javascriptreact = { "eslint", "prettier" },
			json = { "eslint", "prettier" },
			scss = { "scss" },
			typescript = { "eslint", "prettier" },
			typescriptreact = { "eslint", "prettier" },
		}

		vim.g.ale_fix_on_save = 1
	end,
}
