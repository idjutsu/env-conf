return {
	"bluz71/vim-moonfly-colors",

	config = function()
		vim.g.moonflyTransparent = true
		vim.cmd([[colorscheme moonfly]])
	end,

	name = "moonfly",

	lazy = false,

	priority = 1000,
}
