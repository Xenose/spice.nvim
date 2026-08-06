return {
    pkgs = {
        -- deps
        
        mini_icons = {
            name    = "mini_icons",
            type    = "dep",
            url     = "https://github.com/nvim-mini/mini.icons",
        },

        nui = {
            name    = "nui",
            type    = "dep",
            url     = "https://github.com/MunifTanjim/nui.nvim",
        },

        plenary = {
            name    = "plenary",
            type    = "dep",
            url     = "https://github.com/nvim-lua/plenary.nvim",
        },
    
        web_devicons = {
            name    = "web_devicons",
            type    = "dep",
            url     = "https://github.com/nvim-tree/nvim-web-devicons",
        },

        -- plugins

        alpha = {
            name    = "alpha",
            type    = "plugin",
            url     = "https://github.com/goolord/alpha-nvim",
            deps    = { "web_devicons", "mini_icons" },
            script  = "hello",
        },

        codesnap = {
            name    = "codesnap",
            type    = "plugin",
            url     = "https://github.com/mistricky/codesnap.nvim",
        },

        hardtime = {
            name    = "hardtime",
            type    = "plugin",
            url     = "https://github.com/m4xshen/hardtime.nvim",
        },

        lsp_lines = {
            name    = "lsp_lines",
            type    = "plugin",
            url     = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        },

        gitsigns = {
            name    = "gitsigns",
            type    = "plugin",
            url     = "https://github.com/lewis6991/gitsigns.nvim",
        },

        lualine = {
            name    = "lualine",
            type    = "plugin",
            url     = "https://github.com/nvim-lualine/lualine.nvim",
        },

        noice = {
            name    = "noice",
            type    = "plugin",
            url     = "https://github.com/folke/noice.nvim",
            deps    = { "plenary", "nui" },
        },

        oil = {
            name    = "oil",
            type    = "plugin",
            url     = "https://github.com/stevearc/oil.nvim",
        },

        notify = {
            name    = "notify",
            type    = "plugin",
            url     = "https://github.com/rcarriga/nvim-notify",
        },

        telescope = {
            name    = "telescope",
            type    = "plugin",
            url     = "https://github.com/nvim-telescope/telescope.nvim",
            deps    = { "plenary" },
        },

        neogit = {
            name    = "neogit",
            type    = "plugin",
            url     = "https://github.com/NeogitOrg/neogit",
        },

        toggleterm = {
            name    = "toggleterm", 
            type    = "plugin",
            url     = "https://github.com/akinsho/toggleterm.nvim",
        },

        -- themes
        
        tokyodark = {
            name    = "tokyodark",
            type    = "theme",
            url     = "https://github.com/tiagovla/tokyodark.nvim",
        },

        -- lsp
        bash_lsp = {
            name    = "bashls",
            type    = "lsp",
            url     = "https://github.com/bash-lsp/bash-language-server",
        },

        clangd = {
            name    = "clangd",
            type    = "lsp",
            url     = "https://github.com/clangd/clangd",
            -- script  = "clangd",
        },

        ruff = {
            name    = "ruff",
            type    = "lsp",
            url     = "https://github.com/astral-sh/ruff-lsp",
        }
    }
}
