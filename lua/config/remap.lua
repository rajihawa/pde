vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
--[[
vim.keymap.set("n", "<C-m>", vim.cmd.bnext, { noremap = true, silent = true })
vim.keymap.set("n", "<C-n>", vim.cmd.bprevious, {noremap = true, silent = true })
--]]
--[[ 
local wk = require("which-key")
wk.register({
	["<C-]"] = { "Next Buffer" },
	["<C-["] = { "Previous Buffer" }
})
--]]

