return {
  "williamboman/mason-lspconfig.nvim",
  opts = {
    ---@type string[]
    ensure_installed = {
      "bashls",
      "lua_ls",
      "jsonls",
      "pyright",
      "clangd",
      "rust_analyzer",
      "gopls",
      "jdtls",        -- Java
      "marksman",     -- Markdown
      "yamlls",
      "lemminx",      -- XML
      "sqlls",
      "dockerls",
      "vimls",
      "cmake",
      "eslint",
    },
  }
}
