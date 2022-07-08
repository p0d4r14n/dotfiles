local nvim_lsp = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
local map = vim.keymap

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap=true, silent=true, buffer=bufnr }
	map.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	map.set("n", "gd", vim.lsp.buf.definition, bufopts)
	map.set("n", "gr", vim.lsp.buf.references, bufopts)
	map.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	map.set("n", "K", vim.lsp.buf.hover, bufopts)
	map.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	map.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	map.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	map.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	map.set("n", "<space>f", vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

nvim_lsp.rust_analyzer.setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
	settings = {
		["rust-analyzer"] = {}
	},
})
nvim_lsp.tsserver.setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})
nvim_lsp.zls.setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})
nvim_lsp.gopls.setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})
