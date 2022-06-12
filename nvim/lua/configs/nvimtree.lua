#! /usr/bin/env lua
--
-- nvimtree.lua
-- Copyright (C) 2022 dephilia <dephilia@MacBook-Pro.local>
--
-- Distributed under terms of the MIT license.
--

require'nvim-tree'.setup {
  actions = {
    open_file = {
      quit_on_open = false,
    }
  }
}
