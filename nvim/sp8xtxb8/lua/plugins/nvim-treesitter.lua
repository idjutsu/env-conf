
return {
  "nvim-treesitter/nvim-treesitter",

  dependencies = { "windwp/nvim-ts-autotag" },

  build = ":TSUpdate",

  config = function () 
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      autotag = {
        enable = true
      },
      ensure_installed = { "c", "lua", "query", "vim", "vimdoc" },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },  
    })
  end
}
