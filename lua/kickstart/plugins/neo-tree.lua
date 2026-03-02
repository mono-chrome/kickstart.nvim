-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    filesystem = {
      components = {
        name = function(config, node, state)
          local components = require 'neo-tree.sources.common.components'
          local name = components.name(config, node, state)
          if node:get_depth() == 1 then
            local parent_dir = vim.fn.fnamemodify(node.path, ':h:t')
            local current_dir = vim.fn.fnamemodify(node.path, ':t')
            name.text = parent_dir .. '/' .. current_dir
          end
          return name
        end,
      },
      window = {
        position = 'right',
        width = 34,
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
  },
}
