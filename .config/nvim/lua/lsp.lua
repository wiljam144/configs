require("nvim-treesitter.configs").setup {
  ensure_installed = { "c", "cpp", "lua", "rust", "python", "typescript", "html", "css"},
  highlight = {
    enable = true,
  }
}

local cmp = require("cmp")

vim.cmd("set completeopt=menu,menuone,noselect")

vim.opt.pumheight = 12
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<CR>'] = cmp.mapping.confirm({select = true}),
  }),
  window = {
    completion = {
      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
      col_offset = -3,
      side_padding = 0,
      pumheight = 10,
    },
  },
  sources = cmp.config.sources(
  {
    {name = "nvim_lsp" },
  },
  {
    { name = "buffer" },
  }),
  formatting = {
    fields = { "kind", "abbr", "menu" },
    --format = lspkind.cmp_format()
    format = function(entry, vim_item)
      vim_item.menu = ""
      if (#vim_item.abbr > 20) then
        vim_item.abbr = string.sub(vim_item.abbr, 1, 20) .. "…"
      end
      local kind = require("lspkind").cmp_format({mode = "symbol_text", maxwidth = 50})(entry, vim_item)
      local strings = vim.split(kind.kind, "%s", { trimempty = true })
      kind.kind = " " .. (strings[1] or "") .. " "
      --kind.menu = "   (" .. (strings[2] or "") .. ")"
      return kind
    end,
  },
  view = {
    entries = { name = 'custom', selection_order = 'near_cursor' }
  },
})

vim.diagnostic.config({
  signs = false
})

local lsp_servers = {"clangd", "pyright", "gopls", "rust_analyzer", "tsserver"}

local capabilities = require("cmp_nvim_lsp").default_capabilities()
for lsp_servers_count = 1, #lsp_servers do
  require("lspconfig")[lsp_servers[lsp_servers_count]].setup({
    capabilities = capabilities,
  })
end

require("lspconfig").lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = {"vim"}
      }
    }
  }
})

require("mason").setup()
require("mason-lspconfig").setup()
