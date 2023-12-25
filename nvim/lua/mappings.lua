--[[
-- MAPPINGS.LUA -- (Parent file: init.lua)
]]

--[[
-- INDEX -- 
	a. .Setup() #000010
	b. Register #000020
	c. FloatTerm #000030
]]

-- .Setup() -- #000010
require("which-key").setup()

-- Register -- #000020
require("which-key").register {
	["<F1>"] = { "<cmd> lua require('runfile').main() <CR>", "Runfile" },
	["<F2>"] = { ":Telescope <CR>", "Runfile" },
	["<F3>"] = { ":Telescope file_browser <CR>", "Runfile" },
	["<F4>"] = { ":Telescope undo <CR>", "Runfile" },
}

-- FloatTerm -- #000030

vim.cmd[[
nnoremap   <silent>   <F7>    :FloatermNew<CR>
tnoremap   <silent>   <F7>    <C-\><C-n>:FloatermNew<CR>
nnoremap   <silent>   <F8>    :FloatermPrev<CR>
tnoremap   <silent>   <F8>    <C-\><C-n>:FloatermPrev<CR>
nnoremap   <silent>   <F9>    :FloatermNext<CR>
tnoremap   <silent>   <F9>    <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   <F12>   :FloatermToggle<CR>
tnoremap   <silent>   <F12>   <C-\><C-n>:FloatermToggle<CR>
]]
