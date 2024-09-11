return {
	"nvim-telescope/telescope-file-browser.nvim",
	config = function()
		local telescope = require("telescope")
		local telescope_actions = require("telescope.actions")
		local fb_actions = require("telescope._extensions.file_browser.actions")

		telescope.setup({
			extensions = {
				file_browser = {
					cwd_to_path = true,
					grouped = true,
					hijack_netrw = true,
					hidden = { file_browser = true, folder_browser = true },
					initial_mode = "normal",
					layout_config = { height = 40, width = 144 },
					mappings = {
						["n"] = {
							["h"] = fb_actions.goto_parent_dir,
							["l"] = telescope_actions.select_default,
						},
					},
					path = "%:p:h",
					previewer = false,
					select_buffer = true,
					theme = "dropdown",
				},
			},
		})

		telescope.load_extension("file_browser")
	end,
	dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	keys = {
		{ "<c-j>", "<cmd>Telescope file_browser<cr>" },
	},
}
