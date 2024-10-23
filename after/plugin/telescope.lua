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
        selection_caret = " ",
        file_ignore_patterns = { "node_modules", ".git/" },
    },
    pickers = {
        find_files = {
            layout_strategy = 'center',
            layout_config = {
                width = 0.6,
                anchor = 'N',
            },
            theme = "dropdown",
        },
        git_files = {
            layout_strategy = 'center',
            layout_config = {
                width = 0.6,
                anchor = 'N',
            },
            theme = "dropdown",
        },
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

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})
-- Spell suggest for documents
vim.keymap.set('n', '<leader>ss', builtin.spell_suggest, {})
