-- Config behavior by filetype
vim.api.nvim_create_autocmd("FileType", {
  pattern = "json",
  command = "setlocal ts=2 sts=2 sw=2 expandtab",
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  command = "setlocal ts=2 sts=2 sw=2 expandtab",
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "c",
  command = "setlocal ts=4 sts=4 sw=4 expandtab",
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "ebuild",
  command = "setlocal ts=4 sts=4 sw=4 expandtab",
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  command = "setlocal wrap linebreak",
})
