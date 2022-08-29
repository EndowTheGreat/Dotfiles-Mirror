local function safe_import(name)
    local ok, _ = pcall(require, name)
    if not ok then
        print("Failed to load " .. name)
    end
end

safe_import("settings")
safe_import("bindings")
safe_import("plugins")
