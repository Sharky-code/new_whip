local lspsignature = require("lsp_signature")

lspsignature.setup {
	floating_window = true,
	handler_opts = {
			border = "rounded",
	},
	hint_enable = false,
	toggle_key = "<C-k>",
}
