return {
    "nvim-telescope/telescope.nvim",
    cmd = { "Telescope" },
    enabled = false,
    dependencies = {
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    keys = {
        { "<leader>b", "<cmd>FzfLua buffers<cr>", desc = "Find Buffers" },
        { "<leader>fw", "<cmd>FzfLua live_grep<cr>", desc = "Find Word" },
        { "<leader>fo", "<cmd>FzfLua oldfiles<cr>", desc = "Find OldFiles" },
        { "<leader>fh", "<cmd>FzfLua helptags<cr>", desc = "Find Help" },
        { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find Files" },
        { "<leader>fr", "<cmd>FzfLua resume<cr>", desc = "Find Resume" },
        {
            "<leader>fc",
            function()
                require('fzf-lua').files({ cwd = vim.fn.stdpath("config") })
            end,
            desc = "Find Config",
        },

        -- { "<leader>b", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
        -- { "<C-e>", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
        -- { "<leader>fw", "<cmd>Telescope live_grep<cr>", desc = "Find Word" },
        -- { "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Find OldFiles" },
        -- { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find Help" },
        -- { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
        -- {
        --     "<leader>fc",
        --     function()
        --         require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
        --     end,
        --     desc = "Find Config",
        -- },
        -- maybe check if notify exsits?
        { "<leader>fn", "<cmd>Telescope notify<cr>", desc = "Find Notify" },
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        telescope.setup({
            defaults = {
                borderchars = { "─", " ", " ", " ", "─", "─", " ", " " },
                prompt_prefix = "  ",
                selection_caret = "󰈺 ",
                layout_strategy = "vertical",
                sorting_strategy = "ascending",
                layout_config = {
                    vertical = {
                        width = 0.8,
                        height = 0.9,
                        preview_cutoff = 1,
                        mirror = true,
                        prompt_position = "top",
                    },
                },
                mappings = {
                    i = {
                        ["<C-n>"] = actions.cycle_history_next,
                        ["<C-p>"] = actions.cycle_history_prev,
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-c>"] = actions.close,
                        ["<CR>"] = actions.select_default,
                        ["<C-x>"] = actions.select_horizontal,
                        ["<C-v>"] = actions.select_vertical,
                        ["<C-u>"] = actions.preview_scrolling_up,
                        ["<C-d>"] = actions.preview_scrolling_down,
                        ["<C-t>"] = function(opts)
                            local trouble = require("trouble.providers.telescope")
                            trouble.open_with_trouble(opts)
                        end,
                    },
                    n = {
                        ["<esc>"] = actions.close,
                        ["<CR>"] = actions.select_default,
                        ["<C-x>"] = actions.select_horizontal,
                        ["<C-v>"] = actions.select_vertical,
                        ["j"] = actions.move_selection_next,
                        ["k"] = actions.move_selection_previous,
                        ["H"] = actions.move_to_top,
                        ["M"] = actions.move_to_middle,
                        ["L"] = actions.move_to_bottom,
                        ["gg"] = actions.move_to_top,
                        ["G"] = actions.move_to_bottom,
                        ["<C-u>"] = actions.preview_scrolling_up,
                        ["<C-d>"] = actions.preview_scrolling_down,
                        ["<C-t>"] = function(opts)
                            local trouble = require("trouble.providers.telescope")
                            trouble.open_with_trouble(opts)
                        end,
                    },
                },
            },
            pickers = {
                buffers = {
                    initial_mode = "normal",
                    show_all_buffers = true,
                    sort_lastused = true,
                    layout_strategy = "vertical",
                    layout_config = {
                        vertical = {
                            mirror = true,
                            prompt_position = "top",
                            width = 90,
                            preview_height = 0.6,
                        },
                    },
                    mappings = {
                        i = { ["<c-d>"] = "delete_buffer" },
                        n = { d = "delete_buffer" },
                    },
                },
            },
        })
        telescope.load_extension("fzf")
    end,
}
