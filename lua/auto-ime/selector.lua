local M = {}

local config = require('auto-ime.config')

local switch_ime = function(ime)
    vim.fn.system(string.format('macism %s', ime))
end

local current_ime = function()
    local current = vim.fn.system('macism')
    vim.g.auto_ime_current = current
end

M.current_ime = function()
    current_ime()
    print(vim.g.auto_ime_current)
end

M.toggle_ime = function()
    if vim.g.auto_ime_selected == 'default' then
        M.switch_ime_alt()
    else
        M.switch_ime_default()
    end
end

M.switch_ime_default = function()
    switch_ime(config.options.ime_default)
    vim.g.auto_ime_selected = 'default'
    current_ime()
end

M.switch_ime_alt = function()
    switch_ime(config.options.ime_source)
    vim.g.auto_ime_selected = 'alt'
    current_ime()
end

return M
