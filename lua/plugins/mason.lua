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
      }
    })

    local mason_registry = require("mason-registry")

    -- 函数来安装指定的 LSP
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

    mason_registry.update(function()
      install_lsp("lua-language-server")
      install_lsp("clangd")
      install_lsp("rust-analyzer")
      install_lsp("gopls")
      install_lsp("yaml-language-server")
    end)

  end
}
