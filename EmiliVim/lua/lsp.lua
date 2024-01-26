--[[ 
-- LSP.LUA (Parent file: ../init.lua) --
LSPConfig will be (unfortunately) used because of its wide spread support 
In many useful plugins that I just cannot ignore

CMP and its related plugins will be written here due to its relations
]]

--[[
-- INDEX --
1. LSP #001000
	a. .Setup() #001010
		i. Lsp Signature .Setup() #001011
		ii. Neodev .Setup() #001012
		iii. NullLS .Setup() #001013
		iv. LspUtils setup #001014
		v. Mason .Setup() #001015
	b. Custom Nvim Methods #001020
	c. Lsp Server Settings #001030
		i. Clangd #001031
		ii. Lua Language Server #001032
		iii. Pyright #001033
	d. Handler Settings #001040
	e. LSP Diagnostic Customisation #001050
		i. Add Custom Signs #001051
		ii. Diagnostic Settings #001052
	f. LuaSnips #001060
2. CMP #002000
	a. Cmp .Setup() #002010
	b. Cmp Filetype .Setup() #002020
3. DAP #003000
	a. Python DAP Setup #003020
	b. LLDB Setup #003030
	c. CPP Dap setup #003040
	d. DAP options #003050
	e. Dap plugins Setup #003060
]]

-- 1. _L. S. P._ -- #001000

-- > .Setup() -- #001010

-- > Lsp Signature .Setup() #001011
local lsp_signature = require("lsp_signature").setup {}

-- > Neodev .Setup() #001012
local neodev = require("neodev")
neodev.setup {}

-- > NullLS .Setup() #001013
require("null-ls").setup {
	sources = {
		require("null-ls").builtins.formatting.black,
		require("null-ls").builtins.formatting.stylua,
	},
}

-- > LspUtils setup #001014
if vim.fn.has('nvim-0.5.1') == 1 then
    vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
    vim.lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
    vim.lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
    vim.lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
    vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
    vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
    vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
    vim.lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler
else
    local bufnr = vim.api.nvim_buf_get_number(0)

    vim.lsp.handlers['textDocument/codeAction'] = function(_, _, actions)
        require('lsputil.codeAction').code_action_handler(nil, actions, nil, nil, nil)
    end

    vim.lsp.handlers['textDocument/references'] = function(_, _, result)
        require('lsputil.locations').references_handler(nil, result, { bufnr = bufnr }, nil)
    end

    vim.lsp.handlers['textDocument/definition'] = function(_, method, result)
        require('lsputil.locations').definition_handler(nil, result, { bufnr = bufnr, method = method }, nil)
    end

    vim.lsp.handlers['textDocument/declaration'] = function(_, method, result)
        require('lsputil.locations').declaration_handler(nil, result, { bufnr = bufnr, method = method }, nil)
    end

    vim.lsp.handlers['textDocument/typeDefinition'] = function(_, method, result)
        require('lsputil.locations').typeDefinition_handler(nil, result, { bufnr = bufnr, method = method }, nil)
    end

    vim.lsp.handlers['textDocument/implementation'] = function(_, method, result)
        require('lsputil.locations').implementation_handler(nil, result, { bufnr = bufnr, method = method }, nil)
    end

    vim.lsp.handlers['textDocument/documentSymbol'] = function(_, _, result, _, bufn)
        require('lsputil.symbols').document_handler(nil, result, { bufnr = bufn }, nil)
    end

    vim.lsp.handlers['textDocument/symbol'] = function(_, _, result, _, bufn)
        require('lsputil.symbols').workspace_handler(nil, result, { bufnr = bufn }, nil)
    end
end

-- > Mason .Setup() #001015
require("mason").setup {}
require("mason-lspconfig").setup {
	ensure_installed = {'lua_ls', 'rust_analyzer'}
}


-- > LspSaga .Setup() #001016
require("lspsaga").setup {
	symbol_in_winbar = {
		enable = true
	}
}

-- Custom Nvim Methods/	 On_attach/ Capabilities -- #001020
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local function custom_on_attach(client, bufnr)
	lsp_signature.on_attach({}, bufnr)
end


-- LSP Server Settings -- #001030

-- > Clangd #001031
require("lspconfig").clangd.setup {
	autostart = true,
	cmd = {
		"clangd",
		"-std=c++17",
		"--background-index",
		"--clang-tidy",
		"--header-insertion=iwyu",
		"--completion-style=detailed",
		"--function-arg-placeholders",
		--vim.fn.input("Input custom argument for clangd: ")
	},
	on_attach = function(client, bufnr)
		custom_on_attach(client, bufnr)
	end,
	capabilities = capabilities,
}

-- > Lua Language Server #001032
require("lspconfig").lua_ls.setup {
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				path = vim.split(package.path, ";"),
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				},
			},
			completion = {
				callSnippet = "Replace",
			},
		},
	},
}

