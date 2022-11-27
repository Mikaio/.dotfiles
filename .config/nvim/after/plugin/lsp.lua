local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "mikaio.lsp.mason"
require("mikaio.lsp.handlers").setup()
require "mikaio.lsp.null-ls"
