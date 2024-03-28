require("plugin_setup")

local custom_plugin_options = {
    plugins = {
        "dashboard"
    },
    lsp = {
        "lsp",
        "cmp",
        "dap",
        "snips"
    },
	settings = {
		"mappings",
		"option"
	}
}

for key, value in pairs(custom_plugin_options) do
    for _, v in pairs(value) do
        require(key ..  "." .. v)
    end
end

vim.cmd("TransparentEnable")
vim.cmd("color tokyonight")
