-- if true then
--   return {}
-- end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "williamboman/mason.nvim" },
  },
  config = function()
    local mason_registry = require("mason-registry")
    local status, lspconfig = pcall(require, "lspconfig")
    if not status then
      print("lspconfig not found")
      return
    end

    local function is_installed(package_name)
      return mason_registry.get_package(package_name):is_installed()
    end

    if is_installed("lua-language-server") then
      vim.notify("Installing ", vim.log.levels.INFO)
      lspconfig.lua_ls.setup(require('lsp_configurations.lua_ls'))
      -- lspconfig.lua_ls.setup({
      --   settings = {
      --     Lua = {
      --       runtime = {
      --         -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
      --         version = 'LuaJIT',
      --       },
      --       diagnostics = {
      --         -- Get the language server to recognize the `vim` global
      --         globals = {'vim', 'mp'},
      --       },
      --       -- Do not send telemetry data containing a randomized but unique identifier
      --       telemetry = {
      --         enable = false,
      --       },
      --     },
      --   },
      -- })
    end

    if is_installed("clangd") then
      lspconfig.clangd.setup(require('lsp_configurations.clangd'))
    end
    if is_installed("rust-analyzer") then
      lspconfig.rust_analyzer.setup(require('lsp_configurations.rust_analyzer'))
    end
    if is_installed("yaml-language-server") then
      lspconfig.yamlls.setup(require('lsp_configurations.yamlls'))
    end
  end
}
