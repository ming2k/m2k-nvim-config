-- if true then
--   return {}
-- end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
  },

  config = function()
    local lspconfig = require('lspconfig')
    lspconfig.lua_ls.setup(require('lsp_configurations.lua_ls'))
    lspconfig.clangd.setup(require('lsp_configurations.clangd'))
    lspconfig.rust_analyzer.setup(require('lsp_configurations.rust_analyzer'))
    lspconfig.jdtls.setup(require('lsp_configurations.jdtls'))
    lspconfig.yamlls.setup(require('lsp_configurations.yamlls'))
  end,
}
