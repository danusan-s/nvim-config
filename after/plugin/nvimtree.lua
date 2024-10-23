require("nvim-tree").setup({
    view = {
        width = {
            min = 30,
            max = 50,
        }
    }
})

-- Open NvimTree in the parent directory of the current file
vim.keymap.set('n', '<leader>ee', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ef', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })
