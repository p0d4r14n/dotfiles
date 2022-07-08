local map = vim.keymap
local diagnostic = vim.diagnostic

local opts = { noremap = true, silent = true }

-- Basics
map.set({ "n", "i", "v" }, "<C-s>", "<Cmd>w<CR>", opts)

-- Diagnostics
map.set("n", "<Leader>do", diagnostic.open_float, opts)
map.set("n", "<Leader>dp", diagnostic.goto_prev, opts)
map.set("n", "<Leader>dn", diagnostic.goto_next, opts)
map.set("n", "<Leader>dl", diagnostic.setloclist, opts)

-- Telescope
map.set("n", "<Leader>dg", "<Cmd>Telescope diagnostics<CR>", opts)
map.set("n", "<Leader>ff", "<Cmd>Telescope find_files hidden=true<CR>", opts)
map.set("n", "<Leader>gf", "<Cmd>Telescope git_files<CR>", opts)
map.set("n", "<Leader>lg", "<Cmd>Telescope live_grep<CR>", opts)
map.set("n", "<Leader>fb", "<Cmd>Telescope file_browser<CR>", opts)
map.set("n", "<Leader>ld", "<Cmd>Telescope lsp_definitions<CR>", opts)
map.set("n", "<Leader>lr", "<Cmd>Telescope lsp_references<CR>", opts)
map.set("n", "<Leader>li", "<Cmd>Telescope lsp_implementations<CR>", opts)
map.set("n", "<Leader>lws", "<Cmd>Telescope lsp_workspace_symbols<CR>", opts)
map.set("n", "<Leader>lds", "<Cmd>Telescope lsp_document_symbols<CR>", opts)

