return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        theme = 'hyper',
        shortcut_type = 'number',
        change_to_vcs_root = false, 
        config = {
        week_header = {
            enable = true,
        },
        shortcut = {
            { desc = '✺ Fetch Problem', group = '@property', action = 'CompetiTest receive problem', key = 'f' },
            {
            icon = ' ',
            icon_hl = '@variable',
            desc = 'Files',
            group = 'Label',
            action = 'Telescope find_files',
            key = 't',
            },
            {
            desc = '✺ Fetch Contest',
            group = '@property',
            action = 'CompetiTest receive contest',
            key = 'c',
            },
        },
        footer = {'grind'}, -- footer
        },
      }
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
  }