if true then
  return {}
end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- It can work without lsp plugin

vim.lsp.start_client({
  name = "pyright",
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_dir = { ".git", "pyproject.toml", "pyrightconfig.json" },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
      },
    },
  },
  on_attach = function(client, bufnr) end,
})
-- Set the make program to pyright
vim.o.makeprg = "pyright --outputjson %"

-- Set the error format to parse pyright output
vim.o.errorformat = "%f(%l,%c):%t%m"

-- Function to run pyright and populate quickfix list
local function lint_with_pyright()
  vim.cmd("make")
  vim.cmd("copen")
end

-- Auto lint on save with pyright
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.py",
  callback = lint_with_pyright,
})
