return {
  "nvim-telescope/telescope.nvim",

  config = function()
    local fb_actions = require("telescope._extensions.file_browser.actions")
    local telescope_actions = require("telescope.actions")

    require("telescope").setup({
      extensions = {
        file_browser = {
          cwd_to_path = true,
          hijack_netrw = true,
          hidden = { file_browser = true, folder_browser = true },
          initial_mode = "normal",
          layout_config = { height = 40, width = 144 },
          mappings = {
            ["i"] = {},
            ["n"] = {
              ["h"] = fb_actions.goto_parent_dir,
              ["<c-j>"] = function() end,
              ["l"] = telescope_actions.select_default,
            },
          },
          path = "%:p:h",
          previewer = false,
          select_buffer = true,
          theme = "dropdown",
          --theme = "ivy",
        },
      },
    })

    require("telescope").load_extension("file_browser")
  end,

  dependencies = {
    "nvim-lua/plenary.nvim",

    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build =
      "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    },

    "nvim-telescope/telescope-file-browser.nvim",
  },

  keys = {
    { "<c-j>", "<cmd>Telescope file_browser<cr>" },
  },

  tag = "0.1.6",
}
