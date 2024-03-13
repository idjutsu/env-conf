return {
  "obaland/vfiler.vim",

  config = function()
    local action = require("vfiler/action")

    require("vfiler/config").setup({
      mappings = {
        ["l"] = action.open,
        ["<C-l>"] = action.open_tree_recursive,
	    	["R"] = action.reload
      },

      options = {
        auto_cd = true,
        find_file = true,
 		    show_hidden_files = true
      }
    }) 
  end,

  keys = {
    { "<C-h>", "<cmd>:VFiler<CR>" },
  },
}
