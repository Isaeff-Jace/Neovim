local capabilities = require('cmp_nvim_lsp').default_capabilities()
require("nvim-lsp-installer").setup({
	ensure_installed = {'pylsp', 'clangd', 'marksman', 'rust_analyzer'},
	automatic_installation = true,

	--install_root_dir = path.concat{ vim.fn.stdpath "data", "lsp_servers" },
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4
})

local conf = require("lspconfig")
--local opts = { noremap=true, silent=true }
--
require("luasnip.loaders.from_vscode").lazy_load()

---servers---
--
conf['pylsp'].setup{
	capabilities=capabilities,
	on_attach = on_attach,
	flags = lsp_flags,
    settings = {
        pylsp = {
            plugins = {
                ruff = {enabled = true, executable = "/home/jisaeff/workspaces/hf2-venv/bin/ruff"},
                -- mypy = {enabled = true, executable = "/home/jisaeff/workspaces/hf2-venv/bin/mypy"},
            }
        }
    }
}

conf['kotlin_language_server'].setup{
	capabilities=capabilities,
	on_attach = on_attach,
	flags = lsp_flags,
}
conf['sqlls'].setup{
	capabilities=capabilities,
	on_attach = on_attach,
	flags = lsp_flags,
}
--conf['sumneko_lua'].setup{
--	on_attach = on_attach,
--	flags = lsp_flags,
--}

--conf['clangd'].setup{
--	on_attach = on_attach,
--	flags = lsp_flags,
--}

conf['marksman'].setup{
	on_attach = on_attach,
	flags = lsp_flags,
}

conf['rust_analyzer'].setup{
	on_attach = on_attach,
	flags = lsp_flags,
}

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    --vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>rf', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

--vim.g.LanguageClient_serverCommands = {'sql': ['sql-language-server', 'up', '--method', 'stdio']}
