return {
  "theprimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    -- REQUIRED
    harpoon:setup()
    -- REQUIRED

    -- keymap
    vim.keymap.set("n", "<leader>H", function()
      harpoon:list():add()
    end, { desc = "[ H ]arpoon file" })
    vim.keymap.set("n", "<leader>hh", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "[ h ]arpoon quick menu" })

    vim.keymap.set("n", "<leader>1", function()
      harpoon:list():select(1)
    end, { desc = "Harpoon to file [ 1 ]" })
    vim.keymap.set("n", "<leader>2", function()
      harpoon:list():select(1)
    end, { desc = "Harpoon to file [ 2 ]" })
    vim.keymap.set("n", "<leader>3", function()
      harpoon:list():select(1)
    end, { desc = "Harpoon to file [ 3 ]" })
    vim.keymap.set("n", "<leader>4", function()
      harpoon:list():select(1)
    end, { desc = "Harpoon to file [ 4 ]" })
    vim.keymap.set("n", "<leader>5", function()
      harpoon:list():select(1)
    end, { desc = "Harpoon to file [ 5 ]" })

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<leader>hk", function()
      harpoon:list():prev()
    end, { desc = "Previous buffer within harpoon list" })
    vim.keymap.set("n", "<leader>hj", function()
      harpoon:list():next()
    end, { desc = "Next buffer within harpoon list" })
  end,
}
