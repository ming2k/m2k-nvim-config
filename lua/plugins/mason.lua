-- if true then
--   return {}
-- end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  "williamboman/mason.nvim",
  config = function()
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      },
      registry = {
        -- set refresh time to 7 days (unit second)
        frequency = 7 * 24 * 60 * 60,
      },
    })

    local mason_registry = require("mason-registry")

    -- Encapsulate installation process
    local function install_lsp(package_name)
      if package_name then
        local package = mason_registry.get_package(package_name)
        if not package:is_installed() then
          vim.notify("Installing " .. package_name, vim.log.levels.INFO)
          package:install()
        end
      else
        vim.notify("Unknown LSP server: " .. package_name, vim.log.levels.ERROR)
      end
    end

    mason_registry.refresh(function()
      install_lsp('lua-language-server')
      install_lsp("clangd")
      install_lsp('rust-analyzer')
      install_lsp("gopls")
      install_lsp('pyright')
      install_lsp("html-lsp")
      install_lsp("css-lsp")
      install_lsp('stylelint-lsp') -- css lint lsp
      install_lsp("typescript-language-server") -- JS/TS lsp
      install_lsp("eslint-lsp")
      install_lsp('json-lsp')
      install_lsp("yaml-language-server")
      install_lsp('sqlls')
    end) -- refresh mason registry list
  end
}
