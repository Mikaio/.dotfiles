local Remap = require("mikaio.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

nnoremap("<C-b>", "<cmd>silent NERDTreeToggle<CR>")
inoremap("<C-b>", "<cmd>silent NERDTreeToggle<CR>")

nnoremap("<leader>qw", "<cmd>tabp<CR>") -- goes to previous tab
nnoremap("<leader>op", "<cmd>tabn<CR>") -- goes to next tab

--[[ nnoremap("<A-j>", "<cmd>m .+1<CR>==<CR>") ]]
--[[ nnoremap("<A-k>", "<cmd>m .-2<CR>==<CR>") ]]
--[[ inoremap("<A-j>", "<cmd>m+1<CR><cmd>==gi<CR>") ]]
--[[ inoremap("<A-k>", "<cmd>m-2<CR><cmd>==gi<CR>") ]]

nnoremap("<leader>nd", "<cmd>lua _NODE_TOGGLE()<CR>")
nnoremap("<leader>ht", "<cmd>lua _HTOP_TOGGLE()<CR>")
nnoremap("<leader>py", "<cmd>lua _PYTHON_TOGGLE()<CR>")

--[[ if you forget how to use substitute: https://github.com/gbprod/substitute.nvim/blob/main/DEMO.md ]]
nnoremap("<leader>s", "<cmd>lua require('substitute.range').operator()<cr>")
xnoremap("<leader>s", "<cmd>lua require('substitute.range').visual()<cr>")
nnoremap("<leader>ss", "<cmd>lua require('substitute.range').word()<cr>")

nnoremap("<leader>oo", "o<Esc>")
nnoremap("<leader>OO", "O<Esc>")

nnoremap("<leader>f", "<cmd>Format<CR>")
