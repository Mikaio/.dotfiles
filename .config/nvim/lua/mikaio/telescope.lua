local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    print("===================================================")
	print("HEY MIKAIO. I THINK SOMETHING DIDN'T GO WELL...")
	print("===================================================")
    return
end

telescope.load_extension('media_files')

local actions = require "telescope.actions"

telescope.setup {
    defaults = {
        color_devicons = true,
        mappings = {
            i = {
                ["<C-n>"] = actions.cycle_history_next, --	Next item in history
                ["<C-p>"] = actions.cycle_history_prev, --	Previous item in history

                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,

                ["<Down>"] = actions.move_selection_next,
                ["<Up>"] = actions.move_selection_previous,

                ["<CR>"] = actions.select_default, -- Confirm selection
                ["<C-x>"] = actions.select_horizontal, -- Go to file selection as a split
                ["<C-v>"] = actions.select_vertical, -- Go to file selection as a vsplit
                ["<C-t>"] = actions.select_tab, -- Go to a file in a new tab

                ["<C-u>"] = actions.preview_scrolling_up, -- Scroll up in preview window
                ["<C-d>"] = actions.preview_scrolling_down,	-- Scroll down in preview window

                ["<PageUp>"] = actions.results_scrolling_up,
                ["<PageDown>"] = actions.results_scrolling_down,

                ["<C-c>"] = actions.close, -- Close telescope
                ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse, -- Toggle selection and move to next selection
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,	-- Toggle selection and move to prev selection
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist, -- Send all items not filtered to quickfixlist (qflist)
                ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- Send all selected items to qflist
                ["<C-l>"] = actions.complete_tag,
                ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
            },
            n = {
                ["<esc>"] = actions.close, -- Close telescope
                ["<CR>"] = actions.select_default, -- Confirm selection
                ["<C-x>"] = actions.select_horizontal, -- Go to file selection as a split
                ["<C-v>"] = actions.select_vertical, -- Go to file selection as a vsplit
                ["<C-t>"] = actions.select_tab, -- Go to a file in a new tab

                ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse, -- Toggle selection and move to next selection
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,	-- Toggle selection and move to prev selection
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist, -- Send all items not filtered to quickfixlist (qflist)
                ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- Send all selected items to qflist
                ["?"] = actions.which_key, 

                ["<C-u>"] = actions.preview_scrolling_up, -- Scroll up in preview window
                ["<C-d>"] = actions.preview_scrolling_down,	-- Scroll down in preview window

                ["<PageUp>"] = actions.results_scrolling_up,
                ["<PageDown>"] = actions.results_scrolling_down,

                ["<Down>"] = actions.move_selection_next,
                ["<Up>"] = actions.move_selection_previous,

                ["j"] = actions.move_selection_next,
                ["k"] = actions.move_selection_previous,
                ["H"] = actions.move_to_top,
                ["M"] = actions.move_to_middle,
                ["L"] = actions.move_to_bottom,
                ["gg"] = actions.move_to_top,
                ["G"] = actions.move_to_bottom,
            }
        }
    },
    pickers = {
        find_files = {
            theme = "dropdown",
        }
    },
    extensions = {
        -- ...
        media_files = {
            -- filetypes whitelist
            -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
            filetypes = {"png", "webp", "jpg", "jpeg"},
            find_cmd = "rg" -- find command (defaults to `fd`)
        }
    }
}
