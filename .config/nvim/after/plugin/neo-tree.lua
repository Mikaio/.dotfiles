local ok, neo_tree = pcall(require, "neo-tree")
if not ok then
  return
end

neo_tree.setup({
  sources = { "filesystem", "buffers", "git_status", "document_symbols" },
  source_selector = {
    winbar = true,
    content_layout = "center",
    sources = {
      { source = "filesystem", display_name = "󰉓" },
      { source = "buffers", display_name = "󰈚" },
      { source = "git_status", display_name = "󰊢" },
      { source = "document_symbols", display_name = "" },
    },
  },
  window = {
    position = "left",
    mappings = {
      ["<C-b>"] = "none",
    },
  },
})
