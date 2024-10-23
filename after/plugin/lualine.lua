-- Define the arduino_status function (as you have it)
local function arduino_status()
    if vim.bo.filetype ~= "arduino" then
        return ""
    end
    local port = vim.fn["arduino#GetPort"]()
    local line = string.format("[%s]", vim.g.arduino_board)
    if vim.g.arduino_programmer ~= "" then
        line = line .. string.format(" [%s]", vim.g.arduino_programmer)
    end
    if port ~= 0 then
        line = line .. string.format(" (%s:%s)", port, vim.g.arduino_serial_baud)
    end
    return line
end

-- Configure lualine
require('lualine').setup {
    options = {
        theme = 'onedark', -- or any other theme you prefer
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename', arduino_status }, -- Add the custom component here
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    extensions = {},
}
