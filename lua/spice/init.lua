local spice = {
    install = require("spice.install").install,
    load    = require("spice.loader").load,
}

_SPICE_STATE = {}

function spice.init()
    _SPICE_STATE = {
        metadata = {},
        pkgs = {},
    }

    return _SPICE_STATE
end

return spice
