-- if true then
--   return {}
-- end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "williamboman/mason.nvim" },
    {
      "williamboman/mason-lspconfig.nvim",
      opts = {
        ---@type string[]
        ensure_installed = {
          -- Lua
          "lua_ls",
          -- Web
          "html",
          "cssls",
          "tsserver",
          "emmet_ls",
          "jsonls",
          -- Python
          "pyright",
          -- C/C++
          "clangd",
          -- Rust
          "rust_analyzer",
          -- Go
          "gopls",
          -- Java
          "jdtls",
          -- PHP
          "intelephense",
          -- Ruby
          "solargraph",
          -- fontend framework
          "vuels",
          "angularls",
          "svelte",
          -- backend framework
          "denols",
          "graphql",
          -- mark lang
          "marksman", -- Markdown
          "yamlls",
          "lemminx", -- XML
          -- Shell
          "bashls",
          -- db
          "sqlls",
          -- config
          "dockerls",
          "dotls",
          -- other
          "vimls",
          "cmake",
          "diagnosticls",
          -- general
          "eslint",
          "stylelint_lsp",
        },
      }
    }
  },

  config = function()
    local lspconfig = require('lspconfig')
    local mason_lspconfig = require("mason-lspconfig")
    
    mason_lspconfig.setup_handlers({
      function(server_name)
        require("lspconfig")[server_name].setup({})
      end,
      
      ["lua_ls"] = function()
        require("lspconfig").lua_ls.setup({
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim", "mp" },
              },
            },
          },
        })
      end,

      ["clangd"] = function()
        lspconfig.clangd.setup({
          cmd = {'clangd', '--background-index', '--clang-tidy', '--log=verbose'},
          init_options = {
            fallback_flags = { '-std=c++17' },
          },
        })
      end,

      
      ["rust_analyzer"] = function()
        lspconfig.rust_analyzer.setup({
          settings = {
            ["rust-analyzer"] = {},
          },
        })
      end,
      
      ["jdtls"] = function()
        local mason_registry = require("mason-registry")
        local lombok_jar = mason_registry.get_package("jdtls"):get_install_path() .. "/lombok.jar"
        lspconfig.jdtls.setup({
          -- 保持原有的 jdtls 配置不变
          jdtls_config_dir = function(project_name)
            return vim.fn.stdpath("cache") .. "/jdtls/" .. project_name .. "/config"
          end,
          jdtls_workspace_dir = function(project_name)
            return vim.fn.stdpath("cache") .. "/jdtls/" .. project_name .. "/workspace"
          end,
          cmd = {
            vim.fn.exepath("jdtls"),
            string.format("--jvm-arg=-javaagent:%s", lombok_jar),
          },
          full_cmd = function(opts)
            -- 保持原有的 full_cmd 函数不变
          end,
        })
      end,
    })
  end,
}
