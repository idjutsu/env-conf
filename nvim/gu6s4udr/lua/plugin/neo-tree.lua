return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		{
			"s1n7ax/nvim-window-picker",
			name = "window-picker",
			event = "VeryLazy",
			version = "2.*",
			config = function()
				require("window-picker").setup()
			end,
		},
	},
	keys = {
		{
			"<leader>t",
			function()
				require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
			end,
			desc = "Explorer NeoTree (cwd)",
		},
	},
	opts = {
		filesystem = {
			filtered_items = {
				hide_dotfiles = false,
				hide_by_name = {
					".DS_Store",
					".git",
					"node_modules",
				},
			},
		},
		window = {
			mappings = {
				["h"] = "close_node",
				["l"] = "open",
				["s"] = "vsplit_with_window_picker",
				["S"] = "split_with_window_picker",
				["Z"] = "expand_all_nodes",
			},
		},
	},
}