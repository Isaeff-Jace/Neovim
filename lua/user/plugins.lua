--Basic Plugins Manager. Each Plugin will have its own .lua
--file for additional corrections


--TODO: Add bootstrap loader and autoload commands.


local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.local/nvim/plugged')

---------Plugins can begin after this line----------
--
--Nerd Tree
Plug('scrooloose/nerdtree', {on = 'NERDTreeToggle'})


vim.call('plug#end')
