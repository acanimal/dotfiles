return {
  "neovim/nvim-lspconfig",
  dependencies = {
    'hrsh7th/nvim-cmp',         -- Autocompletion plugin
    'hrsh7th/cmp-nvim-lsp',     -- LSP source for nvim-cmp
    'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
    'L3MON4D3/LuaSnip',         -- Snippets plugin
    'onsails/lspkind.nvim'      -- add pictograms to suggestions
  },
  config = function()
    -- nvim-cmp supports additional completion capabilities
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    -- lsp config
    local lspconfig = require('lspconfig')

    -- configure keymaps once lsp is attached
    local on_attach = function(_, bufnr)
      vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'

      -- Buffer local mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local attach_opts = { silent = true, buffer = bufnr }
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, attach_opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, attach_opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, attach_opts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, attach_opts)
      vim.keymap.set('n', '<C-s>', vim.lsp.buf.signature_help, attach_opts)
      vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, attach_opts)
      vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, attach_opts)
      vim.keymap.set('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
        attach_opts)
      vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, attach_opts)
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, attach_opts)
      vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, attach_opts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, attach_opts)
      vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, attach_opts)
      vim.keymap.set('n', 'so', require('telescope.builtin').lsp_references, attach_opts)
    end

    -- Enable the following language servers
    local servers = { 'tsserver', 'lua_ls' }
    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
      }
    end
    -- Configuration for lua server
    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          diagnostics = { globals = { 'vim' } }
        }
      }
    })

    -- luasnip setup
    local luasnip = require 'luasnip'

    -- nvim-cmp setup
    local cmp = require 'cmp'
    local lspkind = require 'lspkind'
    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
        ['<C-d>'] = cmp.mapping.scroll_docs(4),  -- Down
        -- C-b (back) C-f (forward) for snippet placeholder navigation.
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      }),
      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
      },
      formatting = {
        format = lspkind.cmp_format({
          mode = 'text_symbol',  -- show only symbol annotations
          maxwidth = 50,         -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
          ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
          menu = ({
            buffer = "[Buffer]",
            nvim_lsp = "[LSP]",
            luasnip = "[LuaSnip]",
            nvim_lua = "[Lua]",
          })
        })
      },
      experimental = {
        ghost_text = {
          hl_group = "CmpGhostText",
        },
      },
    }
  end
}
