local source = '~/Documents/Wallpaper/EMT 4.png'
local buf = vim.api.nvim_get_current_buf()
image = require"hologram.image":new(source, {
    format = 100, -- format in which image data is sent
    transmission_type = 't', -- transmission medium used
    data_width = 400, -- px. width of image
    data_height = 500, -- px. height of image
})

-- Image should appear below this line, then disappear after 5 seconds

image:display(5, 0, buf, {})

vim.defer_fn(function()
    image:delete(0, {free = true})
end, 5000)
