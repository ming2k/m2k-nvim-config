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
    local lsp_servers = {
      { name = "lua_ls",        config_name = "lua_ls",        package_name = "lua-language-server" },
      { name = "clangd",        config_name = "clangd",        package_name = "clangd" },
      { name = "rust_analyzer", config_name = "rust_analyzer", package_name = "rust-analyzer" },
      { name = "gopls",         config_name = "gopls",         package_name = "gopls" },
      { name = "yamlls",        config_name = "yamlls",        package_name = "yaml-language-server" },
      { name = "html",          config_name = "html",          package_name = "html-lsp" },
      { name = "cssls",         config_name = "cssls",         package_name = "css-lsp" },
      { name = "eslint",        config_name = "eslint",        package_name = "eslint-lsp" },
      { name = "ts_ls",         config_name = "ts_ls",         package_name = "typescript-language-server" },
    }

    mason_registry.refresh(function()
      for _, server in ipairs(lsp_servers) do
        if mason_registry.get_package(server.package_name):is_installed() then
          lspconfig[server.name].setup(require('lsp_configurations.' .. server.config_name))
        else
          print("Language server " .. server.package_name .. " is not installed.")
        end
      end
    end);
  end
}
