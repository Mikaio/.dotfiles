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

nnoremap("<A-j>", "<cmd>m .+1<CR>==<CR>")
nnoremap("<A-k>", "<cmd>m .-2<CR>==<CR>")
inoremap("<A-j>", "<cmd>m+1<CR><cmd>==gi<CR>")
inoremap("<A-k>", "<cmd>m-2<CR><cmd>==gi<CR>")
