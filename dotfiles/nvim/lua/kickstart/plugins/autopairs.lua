-- autopairs
-- https://github.com/windwp/nvim-autopairs

return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  -- Optional dependency
  dependencies = {
    'hrsh7th/nvim-cmp',
    'windwp/nvim-ts-autotag', -- for auto-closing tags
  },
  config = function()
    require('nvim-autopairs').setup {}

    -- Set up cmp integration
    local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
    local cmp = require 'cmp'
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

    -- Setup nvim-ts-autotag
    require('nvim-ts-autotag').setup {}
  end,
}
