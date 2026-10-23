return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    ---@type lspconfig.options
    servers = {
      pyright = {},
      ts_ls = {},
      eslint = {},
      jdtls = {},
      omnisharp = {},
      sqlls = {},
      texlab = {},
      marksman = {},
      yamlls = {},
      jsonls = {},
    },
  },
}
