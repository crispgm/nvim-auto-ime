# nvim-auto-ime

Automatically switch Input Method (IME). It is only available on macOS.

## Features

- Switch to English IME after `InsertLeave`
- User commands to control IME

## Installation

1. Install [InputSourceSelector](https://github.com/minoki/InputSourceSelector):
    ```shell
    $ git@github.com:minoki/InputSourceSelector.git
    $ cd InputSourceSelector
    $ make
    $ sudo mv ./InputSourceSelector /usr/local/bin/
    ```
2. Install nvim-auto-ime with your favorite package manager, e.g. Lazy
    ```lua
    {
        'crispgm/nvim-auto-ime',
        config = function()
            require('auto-ime').setup({
                ime_layout = 'com.apple.keylayout.PinyinKeyboard',
                ime_method = 'com.apple.inputmethod.SCIM.ITABC',
            })
        end
    }
    ```

## Configuration

Default configuration:
```lua
{
    ime_english = 'com.apple.keylayout.ABC',
    ime_layout = '', -- must be specified
    ime_method = '', -- must be specified
}
```

## License

Copyright (c) David Zhang, 2023.
