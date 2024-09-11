-- if true then
--   return {}
-- end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  "nvim-treesitter/nvim-treesitter",
  main = "nvim-treesitter",
  opts = {
    -- A list of parser names, or "all" (the listed parsers MUST always be installed)
    ensure_installed = {
      "c",
      "cpp",
      "rust",
      "python",
      "java",
      "lua",
      "sql",
      "vim",
      "vimdoc",
      "markdown",
      "markdown_inline",
    },
  },
}
