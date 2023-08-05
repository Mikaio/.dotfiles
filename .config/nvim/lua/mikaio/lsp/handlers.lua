local nnoremap = require("mikaio.keymap").nnoremap

local M = {}

-- TODO: backfill this to template
M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    -- disable virtual text
    virtual_text = false,
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.documentHighlight then
    vim.api.nvim_exec(
      [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
      false
    )
  end
end

local function lsp_keymaps()
  local silent = { silent = true }
  nnoremap("gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", silent)
  nnoremap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>", silent)
  nnoremap("K", "<cmd>lua vim.lsp.buf.hover()<CR>", silent)
  nnoremap("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", silent)
  nnoremap("<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", silent)
  nnoremap("<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", silent)
  nnoremap("gr", "<cmd>lua vim.lsp.buf.references()<CR>", silent)
  nnoremap("<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", silent)
  -- nnoremap("<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", silent)
  nnoremap("[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', silent)
  nnoremap(
    "gl",
    '<cmd>lua vim.diagnostic.open_float(0, { scope = "line", border = "rounded" })<CR>',
    silent
  )
  nnoremap("]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', silent)
  nnoremap("<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", silent)
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.format()' ]]
end

M.on_attach = function(client)
  --[[ if client.name == "tsserver" then ]]
  --[[   client.server_capabilities.documentFormattingProvider = false ]]
  --[[ end ]]
  lsp_keymaps()
  lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
