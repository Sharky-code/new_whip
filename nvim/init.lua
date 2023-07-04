vim.cmd[[color tokyonight]]
require("plugin")

require("settings.options")
require("settings.autocommands")
require("settings.highlights")
require("settings.mappings")

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

require("ui.winbar")
require("ui.statusbar")
vim.cmd[[Gitsigns toggle_signs]]
