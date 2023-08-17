local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_buf_set_keymap

keymap(0, "n", "<Leader>dR", "<cmd>lua require'dap'.run_to_cursor()<CR>", opts)
keymap(0, "n", "<Leader>dE", "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<CR>", opts)
keymap(0, "n", "<Leader>dC", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<CR>", opts)
keymap(0, "n", "<Leader>dU", "<cmd>lua require'dapui'.toggle()<CR>", opts)
keymap(0, "n", "<Leader>db", "<cmd>lua require'dap'.step_back()<CR>", opts)
keymap(0, "n", "<Leader>dc", "<cmd>lua require'dap'.continue()<CR>", opts)
keymap(0, "n", "<Leader>dd", "<cmd>lua require'dap'.disconnect()<CR>", opts)
keymap(0, "n", "<Leader>de", "<cmd>lua require'dapui'.eval()<CR>", opts)
keymap(0, "n", "<Leader>dg", "<cmd>lua require'dap'.session()<CR>", opts)
keymap(0, "n", "<Leader>dh", "<cmd>lua require'dap.ui.widgets'.hover()<CR>", opts)
keymap(0, "n", "<Leader>dS", "<cmd>lua require'dap.ui.widgets'.scopes()<CR>", opts)
keymap(0, "n", "<Leader>di", "<cmd>lua require'dap'.step_into()<CR>", opts)
keymap(0, "n", "<Leader>do", "<cmd>lua require'dap'.step_over()<CR>", opts)
keymap(0, "n", "<Leader>dp", "<cmd>lua require'dap'.pause_toggle()<CR>", opts)
keymap(0, "n", "<Leader>dq", "<cmd>lua require'dap'.close()<CR>", opts)
keymap(0, "n", "<Leader>dr", "<cmd>lua require'dap'.repl.toggle()<CR>", opts)
keymap(0, "n", "<Leader>dx", "<cmd>lua require'dap'.terminate()<CR>", opts)
keymap(0, "n", "<Leader>du", "<cmd>lua require'dap'.step_out()<CR>", opts)

vim.cmd([[
command! DapUiEval execute "lua require'dapui'.eval(vim.fn.input '[Expression] > ')"
]])
