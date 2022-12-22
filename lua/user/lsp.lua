-- local lsp_installer = require("nvim-lsp-installer").setup {}
local lspconfig = require("lspconfig")

local function on_attach(client)

end

lspconfig.pyright.setup {on_attach = on_attach}
-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).
-- lsp_installer.on_server_ready(function(server)
--     local opts = {}
-- 
--     -- (optional) Customize the options passed to the server
--     -- if server.name == "tsserver" then
--     --     opts.root_dir = function() ... end
--     -- end
-- 
--     -- This setup() function will take the provided server configuration and decorate it with the necessary properties
--     -- before passing it onwards to lspconfig.
--     -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
--     server:setup(opts)
-- end)
