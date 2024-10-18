-- Global counter to track the number of terminals
vim.g.term_count = 0

-- Function to open a new terminal and name it
function OpenNamedTerminal()
    -- Increment the counter
    vim.g.term_count = vim.g.term_count + 1
    -- Create terminal name
    local term_name = string.format("Term %d", vim.g.term_count)
    -- Open terminal
    vim.cmd('botright 10split | terminal')
    -- Get the buffer number of the newly created terminal
    local bufnr = vim.api.nvim_get_current_buf()
    -- Rename the terminal buffer
    vim.api.nvim_buf_set_name(bufnr, term_name)
    -- Optional: Set statusline to display terminal name
    vim.opt_local.statusline = string.format('%%!Statusline_term("%s")', term_name)
end

-- Create statusline function (optional)
function Statusline_term(name)
    return name
end
vim.cmd([[
function! Statusline_term(name)
    return a:name
endfunction
]])

-- Set up the key mapping
vim.api.nvim_set_keymap('n', '<Leader>t', ':lua OpenNamedTerminal()<CR>', {noremap = true, silent = true})
