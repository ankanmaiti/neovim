return {
  'mfussenegger/nvim-lint',
  event = { "BufReadPre", "BufNewFile" },

  config = function ()
    local lint = require("lint")

    lint.linters_by_ft = {
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescriptreact = { "eslint_d" },
    }

    -- create auto group
    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear=true })
    vim.api.nvim_create_autocmd(
      { 'BufEnter', 'BufWritePost', 'InsertLeave' },
      {
        pattern = { "*.ts", "*.js", "*.tsx", "*.jsx" }, -- only aply on
        group = lint_augroup,
        callback = function ()
          lint.try_lint()
        end
      }
    )

    -- set keymap
    local opts={noremap=true, silent=true}

    opts.desc="Lint File"
    vim.keymap.set('n', '<leader>cl', function ()
      lint.try_lint()
    end, opts)
  end
}
