#! /usr/bin/env lua
--
-- dashboard.lua
-- Copyright (C) 2022 dephilia <dephilia@MacBook-Pro.local>
--
-- Distributed under terms of the MIT license.
--

local empty_line = [[]]
local header = {
	empty_line,
	empty_line,
	empty_line,
	[[███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
	[[████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
	[[██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
	[[██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
	[[██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
	[[╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
  [[  -- Dephilia's Configutation]],
	empty_line,
	empty_line,
}


-- local home = os.getenv('HOME')
local db = require('dashboard')
db.custom_header = header
db.hide_statusline = false
db.hide_tabline = false
db.custom_center = {
    {
      icon = "  ",
      desc = 'New file                                ',
      shortcut = ":enew",
      action = "enew",
    },
    {
      icon = '  ',
      desc = 'Find File                               ',
      action = 'Telescope find_files hidden=true no_ignore=true',
      shortcut = ', f f',
    },
    -- {
    --   icon = "  ",
    --   desc = 'Update Plugins                          ',
    --   shortcut = ":PackerSync",
    --   action = "PackerSync",
    -- },
    {
      icon = "  ",
      desc = 'Close Neovim                            ',
      shortcut = ":qa!",
      action = "qa!",
    },
    -- {
    --   icon = '  ',
    --   desc = 'Find word                               ',
    --   aciton = 'Telescope live_grep',
    --   shortcut = ', f g',
    -- },
    -- {icon = '  ',
    -- desc ='File Browser                            ',
    -- action =  'Telescope file_browser',
    -- shortcut = 'SPC f b'},
    -- {icon = '  ',
    -- desc = 'Recently laset session                  ',
    -- shortcut = 'SPC s l',
    -- action ='SessionLoad'},
    -- {icon = '  ',
    -- desc = 'Recently opened files                   ',
    -- action =  'DashboardFindHistory',
    -- shortcut = 'SPC f h'},
    -- {
    --   icon = "  ",
    --   desc = "Open floating terminal                 ",
    --   shortcut = "SPC t t",
    --   action = "FloatermToggle",
    -- },
    -- {icon = '  ',
    -- desc = 'Open Personal dotfiles                  ',
    -- action = 'Telescope dotfiles path=' .. home ..'/.dotfiles',
    -- shortcut = 'SPC f d'},
  }
