-- utils.lua

local M = {}


function M.merge_tables_into_first(...)
    local result = {}
    for _, t in ipairs({...}) do
        for k, v in pairs(t) do
            result[k] = v
        end
    end
    return result
end

return M
