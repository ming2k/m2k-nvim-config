if true then
  return {}
end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  "numToStr/Comment.nvim",
  keys = function(_, keys)
    vim.list_extend(keys, {
      { "gcc", desc = "Comment toggle current line" },
      { "gbc", desc = "Comment toggle current block" },
      { "gc", desc = "Comment toggle linewise" },
      { "gb", desc = "Comment toggle blockwise" },
      { "gc", mode = "x", desc = "Comment toggle linewise (visual)" },
      { "gb", mode = "x", desc = "Comment toggle blockwise (visual)" },
      { "gco", desc = "Comment insert below" },
      { "gcO", desc = "Comment insert above" },
      { "gcA", desc = "Comment insert end of line" },
    })
  end,
  opts = function(_, opts)
    local commentstring_avail, commentstring = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
    if commentstring_avail then
      opts.pre_hook = commentstring.create_pre_hook()
    end
  end,
}
