local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "metalelf0/base16-black-metal-scheme",
  "slugbyte/lackluster.nvim",
  "cdmill/neomodern.nvim",
  "miikanissi/modus-themes.nvim",
  "andreasvc/vim-256noir",

  "nvim-lualine/lualine.nvim",

  "windwp/nvim-autopairs",
  "tpope/vim-sleuth",
  "takac/vim-hardtime",
  "lukas-reineke/indent-blankline.nvim",

  {"nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "kyazdani42/nvim-web-devicons",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    }
  },

  {"nvim-telescope/telescope.nvim",
    dependencies = {
      "kyazdani42/nvim-web-devicons",
    },
    lazy = false,
  },

  {"christoomey/vim-tmux-navigator",
    lazy = false
  },

  "nvim-treesitter/nvim-treesitter",
  "neovim/nvim-lspconfig",
  "onsails/lspkind.nvim",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",

  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/nvim-cmp",

  "folke/trouble.nvim",
})

require("lualine").setup()
require("nvim-autopairs").setup({map_cr = true})
require("ibl").setup({
  exclude = {
    filetypes = {
      "dashboard"
    }
  }
})

require("neo-tree").setup({
  filesystem = {
    filtered_items = {
      visible = "hide",
      hide_dotfiles = false,
    }
  }
})

