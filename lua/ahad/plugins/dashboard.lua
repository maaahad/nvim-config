return {
  "nvimdev/dashboard-nvim",
  lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
  opts = function()
    -- local logo = [[
    -- :::====  :::====  :::  ===  === :::====
    -- :::  === :::  === :::  ===  === :::  ===
    -- ======== =======  ===  ===  === ========
    -- ===  === === ===   ===========  ===  ===
    -- ===  === ===  ===   ==== ====   ===  ===
    -- ]]

    --     local logo = [[
    -- _________________________________________________________________________________________/\\\________________________________/\\\__
    --  ________________________________________________________________________________________\/\\\_______________________________\/\\\__
    --   ________________________________________________________________________________________\/\\\_______________________________\/\\\__
    --    __/\\\\\\\\\_____/\\/\\\\\\\___/\\____/\\___/\\__/\\\\\\\\\_______________/\\\\\\\\\____\/\\\__________/\\\\\\\\\___________\/\\\__
    --     _\////////\\\___\/\\\/////\\\_\/\\\__/\\\\_/\\\_\////////\\\_____________\////////\\\___\/\\\\\\\\\\__\////////\\\_____/\\\\\\\\\__
    --      ___/\\\\\\\\\\__\/\\\___\///__\//\\\/\\\\\/\\\____/\\\\\\\\\\______________/\\\\\\\\\\__\/\\\/////\\\___/\\\\\\\\\\___/\\\////\\\__
    --       __/\\\/////\\\__\/\\\__________\//\\\\\/\\\\\____/\\\/////\\\_____________/\\\/////\\\__\/\\\___\/\\\__/\\\/////\\\__\/\\\__\/\\\__
    --        _\//\\\\\\\\/\\_\/\\\___________\//\\\\//\\\____\//\\\\\\\\/\\___________\//\\\\\\\\/\\_\/\\\___\/\\\_\//\\\\\\\\/\\_\//\\\\\\\/\\_
    --         __\////////\//__\///_____________\///__\///______\////////\//_____________\////////\//__\///____\///___\////////\//___\///////\//__
    --     ]]

    local logo = [[
   ________  ________  ________  ________      ________  ________  ________   _______ 
  ╱        ╲╱        ╲╱  ╱  ╱  ╲╱        ╲    ╱        ╲╱    ╱   ╲╱        ╲_╱       ╲
 ╱         ╱         ╱         ╱         ╱   ╱         ╱         ╱         ╱         ╱
╱         ╱        _╱         ╱         ╱   ╱         ╱         ╱         ╱         ╱ 
╲___╱____╱╲____╱___╱╲________╱╲___╱____╱    ╲___╱____╱╲___╱____╱╲___╱____╱╲________╱  
    ]]

    logo = string.rep("\n", 8) .. logo .. "\n\n"

    local opts = {
      theme = "hyper",
      hide = {
        -- this is taken care of by lualine
        -- enabling this messes up the actual laststatus setting after loading a file
        statusline = false,
      },
      config = {
        header = vim.split(logo, "\n"),
        weak_header = {
          enable = true,
        },
        -- stylua: ignore
        shortcut = {
        {
          action = "lua LazyVim.pick()()",
          desc = " Find File",
          icon = " ",
          key = "f",
        },
        {
          action = "ene | startinsert",
          desc = " New File",
          icon = " ",
          key = "n",
        },
        {
          action = 'lua LazyVim.pick("oldfiles")()',
          desc = " Recent Files",
          icon = " ",
          key = "r",
        },
        {
          action = 'lua LazyVim.pick("live_grep")()',
          desc = " Find Text",
          icon = " ",
          key = "g",
        },
        {
          action = "lua LazyVim.pick.config_files()()",
          desc = " Config",
          icon = " ",
          key = "c",
        },
        {
          action = 'lua require("persistence").load()',
          desc = " Restore Session",
          icon = " ",
          key = "s",
        },
        {
          action = "LazyExtras",
          desc = " Lazy Extras",
          icon = " ",
          key = "x",
        },
        {
          action = "Lazy",
          desc = " Lazy",
          icon = "󰒲 ",
          key = "l",
        },
        {
          action = function()
            vim.api.nvim_input("<cmd>qa<cr>")
          end,
          desc = " Quit",
          icon = " ",
          key = "q",
        },
      },
        center = {
          -- {
          --   action = "lua LazyVim.pick()()",
          --   desc = " Find File",
          --   icon = " ",
          --   key = "f",
          -- },
          -- {
          --   action = "ene | startinsert",
          --   desc = " New File",
          --   icon = " ",
          --   key = "n",
          -- },
          -- {
          --   action = 'lua LazyVim.pick("oldfiles")()',
          --   desc = " Recent Files",
          --   icon = " ",
          --   key = "r",
          -- },
          -- {
          --   action = 'lua LazyVim.pick("live_grep")()',
          --   desc = " Find Text",
          --   icon = " ",
          --   key = "g",
          -- },
          -- {
          --   action = "lua LazyVim.pick.config_files()()",
          --   desc = " Config",
          --   icon = " ",
          --   key = "c",
          -- },
          -- {
          --   action = 'lua require("persistence").load()',
          --   desc = " Restore Session",
          --   icon = " ",
          --   key = "s",
          -- },
          -- {
          --   action = "LazyExtras",
          --   desc = " Lazy Extras",
          --   icon = " ",
          --   key = "x",
          -- },
          -- {
          --   action = "Lazy",
          --   desc = " Lazy",
          --   icon = "󰒲 ",
          --   key = "l",
          -- },
          -- {
          --   action = function()
          --     vim.api.nvim_input("<cmd>qa<cr>")
          --   end,
          --   desc = " Quit",
          --   icon = " ",
          --   key = "q",
          -- },
        },
        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
        end,
      },
    }

    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
      button.key_format = "  %s"
    end

    -- open dashboard after closing lazy
    if vim.o.filetype == "lazy" then
      vim.api.nvim_create_autocmd("WinClosed", {
        pattern = tostring(vim.api.nvim_get_current_win()),
        once = true,
        callback = function()
          vim.schedule(function()
            vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
          end)
        end,
      })
    end

    return opts
  end,
}
