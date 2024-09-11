-- if true then
--   return {}
-- end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  "williamboman/mason.nvim",
  opts = {
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  }
}
