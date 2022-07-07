local map = vim.keymap

-- Telescope
map.set("n", "<Leader>td", "<Cmd>Telescope diagnostics<CR>")
map.set("n", "<Leader>tff", "<Cmd>Telescope find_files<CR>")
map.set("n", "<Leader>tgf", "<Cmd>Telescope git_files<CR>")
map.set("n", "<Leader>tlg", "<Cmd>Telescope live_grep<CR>")
map.set("n", "<Leader>tfb", "<Cmd>Telescope file_browser<CR>")
