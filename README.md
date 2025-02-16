# nvim-auto-ime

Automatically switch Input Method Editor (IME). It is only available on macOS.

## Features

- Switch to English IME after `InsertLeave`
- User commands to control IME

## Installation

1. Install [macism](https://github.com/laishulu/macism):
    ```shell
    $ brew tap laishulu/homebrew
    $ brew install macism
    ```
2. Install nvim-auto-ime with your favorite package manager, e.g. Lazy
    ```lua
    {
        'crispgm/nvim-auto-ime',
        config = function()
            require('auto-ime').setup({
                ime_source = 'com.apple.inputmethod.SCIM.ITABC',
            })
        end
    }
    ```

## Configuration

Default configuration:
```lua
{
    ime_default = 'com.apple.keylayout.ABC',
    ime_source = '', -- must be specified
}
```

You may install [minoki/InputSourceSelector](https://github.com/minoki/InputSourceSelector) and list all enabled sources:
```shell
InputSourceSelector list-enabled
```

## License

Copyright (c) David Zhang, 2025.
