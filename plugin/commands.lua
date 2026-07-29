
local function _spice_update(args)
    vim.print()

    for k, i in pairs(_SPICE_STATE.metadata) do
        vim.notify("Updating " .. k .. "!", vim.log.levels.INFO)

        if "lsp" ~= i.type then
            vim.pack.update({ i.name .. ".nvim"})
        end
    end
end

vim.api.nvim_create_user_command('SpiceUpdate', _spice_update, {})