-- > Pyright #001033
require("lspconfig").pyright.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		custom_on_attach(client, bufnr)
	end,
	analysis = {
		typeCheckingMode = 'off',
		diagnosticMode = 'workspace',
		autoSearchPaths = true,
		autoImportCompletions = true,
		useLibraryCodeForTypes = true,
	}
})

require("lspconfig").rust_analyzer.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		custom_on_attach(client, bufnr)
	end,
})


-- Handler Settings -- #001040
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "single",
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "single",
})

-- https://vinnymeller.com/posts/neovim_nightly_inlay_hints/
--[[
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(args.buf, true)
        end
    end
})
]]


-- LSP Diagnostic Customisation -- #001050

-- > Add Custom Signs (Copied from last config) #001051
local signs = {
	{ name = "DiagnosticSignError", text = "●" },
	{ name = "DiagnosticSignWarn", text = "●" },
	{ name = "DiagnosticSignHint", text = "●" },
	{ name = "DiagnosticSignInfo", text = "●" },
}

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

-- Diagnostic Settings (Copied from last config) #001052

local diagnostic_config = {
	virtual_text = false,
	signs = {
		active = signs,
	},
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		focusable = true,
		style = "minimal",
		border = "single", -- rounded
		source = "always",
		header = "",
		prefix = "",
	},
}

vim.diagnostic.config(diagnostic_config)

-- LuaSnips -- #001060
require("snips")

-- 2. _C. M. P._ -- #002000

-- Code is inherited from last setup

local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require('lspkind')

local check_backspace = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

-- Cmp .Setup() -- #002010
cmp.setup {
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-y>"] = cmp.config.disable,
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Down>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expandable() then
				luasnip.expand()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif check_backspace() then
				fallback()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
	},
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol",
			maxwidth = 50,
			ellipsis_char = "...",

			before = function(entry, vim_item)
			vim_item.menu = ({
				nvim_lsp = "[LSP]",
				luasnip = "[Snippet]",
				buffer = "[Buffer]",
				path = "[Path]",
			})[entry.source.name]
				return vim_item
			end,
		}),
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	window = {
		-- documentation = { border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, },
	},
	experimental = {
		ghost_text = false,
		native_menu = false,
	},
}

-- Cmp Filetype .Setup() -- #002020
cmp.setup.filetype {"gitcommit", {
	sources = cmp.config.sources {
		{ name = "git" },
	}, {
		{ name = "buffer" },
	},
}}

-- 3. _D. A. P._ -- #003000

-- Variables -- #003010
local dap = require("dap")
local dap_python = require("dap-python")
local dapui = require("dapui")
local dap_virtual = require("nvim-dap-virtual-text")

-- Run the following commands in ~/ to set up dap python
--[[
mkdir .virtualenvs
cd .virtualenvs
python -m venv debugpy
debugpy/bin/python -m pip install debugpy
]]

-- Python DAP Setup -- #003020
dap_python.setup("~/.virtualenvs/debugpy/bin/python")

table.insert(require("dap").configurations.python, {
	type = "python",
	request = "launch",
	name = "Module",
	console = "integratedTerminal",
	module = "src", -- edit this to be your app's main module
	cwd = "${workspaceFolder}",
})

-- LLDB Setup -- #003030
dap.adapters.lldb = {
	type = "executable",
	command = "/usr/bin/lldb",
	name = "lldb",
}

-- CPP Dap setup -- #003040
dap.configurations.cpp = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		program = function()
			-- return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			return vim.fn.expand("%:p")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},
	},
}

dap.adapters.cpp = function(callback, config)
	callback({ type = "server", host = config.host, port = config.port })
end

-- DAP options -- #003050
local namespace = vim.api.nvim_create_namespace("dap-hlng")
vim.api.nvim_set_hl(namespace, "DapBreakpoint", { fg = "#eaeaeb", bg = "#ffffff" })
vim.api.nvim_set_hl(namespace, "DapLogPoint", { fg = "#eaeaeb", bg = "#ffffff" })
vim.api.nvim_set_hl(namespace, "DapStopped", { fg = "#eaeaeb", bg = "#ffffff" })

vim.fn.sign_define(
	"DapBreakpoint",
	{ text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
vim.fn.sign_define(
	"DapBreakpointCondition",
	{ text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
vim.fn.sign_define(
	"DapBreakpointRejected",
	{ text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
vim.fn.sign_define(
	"DapLogPoint",
	{ text = "", texthl = "DapLogPoint", linehl = "DapLogPoint", numhl = "DapLogPoint" }
)
vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" })

-- Dap plugins Setup -- #003060
require("nvim-dap-virtual-text").setup()
require("dapui").setup()
