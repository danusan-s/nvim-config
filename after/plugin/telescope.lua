local actions = require("telescope.actions")

require("telescope").setup({
    defaults = {
        path_display = { "smart" },
        mappings = {
            i = {
                ["<C-k>"] = actions.move_selection_previous, -- Move up
                ["<C-j>"] = actions.move_selection_next,     -- Move down
                ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            },
        },
        prompt_prefix = " ",
        selection_caret = " ",
        file_ignore_patterns = { "node_modules", ".git/" },
    },
    pickers = {
        -- default config for live_grep
        spell_suggest = {
            layout_strategy = "cursor",
            layout_config = {
                width = 0.2,
                height = 0.4,
            }
        }
    },
})

-- Local color definitions (only the used ones)
local colors = {
    red = "#e06c75",
    black = "#1e222a",
    black2 = "#252931",
    darker_black = "#1b1f27",
    white = "#abb2bf",
    green = "#98c379",
    blue = "#61afef",
    yellow = "#e7c787",
    one_bg = "#282c34",
    one_bg3 = "#373b43",
}

-- Telescope highlight groups
local hlgroups = {
    TelescopeNormal = { bg = colors.darker_black },

    TelescopePreviewTitle = {
        fg = colors.black,
        bg = colors.green,
    },

    TelescopePromptTitle = {
        fg = colors.black,
        bg = colors.red,
    },

    TelescopeSelection = { bg = colors.black2, fg = colors.white },
    TelescopeResultsDiffAdd = { fg = colors.green },
    TelescopeResultsDiffChange = { fg = colors.yellow },
    TelescopeResultsDiffDelete = { fg = colors.red },

    TelescopeMatching = { bg = colors.one_bg, fg = colors.blue },

    TelescopeBorder = { fg = colors.darker_black, bg = colors.darker_black },
    TelescopePromptBorder = { fg = colors.black2, bg = colors.black2 },
    TelescopePromptNormal = { fg = colors.white, bg = colors.black2 },
    TelescopeResultsNormal = { fg = colors.white, bg = colors.darker_black },
    TelescopeResultsBorder = { fg = colors.darker_black, bg = colors.darker_black },
    TelescopePreviewNormal = { fg = colors.white, bg = colors.black },
    TelescopePreviewBorder = { fg = colors.black, bg = colors.black },
    TelescopeResultsTitle = { fg = colors.darker_black, bg = colors.darker_black },
    TelescopePromptPrefix = { fg = colors.red, bg = colors.black2 },
}

-- Apply highlights
for hl, col in pairs(hlgroups) do
    vim.api.nvim_set_hl(0, hl, col)
end


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})
-- Spell suggest for documents
vim.keymap.set('n', '<leader>ss', builtin.spell_suggest, {})
