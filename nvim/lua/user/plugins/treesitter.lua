-- Set the flag to skip the deprecated module in nvim-treesitter.
vim.g.skip_ts_context_commentstring_module = true

-- Treesitter configuration.
require('nvim-treesitter.configs').setup({
  ensure_installed = 'all',
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  context_commentstring = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['if'] = '@function.inner',
        ['af'] = '@function.outer',
        ['ia'] = '@parameter.inner',
        ['aa'] = '@parameter.outer',
      },
    },
  },
})

-- Standalone ts_context_commentstring setup.
require('ts_context_commentstring').setup({})

