local Remap = require("mikaio.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

local function toggle_explorer()
  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].filetype == "neo-tree" and vim.b[buf].neo_tree_position == "left" then
      vim.cmd("Neotree close left")
      return
    end
  end
  vim.cmd("Neotree filesystem left")
end

nnoremap("<C-b>", toggle_explorer)
inoremap("<C-b>", toggle_explorer)

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
