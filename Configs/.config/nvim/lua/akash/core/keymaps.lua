-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- nabla keymaps
keymap.set("n", "<leader>p", ":lua require('nabla').popup()<CR>")
keymap.set("n", "<leader>.", ":lua require('nabla').enable_virt()<CR>")
keymap.set("n", "<leader>/", ":lua require('nabla').toggle_virt()<CR>")

-- DAP

keymap.set("n", "<F4>", ":lua require('dapui').toggle()<CR>")
keymap.set("n", "<F5>", ":DapToggleBreakpoint<CR>")
keymap.set("n", "<F9>", ":DapContinue<CR>")

keymap.set("n", "<F1>", ":DapStepOver<CR>")
keymap.set("n", "<F2>", ":DapStepInto<CR>")
keymap.set("n", "<F3>", ":DapStepOut<CR>")

-- keymap.set("n", "<leader>dsc", ":lua require('dap').continue()<CR>")
-- keymap.set("n", "<leader>dsv", ":lua require('dap').step_over()<CR>")
-- keymap.set("n", "<leader>dsi", ":lua require('dap').step_into()<CR>")
-- keymap.set("n", "<leader>dso", ":lua require('dap').step_out()<CR>")

keymap.set("n", "<leader>dhh", ":lua require('dap.ui.variables').hover()<CR>")
keymap.set("v", "<leader>dhv", ":lua require('dap.ui.variables').visual_hover()<CR>")

keymap.set("n", "<leader>duh", ":lua require('dap.ui.widgets').hover()<CR>")
keymap.set(
	"n",
	"<leader>duf",
	":lua local widgets=require('dap.ui.widgets');widgets.centered_float(widgets.scopes)<CR>"
)
