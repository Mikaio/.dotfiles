local Remap = require("mikaio.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

nnoremap("<C-b>", "<cmd>silent NERDTreeToggle<CR>")
inoremap("<C-b>", "<cmd>silent NERDTreeToggle<CR>")
