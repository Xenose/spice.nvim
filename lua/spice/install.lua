local spice = {}

function spice._install_script(this, p)
    if nil == p.script then 
        return 
    end

    local script_path = vim.fn.stdpath("config") .. "/lua/scripts/" .. p.script .. ".sh"

    -- Use vim.system for non-blocking execution
    vim.system({ "/bin/bash", script_path }, { text = true }, function(obj)
        if obj.code ~= 0 then
            vim.notify("Spice: Script failed for " .. p.name .. ": " .. obj.stderr, vim.log.levels.ERROR)
        else
            vim.notify("Spice: " .. p.name .. " configured.", vim.log.levels.INFO)
        end
    end)
end

function spice._install_plugin(repo, state, pkgs, p)
    if nil == p then
        vim.print("Nil value passed!")
        return true
    else
        -- TODO :: add operating system check
    end

    if nil == p.flags then
        p.flags = {}
    else
        -- listed means in the list but not installed yet
        if true == p.flags.listed then
            return
        end
    end

    -- sub-key : sk, sub-pointer : sp
    if nil ~= p.deps then
        for _, si in ipairs(p.deps) do
            if nil == pkgs[si] then
               if spice._install_plugin(repo, state, pkgs, repo.pkgs[si]) then
                   vim.print("Plugin failed to load: " .. si)
                   vim.print(p)
               end
            else
                if spice._install_plugin(repo, state, pkgs, pkgs[si]) then
                   vim.print("Plugin failed to load: " .. si)
                   vim.print(p)
                end
            end
        end
    end

    if nil ~= p.script then
        vim.print("[ " .. p.script .. " ] install script running...")
    end

    state.metadata[p.name] = p
    table.insert(state.pkgs, { src = p.url, version = p.version })
    p.flags.listed = true
end

function spice._install_lsp(repo, state, pkgs, p)
    spice._install_script(state, p)
    state.metadata[p.name] = p
end

function spice.install(state, pkgs) 
    local repo  = require("spice.repo")
    local sw = {
        dep     = spice._install_plugin,
        plugin  = spice._install_plugin,
        theme   = spice._install_plugin,
        lsp     = spice._install_lsp,
    }

    for _, p in pairs(pkgs) do
        if sw[p.type](repo, state, pkgs, p) then
            vim.print("Plugin failed to load")
            vim.print(p)
        end
    end

    -- install all the packages
    vim.pack.add(state.pkgs)
end

return spice
