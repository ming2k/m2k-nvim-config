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
        -- 设置刷新间隔为 7 天（以秒为单位）
        frequency = 7 * 24 * 60 * 60,
      },
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

    mason_registry.refresh(function()
      ------------
      ---  LSP ---
      ------------
      install_lsp("lua-language-server")
      install_lsp("clangd")
      install_lsp("rust-analyzer")
      install_lsp("gopls")
      -- WEB
      install_lsp("html-lsp")
      install_lsp("css-lsp")
      install_lsp("typescript-language-server")
      install_lsp("eslint-lsp")
      -- Data Serialization
      install_lsp("yaml-language-server")
    end) -- refresh mason registry list
  end
}
