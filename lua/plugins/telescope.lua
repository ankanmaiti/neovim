return {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
      dependencies = { 
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
'nvim-tree/nvim-web-devicons',        
    },

    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            defaults = {
        file_ignore_patterns = { "node_modules", ".git" },
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                        ["<C-j>"] = actions.move_selection_next, -- move to next result
                        ["<S-tab>"] = actions.move_selection_previous, -- move to prev result
                        ["<tab>"] = actions.move_selection_next, -- move to next result
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                    }
                }
            }
        })

        telescope.load_extension("fzf")

        -- set keymaps
        local keymap= vim.keymap-- for concisness

        keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', {desc = "Find Files (cwd)"})
        keymap.set('n', '<leader>fr', '<cmd>Telescope oldfiles<cr>', {desc = "Find Recent Files"})
        keymap.set('n', '<leader>fs', '<cmd>Telescope live_grep<cr>', {desc="Find String (cwd)"})
        keymap.set('n', '<leader>fc', '<cmd>Telescope grep_string<cr>', {desc="Find String Under Corsor (cwd)"})
    end
    }
