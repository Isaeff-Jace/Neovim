local M = {}

M.echo = function(string)
    vim.cmd "redraw"
    vim.api.nvim_echo({{string, "Bold"}}, true, {})
end

local function run_shell(args)
    local output = vim.fn.system(args)
    assert(vim.v.shell_error == 0, "External call failed with error code: " .. vim.v.shell_error .. "\n" .. output)
end

M.vim_plug_bootstrap = function(path)

    M.echo("Bootstrapping VimPlug into " .. path)
    local repo = "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

    run_shell {"curl", "-fLo", path, "--create-dirs", repo}
    vim.api.nvim_command("source "..path)
    vim.api.nvim_command("source "..vim.fn.stdpath("config").."/init.lua")

    require "plugins"

    M.echo "Installing Plugins"
    vim.api.nvim_command("PlugInstall")
end

return M
