local spice = {}

function spice._load_lsp(state, loaded, i)
    if nil == i.req then
        i.req = "lsp." .. i.name
    end

    local status, config = pcall(require, i.req)

    if status then
        -- Verify 'config' is actually a table to prevent runtime errors
        if type(config) == "table" then
            vim.lsp.config(i.name, config)
            vim.lsp.enable(i.name)
            loaded[i.name] = true
            i._loaded = true
        else
            vim.notify("LSP config for " .. i.name .. " did not return a table!", vim.log.levels.ERROR)
        end
    else
        vim.notify("Spice: Failed to load LSP '" .. i.name .. "' from '" .. i.req .. "'\nError: " .. tostring(config), vim.log.levels.ERROR)
    end
end

function spice._load_plugin(state, loaded, i)
    if nil == i then
        vim.print("Nil value passed!")
        return true
    else
        -- TODO :: add operating system check
    end

    if true == i.flags.loaded then
        return
    end

    if nil ~= i.deps then
        for _, si in pairs(i.deps) do
            if spice._load_plugin(state, loaded, state.metadata[si]) then
                vim.print(si)
                i.flags[si] = false
                return
            end
        end
    end

    if nil == i.req then
        i.req = "plugins." .. i.name
    end

    local status, my_module = pcall(require, i.req)

    if status then
    end

    loaded[i.name] = true
    i.flags.loaded = true
end

function spice.load(state)
    local loaded = {}
    local sw = {
        dep     = spice._load_plugin,
        plugin  = spice._load_plugin,
        theme   = spice._load_plugin,
        lsp     = spice._load_lsp,
    }

    for _, i in pairs(state.metadata) do
        if sw[i.type](state, loaded, i) then
            vim.print(i)
        end
    end

    vim.notify("Spice is fully loaded", vim.log.levels.INFO) 
    return loaded
end

return spice
