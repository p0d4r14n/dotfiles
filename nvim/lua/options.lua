local o = vim.o
local wo = vim.wo
local g = vim.g
local api = vim.api

o.clipboard = "unnamedplus"
o.mouse = "a"
o.shiftwidth = 4
o.softtabstop = 4
o.tabstop = 4
o.scrolloff = 4
wo.number = true
wo.relativenumber = true
wo.wrap = false
g.mapleader = " "
api.nvim_set_hl(0, "WinSeparator", { bg = "None" })
