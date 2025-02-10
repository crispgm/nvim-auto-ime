local M = {}

local config = require('auto-ime.config')

local check_dep = function()
    if vim.fn.executable('macism') ~= 1 then
        vim.api.nvim_echo({
            { 'nvim-auto-ime', 'ErrorMsg' },
            { ' ' .. 'macism not installed' },
        }, true, {})

        return false
    end

    return true
end

local switch_ime = function(ime)
    if check_dep() == false then
        return false
    end
    vim.fn.system(string.format('macism %s', ime))
    return true
end

local current_ime = function()
    if check_dep() == false then
        return false
    end
    local current = vim.fn.system('macism')
    vim.g.auto_ime_current = current

    return true
end

M.current_ime = function()
    if current_ime() == true then
        print(vim.g.auto_ime_current)
    end
end

M.toggle_ime = function()
    if vim.g.auto_ime_selected == 'default' then
        M.switch_ime_alt()
    else
        M.switch_ime_default()
    end
end

M.switch_ime_default = function()
    if switch_ime(config.options.ime_default) == false then
        return
    end
    vim.g.auto_ime_selected = 'default'
    current_ime()
end

M.switch_ime_alt = function()
    if switch_ime(config.options.ime_source) == false then
        return
    end
    vim.g.auto_ime_selected = 'alt'
    current_ime()
end

return M
