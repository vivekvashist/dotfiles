-- map leader key to space
vim.g.mapleader = " "

-- map :Ex command to pv to view the current directory of a file
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
