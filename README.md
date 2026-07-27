# Spice: A NeoVim Plugin Loader


## Getting started
```lua
vim.pack.install({ src = "https://github.com/Xenose/spice.nvim")

local spice = require("spice.spice")
local repo  = require("spice.repo")

local pkgs = {
    oil = repo.pkgs.oil,
}

spice.install(state, pkgs)
local loaded = spice.load(state)

if loaded.oil then
    -- Your code
end

```
