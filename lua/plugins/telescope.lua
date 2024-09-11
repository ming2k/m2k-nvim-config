-- if true then
--   return {}
-- end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- plugins/telescope.lua:
return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  lazy = true,
  event = { "VimEnter" },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File" },
    {"<leader>fh", "<cmd>Telescope oldfiles<cr>", desc = "Show recent files" },
    {"<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Show buffers" },
  },
}
