-- set leader key to space
vim.g.mapleader = " "

vim.g.maplocalleader = ","

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- telescope git commands
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

-- LazyGit
keymap.set("n", "<leader>gg", ":LazyGit<CR>")

keymap.set("n", "<leader>co", ":terminal<CR>")

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

-- keymap.set("n", "<leader>dro", ":lua require('dap').repl.open()<CR>")
-- keymap.set("n", "<leader>drl", ":lua require('dap').repl.run_last()<CR>")

-- keymap.set("n", "<leader>dbc", ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
-- keymap.set(
-- "n",
-- "<leader>dbm",
-- ":lua require('dap').set_breakpoint({ nil, nil, vim.fn.input('Log point message: ') })<CR>"
-- )
-- keymap.set("n", "<leader>dbt", ":lua require('dap').toggle_breakpoint()<CR>")

keymap.set("n", "<leader>dc", ":lua require('dap.ui.variables').scopes()<CR>")
keymap.set("n", "<leader>di", ":lua require('dapui').toggle()<CR>")

keymap.set("n", "<leader>p", ":lua require('nabla').popup()<CR>")

keymap.set("n", "<leader>.", ":lua require('nabla').enable_virt()<CR>")
keymap.set("n", "<leader>/", ":lua require('nabla').toggle_virt()<CR>")

-- oil nvim
keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
