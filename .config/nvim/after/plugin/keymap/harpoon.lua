local nnoremap = require("mikaio.keymap").nnoremap

local silent = { silent = true }

nnoremap("<leader>a", function() require("harpoon.mark").add_file() end, silent)
nnoremap("<leader>m", function() require("harpoon.ui").toggle_quick_menu() end, silent)
