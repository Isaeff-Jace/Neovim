require("nvim-lsp-installer").setup({
	ensure_installed = {},
	automatic_installation = true,

	--install_root_dir = path.concat{ vim.fn.stdpath "data", "lsp_servers" },
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4
})

local conf = require("lspconfig")

local opts = { noremap=true, silent=true }

local on_attach = function(client, bufnr)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
end

---servers---
--
conf['pyright'].setup{
	on_attach = on_attach,
	flags = lsp_flags,
}

conf['sumneko_lua'].setup{
	on_attach = on_attach,
	flags = lsp_flags,
}
