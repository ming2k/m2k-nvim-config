local mason_registry = require("mason-registry")
local lombok_jar = mason_registry.get_package("jdtls"):get_install_path() .. "/lombok.jar"

return {
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
  }

