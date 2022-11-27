
local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
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
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
})
