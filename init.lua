require("core.options")
keymappings = require("core.keymaps")

bootstrap_path = vim.fn.stdpath("data").."/site/autoload/plug.vim"

if not vim.loop.fs_stat(bootstrap_path) then
    require("core.bootstrap").vim_plug_bootstrap(bootstrap_path)
end

require("plugins").load_config_items("lua/plugins/config")
keymappings.apply_mappings()
