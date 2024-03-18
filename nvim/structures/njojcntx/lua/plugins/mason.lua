return {
  "williamboman/mason.nvim",

  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      automatic_installation = true,
      ensure_installed = {
        "cssls",
        "html",
        "intelephense",
        "lua_ls",
        "tailwindcss",
        "tsserver",
      },
    })
  end,

  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
}
