return {
  'stevearc/oil.nvim',
  config = function()
    require('oil').setup {
      columns = {
        'icon',
      },
      win_options = {
        wrap = false,
        signcolumn = 'no',
        cursorcolumn = false,
        foldcolumn = '0',
        spell = false,
        list = false,
        conceallevel = 3,
        concealcursor = 'n',
      },
      restore_win_options = true,
      skip_confirm_for_simple_edits = false,
      keymaps = {
        ['g?'] = 'actions.show_help',
        ['<CR>'] = 'actions.select',
        ['<C-s>'] = 'actions.select_vsplit',
        ['<C-h>'] = 'actions.select_split',
        ['<C-p>'] = 'actions.preview',
        ['<C-c>'] = 'actions.close',
        ['<C-l>'] = 'actions.refresh',
        ['-'] = 'actions.parent',
        ['_'] = 'actions.open_cwd',
        ['`'] = 'actions.cd',
        ['~'] = 'actions.tcd',
        ['g.'] = 'actions.toggle_hidden',
      },
      use_default_keymaps = true,
      view_options = {
        show_hidden = true,
      },
      float = {
        padeing = 5,
        max_width = 100,
        max_height = 0,
        border = 'rounded',
        win_options = {
          winblend = 0,
        },
      },
    }
    vim.keymap.set('n', '<leader>pv', ':Oil --float<CR>')
  end,
}
