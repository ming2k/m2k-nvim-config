-- Function to require all files in a directory
local function load_config_directory(dir)
  -- The order in which vim.fn.globpath returns files depends on the underlying
  -- filesystem and the alphabetical order of file names.
  local config_files = vim.fn.globpath(dir, "*.lua", false, true)
  for _, file in ipairs(config_files) do
    local module_name = file:match("^.*/(.-)%.lua$")
    require(module_name)
  end
end

-- Load all configuration files from the 'config' directory
load_config_directory(vim.fn.stdpath("config") .. "/lua")
