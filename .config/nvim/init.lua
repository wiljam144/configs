require("plugins")
require("util")
require("lsp")

vim.cmd("silent !setxkbmap -option caps:escape")

vim.opt.shortmess:append("I")

vim.cmd("set noshowmode")
--vim.cmd("colorscheme lackluster-night")
--vim.cmd("colorscheme 256_noir")
vim.cmd("colorscheme roseprime")
vim.api.nvim_set_hl(0, "Number", { fg = "#a87aff" })

vim.o.termguicolors = true
vim.o.laststatus = 3

vim.o.clipboard = "unnamedplus"

vim.cmd("syntax enable")

vim.wo.relativenumber = true
vim.wo.number = true

vim.cmd("filetype plugin indent on")
vim.bo.shiftwidth = 4
vim.bo.tabstop = 4
vim.bo.expandtab = true

vim.opt.swapfile = false

vim.g.mapleader = " "

MapTable({
  {"//", ":nohlsearch<CR>"},

  {"<leader><leader>", ":lua require('telescope.builtin').find_files {hidden = true}<CR>"},

  {"<A-e>", ":Neotree toggle=true<CR>"},

  {"<A-b>", ":b"},
  {"<A-B>", ":ls<CR>"},
  {"<A-.>", ":bn<CR>"},
  {"<A-,>", ":bp<CR>"},

  {"<A-`>", ":terminal<CR>"},
  {"<A-t>", ":TroubleToggle<CR>"},
})
