local M = {}

local config = require('auto-ime.config')

local switch_ime = function(ime)
    vim.fn.system(string.format('InputSourceSelector select %s', ime))
    vim.g.auto_ime_selected = ime
end

local current_ime = function()
    local current = vim.fn.system('InputSourceSelector current')
    vim.g.auto_ime_current = current
end

M.current_ime = function()
    current_ime()
    print(vim.g.auto_ime_current)
end

M.toggle_ime = function()
    if vim.g.auto_ime_selected == 'en' then
        M.switch_ime_alt()
    else
        M.switch_ime_en()
    end
end

M.switch_ime_en = function()
    local ime = config.options.ime_english
    switch_ime(ime)
    vim.g.auto_ime_selected = 'en'
    current_ime()
end

M.switch_ime_alt = function()
    switch_ime(config.options.ime_method)
    switch_ime(config.options.ime_layout)
    vim.g.auto_ime_selected = 'alt'
    current_ime()
end

return M
