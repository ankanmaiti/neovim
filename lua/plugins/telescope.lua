return {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
      dependencies = { 'nvim-lua/plenary.nvim' },
    -- change some options
    opts = {
      defaults = {
        -- Add file_ignore_patterns to ignore specific directories
        file_ignore_patterns = { "node_modules", ".git" },
      },
    }
    }
