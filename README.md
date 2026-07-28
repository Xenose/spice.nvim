# Spice: A NeoVim Plugin Loader
Spice is designed to be a minimal wrapper on-top of vim.pack.add
with dependencies and some metadata built in.

## Getting started
```lua
-- you might need to delete your ~/.config/nvim/nvim-pack-lock.json
-- to allow spice to install.
vim.pack.install({{ src = "https://github.com/Xenose/spice.nvim" }})

local spice = require("spice")
local repo  = require("spice.repo")

local state = spice.init()
local pkgs = {
    oil = repo.pkgs.oil,
}

pkgs.oil.version = vim.version.range("2.x")

spice.install(state, pkgs)
local loaded = spice.load(state)

if loaded.oil then
    -- Your code
end

```
