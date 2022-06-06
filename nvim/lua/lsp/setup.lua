#! /usr/bin/env lua
--
-- setup.lua
-- Copyright (C) 2022 dephilia <dephilia@MacBook-Pro.local>
--
-- Distributed under terms of the MIT license.
--


require("nvim-lsp-installer").setup({
    ensure_installed = {
        'pyright',
        'clangd',
        'sumneko_lua',
        'rust_analyzer',
        'bashls',
        'html',
        'tsserver',
    },
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require'lspconfig'.sumneko_lua.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
  capabilities = capabilities
}

require'lspconfig'.clangd.setup{
  capabilities = capabilities
}
require'lspconfig'.rust_analyzer.setup{
  capabilities = capabilities
}
require'lspconfig'.pyright.setup{
  capabilities = capabilities
}
require'lspconfig'.bashls.setup{
  capabilities = capabilities
}
require'lspconfig'.html.setup{
  capabilities = capabilities
}
require'lspconfig'.tsserver.setup{
  capabilities = capabilities
}
