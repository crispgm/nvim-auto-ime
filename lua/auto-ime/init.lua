local m = setmetatable({}, {
    __index = function(t, k)
        local ok, val = pcall(require, string.format('auto-ime.%s', k))
        if ok then
            rawset(t, k, val)
        end

        return val
    end,
})

local config = require('auto-ime.config')
function m.setup(opt)
    config.options = vim.tbl_extend('force', config.options, opt)

    local selector = require('auto-ime.selector')
    vim.api.nvim_create_user_command('AutoIMEToggle', selector.toggle_ime, {})
    vim.api.nvim_create_user_command(
        'AutoIMESwitchEn',
        selector.switch_ime_en,
        {}
    )
    vim.api.nvim_create_user_command(
        'AutoIMESwitchAlt',
        selector.switch_ime_alt,
        {}
    )
    vim.api.nvim_create_user_command('AutoIMECurrent', selector.current_ime, {})

    local augroup = vim.api.nvim_create_augroup('auto_ime', { clear = true })
    vim.api.nvim_create_autocmd(
        'InsertLeave',
        { group = augroup, pattern = '*', command = 'AutoIMESwitchEn' }
    )

    vim.g.auto_ime_selected = 'en'
end

return m
