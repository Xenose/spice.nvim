local spice = {
    install = require("spice.install").install,
    load    = require("spice.loader").load,
}

function spice.init()
    return {
        metadata = {},
        pkgs = {},
    }
end

return spice
