-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local plugins = {
    -- Install telescope for finding files easier
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- Install treesitter for syntax highlighting etc.
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',

    -- Install onedark colorscheme
    {
        'navarasu/onedark.nvim',
        config = function()
            require('onedark').setup({
                style = "darker",
                transparent = false,
            })
            vim.cmd [[colorscheme onedark]]
        end,
    },

    -- Install LSP related stuff
    'VonHeikemen/lsp-zero.nvim',
    'neovim/nvim-lspconfig',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    --Install autopairs for autocompleting opening parantheses etc.
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup {}
        end
    },

    -- Install emmet for webdev
    {
        "olrtg/nvim-emmet",
        config = function()
            vim.keymap.set({ "n", "v" }, '<leader>xe', require('nvim-emmet').wrap_with_abbreviation)
        end,
    },

    -- Install snippets
    "L3MON4D3/LuaSnip",
    'saadparwaiz1/cmp_luasnip',
    "rafamadriz/friendly-snippets",

    -- Install harpoon for managing a few files rapidly
    "theprimeagen/harpoon",

    -- Install lualine for aesthetic line at the bottom
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },
    },

    -- Install Nvimtree for tree style directory manager
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    },

    -- Install dressing to create popups for other plugins
    {
        "stevearc/dressing.nvim",
        event = "VeryLazy",
    },

    -- Install notify for notifications for other plugins
    {
        "rcarriga/nvim-notify",
        event = "VeryLazy",
    },

    -- Intall  Comment to easily comment lines
    {
        'numToStr/Comment.nvim',
        event = { "BufReadPre", "BufNewFile" }
    },

    -- Install surround to quickly surround parts with quotes or parantheses
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
    },

    -- Install trouble for debugging errors across whole project
    {
        "folke/trouble.nvim",
        opts = {},
        cmd = "Trouble",
    },

    -- Install alpha for greeting page on opening nvim
    {
        'goolord/alpha-nvim',
        config = function()
            require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
        end
    },

    -- Install competitest for easy testing for codeforces
    {
        'xeluxee/competitest.nvim',
        dependencies = 'MunifTanjim/nui.nvim',
        config = function()
            require('competitest').setup({
                received_contests_directory = "$(HOME)/Coding/competitive/$(JUDGE)/$(CONTEST)",
                received_problems_path = "$(HOME)/Coding/competitive/$(JUDGE)/$(CONTEST)/$(PROBLEM).$(FEXT)",
                template_file = "~/Coding/competitive/template.$(FEXT)",
            })
        end,
        lazy = true,
        cmd = "CompetiTest"
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {},
        config = function()
            require("ibl").setup {
                scope = { enabled = false },
            }
        end,
    },

    -- Install obsession to save nvim states with tmux ressurect
    "tpope/vim-obsession",

    "github/copilot.vim",

    -- Practice vim motions
    {
        "theprimeagen/vim-be-good",
        lazy = true,
        cmd = "VimBeGood"
    },

    -- Install hardtime to prevent bad habits
    {
        "m4xshen/hardtime.nvim",
        dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
        opts = {}
    },

    {
        "declancm/cinnamon.nvim",
    },

    {
        'Vigemus/iron.nvim'
    },
}
require("lazy").setup({ plugins, {} })
