return {
	"hrsh7th/nvim-cmp",

	config = function()
		local cmp = require("cmp")

		local lspkind = require("lspkind")

		local luasnip = require("luasnip")

		cmp.setup({
			formatting = {
				format = lspkind.cmp_format({
					ellipsis_char = "...",
					maxwidth = 50,
					mode = "symbol_text",
				}),
			},

			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			}),

			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},

			sources = {
				{ name = "luasnip" },
				{ name = "nvim_lsp" },
			},

			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
		})
	end,

	dependencies = {
		"onsails/lspkind-nvim",
		"L3MON4D3/LuaSnip",
	},
}
