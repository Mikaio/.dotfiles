local status_ok, comment = pcall(require, "Comment")
if not status_ok then
  return
end

require("ts_context_commentstring").setup { enable_autocmd = false }

local pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()

comment.setup {
  pre_hook = function(ctx)
    if vim.treesitter.get_parser(0, nil, { error = false }) then
      return pre_hook(ctx)
    end

    -- Comment.nvim's fallback assumes get_parser() throws when there is no parser.
    local commentstring = require("Comment.ft").get(vim.bo.filetype, ctx.ctype)
    if commentstring then
      return commentstring
    end
    if ctx.ctype == require("Comment.utils").ctype.linewise then
      return vim.bo.commentstring
    end
    error({ msg = vim.bo.filetype .. " doesn't support block comments!" })
  end,
}
