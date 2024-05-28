-- keymap.sets are automatically loaded on the VeryLazy event
-- Default keymap.sets that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymap.sets.lua
-- Add any additional keymap.sets here

-- local keymap.set = LazyVim.safe_keymap.set_set

local keymap = vim.keymap

-- exit insert mode with jk
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlight
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlight" })

-- increment, decrement number
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window
keymap.set("n", "<leader>we", "<C-w>=", { desc = "Make splits equal size" })

-- tab
keymap.set("n", "<leader><tab>f", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })
