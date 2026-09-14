return {
  {
    "williamboman/mason.nvim",
    enabled = false,
    cmd = "Mason",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup({
        automatic_installation = false,
        log_level = vim.log.levels.INFO,
        max_concurrent_installers = 4,
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    enabled = false,
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup({
        automatic_installation = false,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Apply LSP capabilities to all servers.
      vim.lsp.config('*', {
        capabilities = capabilities,
      })

      vim.lsp.config('pylsp', {
        settings = {
          pylsp = {
            plugins = {
              ruff = {
                enabled = true,
                formatEnabled = true,
                executable = "/home/jisaeff/workspaces/hf2-venv/bin/ruff",
                --extendSelect = { "I" },
                format = { "I" },
                unsafeFixes = true,
                lineLength = 79,
                targetVersion = "py311",
              },
              pylsp_mypy = {
                enabled = false,
                --executable = "/home/jisaeff/workspaces/hf2-venv/bin/mypy"
              },
            }
          }
        }
      })

      vim.lsp.enable({
        'pylsp',
      })

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
          --vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
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
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    lazy = true,
  },
  --{
  --  "tamago324/nlsp-settings.nvim",
  --  lazy = true,
  --},
  --{
  --  "stevearc/conform.nvim",
  --  event = { "BufWritePre" },
  --  cmd = { "ConformInfo" },
  --  config = function()
  --    require("conform").setup({
  --      formatters_by_ft = {},
  --    })
  --  end,
  --},
  --{
  --  "mfussenegger/nvim-lint",
  --  event = { "BufReadPost", "BufWritePost", "InsertLeave" },
  --  config = function()
  --    require("lint").linters_by_ft = {}
  --  end,
  --},
}
