-- keymap are automatically loaded on the VeryLazy event
-- Default keymap that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymap.sets.lua
-- Add any additional keymap here

function Map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

vim.g.mapleader = " "

-- exit insert mode with jk
-- Map("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlight
Map("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlight" })

-- increment, decrement number
Map("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
Map("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window
Map("n", "<leader>we", "<C-w>=", { desc = "Make splits equal size" })

-- tab
Map("n", "<leader><tab>F", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- move lines
-- TODO: Need to remap j,k to something else so that both hand can be used
-- Map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
-- Map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
-- Map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
-- Map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
-- Map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
-- Map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })
