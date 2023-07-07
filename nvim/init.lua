--[[
TODO: Create a window that contains several buffers such as nvimtree, nvimdap and git, similar to neotree
]]

require("plugin")

vim.cmd[[color tokyonight]]

require("lsp.lspconfig")
require("lsp.lspservers")
require("lsp.lspmappings")
require("lsp.cmp")
require("lsp.dap")
require("lsp.lspsignature")

require("plugins.navic")
require("plugins.nvimtree")
require("plugins.treesitter")
require("plugins.indentblankline")
require("plugins.toggleterm")
require("plugins.autopairs")
require("plugins.git")
require("plugins.telescope")
require("plugins.bufferline")

require("settings.highlights")
require("settings.options")
require("settings.autocommands")
require("settings.mappings")

require("ui.winbar")
require("ui.statusbar")
