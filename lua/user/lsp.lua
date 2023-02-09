require("nvim-lsp-installer").setup({
	ensure_installed = {'pylsp', 'sumneko_lua', 'clangd'},
	automatic_installation = true,

	--install_root_dir = path.concat{ vim.fn.stdpath "data", "lsp_servers" },
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4
})

local conf = require("lspconfig")

--local opts = { noremap=true, silent=true }

local on_attach = function(client, bufnr)
	local bufops = { noremap=true, silent=true, buffer=bufnr }
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufops)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufops)
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufops)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufops)
end

---servers---
--
conf['pylsp'].setup{
	on_attach = on_attach,
	flags = lsp_flags,
}

conf['sumneko_lua'].setup{
	on_attach = on_attach,
	flags = lsp_flags,
}

conf['clangd'].setup{
	on_attach = on_attach,
	flags = lsp_flags,
}

