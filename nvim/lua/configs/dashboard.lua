#! /usr/bin/env lua
--
-- dashboard.lua
-- Copyright (C) 2022 dephilia <dephilia@MacBook-Pro.local>
--
-- Distributed under terms of the MIT license.
--

local header = {
' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
'  -- Dephilia\'s Configuration                         ',
'',
'',
}

local db = require('dashboard')
db.custom_header = header
db.custom_center = {
    {
      icon = "  ",
      desc = 'New file                                 ',
      shortcut = "<leader> b o",
      action = "DashboardNewFile",
    },
    {
      icon = '  ',
      desc = 'Find File                                ',
      action = 'Telescope find_files hidden=true no_ignore=true',
      shortcut = '<leader> f f',
    },
    {
      icon = '  ',
      desc = 'Marks                                    ',
      action = 'Telescope marks',
      shortcut = '<leader> f m'
    },
    {
      icon = '  ',
      desc = 'Find word                                ',
      shortcut = '<leader> f g',
      action = 'Telescope live_grep',
    },
    {
      icon = "  ",
      desc = 'Update Plugins                           ',
      shortcut = ":PackerSync",
      action = "PackerSync",
    },
    {
      icon = "  ",
      desc = 'Close Neovim                             ',
      shortcut = ":qa!       ",
      action = "qa!",
    },
  }

vim.highlight.create('DashboardHeader',     {guifg='#A0E7E5'}, false)
vim.highlight.create('DashboardCenter',     {guifg='#FFAEBC'}, false)
vim.highlight.create('DashboardCenterIcon', {guifg='#B4F8C8'}, false)
vim.highlight.create('DashboardShortCut',   {guifg='#FBE7C6'}, false)
vim.highlight.create('DashboardFooter',     {guifg='lightgrey'}, false)
