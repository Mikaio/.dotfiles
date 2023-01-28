local status_ok, configs = pcall(require, "substitute")
if not status_ok then
	return
end

configs.setup({
  on_substitute = nil,
  yank_substituted_text = false,
  range = {
    prefix = "s",
    prompt_current_text = false,
    confirm = false,
    complete_word = false,
    motion1 = false,
    motion2 = false,
    suffix = "",
  },
  exchange = {
    motion = false,
    use_esc_to_cancel = true,
  },
})
