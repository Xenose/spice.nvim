local spice = {
    install = require("spice.install").install,
    load    = require("spice.loader").load,
}

function spice.os_blacklist(p)
    if "table" ~= type(p) then 
        return false 
    end

    for _, platform in ipairs(p) do
        if platform == _G.config.platform then 
            return true 
        end
    end

    return false
end

function spice.init()
    return {
        metadata = {},
        pkgs = {},
    }
end

function spice.find(name, tb)
    for k, p in pairs(tb) do
        if p.name == name then
            return p
        end
    end

    return nil
end

return spice
