
local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

if vim.fn.has("nvim-0.12") == 1 then
    -- The legacy plugin's Markdown directives expect single nodes, whereas 0.12 passes node lists.
    local injections = vim.fn.readfile(vim.env.VIMRUNTIME .. "/queries/markdown/injections.scm")
    vim.treesitter.query.set("markdown", "injections", table.concat(injections, "\n"))
end

configs.setup({
    ensure_installed = { "bash", "c", "cpp", "javascript", "jsdoc", "json", "lua", "python", "typescript", "tsx", "css", "rust", "java", "yaml", "markdown", "markdown_inline", "go", "regex" },     sync_install = false,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    autopairs = {
		enable = true,
	},
    indent = { enable = true, disable = { "python", "css", "yaml" } },
    autotag = {
        enable = true,
    },
})
