# Spice: A NeoVim Plugin Loader
Spice is designed to be a minimal wrapper on-top of vim.pack.add
with dependencies and some metadata built in.

## Getting started
```lua
-- you might need to delete your ~/.config/nvim/nvim-pack-lock.json
-- as if you changed your config from vim.pack to spice without installing
-- spice it might not install on startup
vim.pack.install({{ src = "https://github.com/Xenose/spice.nvim" }})

local spice = require("spice")
local repo  = require("spice.repo")

local state = spice.init()
local pkgs = {
    -- Spice should be declared at the top.
    spice   = repo.pkgs.spice,

    -- Using spice's repo file
    oil     = repo.pkgs.oil,

    -- Manual definition example
    oil = {
        -- The name is used for updates
        name    = "oil",
        -- lsp, plugin, dep or theme
        type    = "plugin",
        url     = "https://github.com/stevearc/oil.nvim",
        deps    = { "example.dep" },
    },
}

-- Pinning the version of the plugin(example only)
pkgs.oil.version = vim.version.range("2.x")

spice.install(state, pkgs)

-- We can check what plugins was loaded and adapt depending the config,
-- the values returned are booleans
local loaded = spice.load(state)

if loaded.oil then
    -- Your code
end

```

## Commands
| command           | Status  | description                        |
| ----------------- | ------- | ---------------------------------- |
| SpiceUpdate       | Added   | Updates the plugins one by one.    |
| SpiceUpdateAll    | Planned | Updates all the plugins in one go. |
