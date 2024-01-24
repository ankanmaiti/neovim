-- ~/.config/nvim/lua/utils/auto_import.lua

-- Function to automatically require all modules in a directory
local function auto_import_modules(directory)
    local files = vim.fn.readdir(directory)
    for _, file in ipairs(files) do
        if file:match("%.lua$") then
            local module_name = file:match("^(.-)%.lua$")
            require(directory .. "/" .. module_name)  -- Use '/' instead of '.'
        end
    end
end

-- Return the function so it can be used elsewhere
return {
    auto_import_modules = auto_import_modules
}

