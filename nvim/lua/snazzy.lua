-- =============================================================================
-- Generated by lightline to lualine theme converter
--   https://gist.github.com/shadmansaleh/000871c9a608a012721c6acc6d7a19b9
-- License: MIT License
-- =============================================================================

local colors = {
  color2   = "#f1f1f0",
  color3   = "#44485b",
  color17  = "#57c7ff",
  color6   = "#ff6ac1",
  color9   = "#858db5",
  color10  = "#626784",
  color11  = "#5af78e",
  color14  = "#fad07a",
  color0   = "#3a3d4d",
  color1   = "#ff5c57",
}

local snazzy = {
  replace = {
    a = { fg = colors.color0, bg = colors.color1 , gui = "bold", },
    b = { fg = colors.color2, bg = colors.color3 },
  },
  visual = {
    a = { fg = colors.color0, bg = colors.color6 , gui = "bold", },
    b = { fg = colors.color2, bg = colors.color3 },
  },
  inactive = {
    a = { fg = colors.color9, bg = colors.color0 , gui = "bold", },
    b = { fg = colors.color10, bg = colors.color0 },
    c = { fg = colors.color10, bg = colors.color0 },
  },
  insert = {
    a = { fg = colors.color0, bg = colors.color11 , gui = "bold", },
    b = { fg = colors.color2, bg = colors.color3 },
  },
  command = {
    a = { fg = colors.color0, bg = colors.color14 , gui = "bold", },
    b = { fg = colors.color2, bg = colors.color3 },
  },
  normal = {
    a = { fg = colors.color0, bg = colors.color17 , gui = "bold", },
    b = { fg = colors.color2, bg = colors.color3 },
    c = { fg = colors.color9, bg = colors.color0 },
  },
}

return snazzy