return {
  "obaland/vfiler.vim",

  config = function()
    local action = require("vfiler/action")

    require("vfiler/config").setup({
      mappings = {
        ["<C-h>"] = action.close_tree_or_cd,
        ["l"] = action.open_tree,
        ["<C-l>"] = action.open,
        ["N"] = function()
          vim.ui.input({ prompt = "Please enter a new file name?: " }, function(input)
              if input == nil then
                return
              end
              
              vim.cmd(":enew")
              local cmd = ":w".." "..input
              vim.cmd(cmd)
            end
          )
        end,
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
